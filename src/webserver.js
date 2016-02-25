
'use strict';

var path = require('path'),
	fs = require('fs'),
	nconf = require('nconf'),
	express = require('express'),
	app = express(),
	server,
	winston = require('winston'),
	async = require('async'),

	emailer = require('./emailer'),
	meta = require('./meta'),
	logger = require('./logger'),
	plugins = require('./plugins'),
	middleware = require('./middleware'),
	routes = require('./routes'),
	emitter = require('./emitter'),

	helpers = require('../public/src/modules/helpers');

if (nconf.get('ssl')) {
	server = require('https').createServer({
		key: fs.readFileSync(nconf.get('ssl').key),
		cert: fs.readFileSync(nconf.get('ssl').cert)
	}, app);
} else {
	server = require('http').createServer(app);
}

module.exports.server = server;

server.on('error', function(err) {
	winston.error(err);
	if (err.code === 'EADDRINUSE') {
		winston.error('应用地址在使用, 退出...');
		process.exit(0);
	} else {
		throw err;
	}
});


module.exports.listen = function() {
	emailer.registerApp(app);

	middleware = middleware(app);

	helpers.register();

	logger.init(app);

	emitter.all(['templates:compiled', 'meta:js.compiled', 'meta:css.compiled'], function() {
		winston.info('应用就绪');
		emitter.emit('nodebb:ready');
		listen();
	});

	initializeNodeBB(function(err) {
		if (err) {
			winston.error(err);
			process.exit();
		}
		if (process.send) {
			process.send({
				action: 'ready'
			});
		}
	});
};

function initializeNodeBB(callback) {
	var skipJS, skipLess, fromFile = nconf.get('from-file') || '';

	if (fromFile.match('js')) {
		winston.info('[minifier] Minifying client-side JS skipped');
		skipJS = true;
	}

	if (fromFile.match('less')) {
		winston.info('[minifier] Compiling LESS files skipped');
		skipLess = true;
	}

	async.waterfall([
		async.apply(cacheStaticFiles),
		async.apply(meta.themes.setupPaths),
		function(next) {
			plugins.init(app, middleware, next);
		},
		function(next) {
			async.parallel([
				async.apply(meta.templates.compile),
				async.apply(!skipJS ? meta.js.minify : meta.js.getFromFile, 'nodebb.min.js'),
				async.apply(!skipJS ? meta.js.minify : meta.js.getFromFile, 'acp.min.js'),
				async.apply(!skipLess ? meta.css.minify : meta.css.getFromFile),
				async.apply(meta.sounds.init)
			], next);
		},
		function(results, next) {
			plugins.fireHook('static:app.preload', {
				app: app,
				middleware: middleware
			}, next);
		},
		function(next) {
			routes(app, middleware);
			next();
		}
	], callback);
}

function cacheStaticFiles(callback) {
	if (global.env === 'development') {
		return callback();
	}

	app.enable('cache');
	app.enable('minification');
	callback();
}

function listen(callback) {
	var port = parseInt(nconf.get('port'), 10);

	if (Array.isArray(port)) {
		if (!port.length) {
			winston.error('[startup] empty ports array in config.json');
			process.exit();
		}

		winston.warn('[startup] 如果你想为应用开多个端口，请使用 loader.js');
		winston.warn('[startup] 默认为数组中的第一个端口, ' + port[0]);
		port = port[0];
		if (!port) {
			winston.error('[startup] 无效的端口, 退出');
			process.exit();
		}
	}

	if ((port !== 80 && port !== 443) || nconf.get('trust_proxy') === true) {
		winston.info('Enabling \'trust proxy\'');
		app.enable('trust proxy');
	}

	if ((port === 80 || port === 443) && process.env.NODE_ENV !== 'development') {
		winston.info('不推荐端口号使用 80 and 443 ; 使用代理来代替. See README.md');
	}

	var isSocket = isNaN(port),
		args = isSocket ? [port] : [port, nconf.get('bind_address')],
		bind_address = ((nconf.get('bind_address') === "0.0.0.0" || !nconf.get('bind_address')) ? '0.0.0.0' : nconf.get('bind_address')) + ':' + port,
		oldUmask;

	args.push(function(err) {
		if (err) {
			winston.info('[startup] 应用无法监听: ' + bind_address);
			process.exit();
		}

		winston.info('应用现在监听: ' + (isSocket ? port : bind_address));
		if (oldUmask) {
			process.umask(oldUmask);
		}
	});

	// Alter umask if necessary
	if (isSocket) {
		oldUmask = process.umask('0000');
		module.exports.testSocket(port, function(err) {
			if (!err) {
				server.listen.apply(server, args);
			} else {
				winston.error('[startup] app was unable to secure domain socket access (' + port + ')');
				winston.error('[startup] ' + err.message);
				process.exit();
			}
		});
	} else {
		server.listen.apply(server, args);
	}
}

module.exports.testSocket = function(socketPath, callback) {
	if (typeof socketPath !== 'string') {
		return callback(new Error('invalid socket path : ' + socketPath));
	}
	var net = require('net');
	var file = require('./file');
	async.series([
		function(next) {
			file.exists(socketPath, function(exists) {
				if (exists) {
					next();
				} else {
					callback();
				}
			});
		},
		function(next) {
			var testSocket = new net.Socket();
			testSocket.on('error', function(err) {
				next(err.code !== 'ECONNREFUSED' ? err : null);
			});
			testSocket.connect({ path: socketPath }, function() {
				// Something's listening here, abort
				callback(new Error('port-in-use'));
			});
		},
		async.apply(fs.unlink, socketPath),	// The socket was stale, kick it out of the way
	], callback);
};


