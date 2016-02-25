'use strict';

var path = require('path'),
	fs = require('fs'),
	async = require('async'),
	semver = require('semver'),
	winston = require('winston'),

	pkg = require('../../package.json');

module.exports = function(Meta) {
	Meta.dependencies = {};

	Meta.dependencies.check = function(callback) {
		var modules = Object.keys(pkg.dependencies);
		winston.verbose('检查过时的模块的依赖');

		async.every(modules, function(module, next) {
			fs.readFile(path.join(__dirname, '../../node_modules/', module, 'package.json'), {
				encoding: 'utf-8'
			}, function(err, pkgData) {
				// If a bundled plugin/theme is not present, skip the dep check (#3384)
				if (err && err.code === 'ENOENT' && (module === 'nodebb-rewards-essentials' || module.startsWith('nodebb-plugin') || module.startsWith('nodebb-theme'))) {
					winston.warn('[meta/dependencies] Bundled plugin ' + module + ' not found, skipping dependency check.');
					return next(true);
				}

				try {
					pkgData = JSON.parse(pkgData);
					var ok = !semver.validRange(pkg.dependencies[module]) || semver.satisfies(pkgData.version, pkg.dependencies[module]);

					if (ok || (pkgData._resolved && pkgData._resolved.indexOf('//github.com') !== -1)) {
						next(true);
					} else {
						process.stdout.write('[' + 'outdated'.yellow + '] ' + module.bold + ' installed v' + pkgData.version + ', package.json requires ' + pkg.dependencies[module] + '\n');
						next(false);
					}
				} catch(e) {
					winston.error('[meta/dependencies] Could not read: ' + module);
					process.exit();
				}
			});
		}, function(ok) {
			callback(!ok && global.env !== 'development' ? new Error('dependencies-out-of-date') : null);
		});
	};
};
