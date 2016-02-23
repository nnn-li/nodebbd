'use strict';

var async = require('async');
var nconf = require('nconf');

var db = require('../../database');
var meta = require('../../meta');
var plugins = require('../../plugins');

var dashboardController = {};


dashboardController.get = function(req, res, next) {
	async.parallel({
		stats: function(next) {
			getStats(next);
		},
		notices: function(next) {
			var notices = [
				{
					done: !meta.reloadRequired,
					doneText: '不要求刷新',
					notDoneText:'需要重新加载'
				},
				{
					done: plugins.hasListeners('filter:search.query'),
					doneText: '搜索插件安装',
					notDoneText:'没有安装搜索插件',
					tooltip: '为了激活搜索功能从安装插件页面搜索插件',
					link:'/admin/extend/plugins'
				}
			];
			plugins.fireHook('filter:admin.notices', notices, next);
		}
	}, function(err, results) {
		if (err) {
			return next(err);
		}
		res.render('admin/general/dashboard', {
			version: nconf.get('version'),
			notices: results.notices,
			stats: results.stats
		});
	});
};

function getStats(callback) {
	async.parallel([
		function(next) {
			getStatsForSet('ip:recent', 'uniqueIPCount', next);
		},
		function(next) {
			getStatsForSet('users:joindate', 'userCount', next);
		},
		function(next) {
			getStatsForSet('posts:pid', 'postCount', next);
		},
		function(next) {
			getStatsForSet('topics:tid', 'topicCount', next);
		}
	], function(err, results) {
		if (err) {
			return callback(err);
		}
		results[0].name = 'Unique Visitors';
		results[1].name = 'Users';
		results[2].name = 'Posts';
		results[3].name = 'Topics';

		callback(null, results);
	});
}

function getStatsForSet(set, field, callback) {
	var terms = {
		day: 86400000,
		week: 604800000,
		month: 2592000000
	};

	var now = Date.now();
	async.parallel({
		day: function(next) {
			db.sortedSetCount(set, now - terms.day, now, next);
		},
		week: function(next) {
			db.sortedSetCount(set, now - terms.week, now, next);
		},
		month: function(next) {
			db.sortedSetCount(set, now - terms.month, now, next);
		},
		alltime: function(next) {
			getGlobalField(field, next);
		}
	}, callback);
}

function getGlobalField(field, callback) {
	db.getObjectField('global', field, function(err, count) {
		callback(err, parseInt(count, 10) || 0);
	});
}

module.exports = dashboardController;