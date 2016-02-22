'use strict';

var cronJob = require('cron').CronJob;
var db = require('./database');

(function(Analytics) {

	var pageViews = 0;
	var uniqueIPCount = 0;
	var uniquevisitors = 0;

	new cronJob('*/10 * * * *', function() {
		Analytics.writeData();
	}, null, true);

	Analytics.pageView = function(ip) {
		++pageViews;

		if (ip) {
			db.sortedSetScore('ip:recent', ip, function(err, score) {
				if (err) {
					return;
				}
				if (!score) {
					++uniqueIPCount;
				}
				var today = new Date();
				today.setHours(today.getHours(), 0, 0, 0);
				if (!score || score < today.getTime()) {
					++uniquevisitors;
					db.sortedSetAdd('ip:recent', Date.now(), ip);
				}
			});
		}
	};

	Analytics.writeData = function() {

		var today;
		if (pageViews > 0 || uniquevisitors > 0) {
			today = new Date();
			today.setHours(today.getHours(), 0, 0, 0);
		}

		if (pageViews > 0) {
			db.sortedSetIncrBy('analytics:pageviews', pageViews, today.getTime());
			var month = new Date();
			month.setMonth(month.getMonth(), 1);
			month.setHours(0, 0, 0, 0);
			db.sortedSetIncrBy('analytics:pageviews:month', pageViews, month.getTime());
			pageViews = 0;
		}

		if (uniquevisitors > 0) {
			db.sortedSetIncrBy('analytics:uniquevisitors', uniquevisitors, today.getTime());
			uniquevisitors = 0;
		}

		if (uniqueIPCount > 0) {
			db.incrObjectFieldBy('global', 'uniqueIPCount', uniqueIPCount);
			uniqueIPCount = 0;
		}


	};

	Analytics.getUnwrittenPageviews = function() {
		return pageViews;
	};

	Analytics.getMonthlyPageViews = function(callback) {
		var thisMonth = new Date();
		var lastMonth = new Date();
		thisMonth.setMonth(thisMonth.getMonth(), 1);
		thisMonth.setHours(0, 0, 0, 0);
		lastMonth.setMonth(thisMonth.getMonth() - 1, 1);
		lastMonth.setHours(0, 0, 0, 0);

		var values = [thisMonth.getTime(), lastMonth.getTime()];

		db.sortedSetScores('analytics:pageviews:month', values, function(err, scores) {
			if (err) {
				return callback(err);
			}
			callback(null, {thisMonth: scores[0] || 0, lastMonth: scores[1] || 0});
		});
	};

}(exports));