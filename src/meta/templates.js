"use strict";

var mkdirp = require('mkdirp'),
	rimraf = require('rimraf'),
	winston = require('winston'),
	async = require('async'),
	path = require('path'),
	fs = require('fs'),
	nconf = require('nconf'),

	emitter = require('../emitter'),
	plugins = require('../plugins'),
	utils = require('../../public/src/utils'),

	Templates = {};

Templates.compile = function(callback) {
	callback = callback || function() {};
	var fromFile = nconf.get('from-file') || '';

	if (nconf.get('isPrimary') === 'false' || fromFile.match('tpl')) {
		if (fromFile.match('tpl')) {
			winston.info('[minifier] Compiling templates skipped');
		}

		emitter.emit('templates:compiled');
		return callback();
	}

	var coreTemplatesPath = nconf.get('core_templates_path'),
		baseTemplatesPath = nconf.get('base_templates_path'),
		viewsPath = nconf.get('views_dir'),
		themeTemplatesPath = nconf.get('theme_templates_path'),
		themeConfig = require(nconf.get('theme_config'));

	if (themeConfig.baseTheme) {
		var pathToBaseTheme = path.join(nconf.get('themes_path'), themeConfig.baseTheme);
		baseTemplatesPath = require(path.join(pathToBaseTheme, 'theme.json')).templates;

		if (!baseTemplatesPath){
			baseTemplatesPath = path.join(pathToBaseTheme, 'templates');
		}
	}

	async.waterfall([
		async.apply(plugins.fireHook, 'static:templates.precompile', {}),
		async.apply(plugins.getTemplates)
	], function(err, pluginTemplates) {
		if (err) {
			return callback(err);
		}

		winston.verbose('[meta/templates] Compiling templates');
		rimraf.sync(viewsPath);
		mkdirp.sync(viewsPath);

		async.parallel({
			coreTpls: function(next) {
				utils.walk(coreTemplatesPath, next);
			},
			baseTpls: function(next) {
				utils.walk(baseTemplatesPath, next);
			}
		}, function(err, data) {
			var coreTpls = data.coreTpls,
				baseTpls = data.baseTpls,
				paths = {};

			if (!baseTpls) {
				winston.warn('[meta/templates] Could not find base template files at: ' + baseTemplatesPath);
			}

			coreTpls = !coreTpls ? [] : coreTpls.map(function(tpl) { return tpl.replace(coreTemplatesPath, ''); });
			baseTpls = !baseTpls ? [] : baseTpls.map(function(tpl) { return tpl.replace(baseTemplatesPath, ''); });

			coreTpls.forEach(function(el, i) {
				paths[coreTpls[i]] = path.join(coreTemplatesPath, coreTpls[i]);
			});

			baseTpls.forEach(function(el, i) {
				paths[baseTpls[i]] = path.join(baseTemplatesPath, baseTpls[i]);
			});

			for (var tpl in pluginTemplates) {
				if (pluginTemplates.hasOwnProperty(tpl)) {
					paths[tpl] = pluginTemplates[tpl];
				}
			}

			async.each(Object.keys(paths), function(relativePath, next) {
				var file = fs.readFileSync(paths[relativePath]).toString(),
					matches = null,
					regex = /[ \t]*<!-- IMPORT ([\s\S]*?)? -->[ \t]*/;

				while((matches = file.match(regex)) !== null) {
					var partial = "/" + matches[1];

					if (paths[partial] && relativePath !== partial) {
						file = file.replace(regex, fs.readFileSync(paths[partial]).toString());
					} else {
						winston.warn('[meta/templates] Partial not loaded: ' + matches[1]);
						file = file.replace(regex, "");
					}
				}

				if (relativePath.match(/^\/admin\/[\s\S]*?/)) {
					addIndex(relativePath, file);
				}

				mkdirp.sync(path.join(viewsPath, relativePath.split('/').slice(0, -1).join('/')));
				fs.writeFile(path.join(viewsPath, relativePath), file, next);
			}, function(err) {
				if (err) {
					winston.error('[meta/templates] ' + err.stack);
					return callback(err);
				}

				compileIndex(viewsPath, function() {
					winston.verbose('[meta/templates] Successfully compiled templates.');

					emitter.emit('templates:compiled');
					if (process.send) {
						process.send({
							action: 'templates:compiled'
						});
					}
					callback();
				});
			});
		});
	});
};

var searchIndex = {};

function addIndex(path, file) {
	searchIndex[path] = file;
}

function compileIndex(viewsPath, callback) {
	fs.writeFile(path.join(viewsPath, '/indexed.json'), JSON.stringify(searchIndex), callback);
}

module.exports = Templates;