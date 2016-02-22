
'use strict';

var	async = require('async'),
	meta = require('../meta'),
	db = require('../database'),
	plugins = require('../plugins');

module.exports = function(User) {

	User.getSettings = function(uid, callback) {
		if (!parseInt(uid, 10)) {
			return onSettingsLoaded(0, {}, callback);
		}

		db.getObject('user:' + uid + ':settings', function(err, settings) {
			if (err) {
				return callback(err);
			}

			onSettingsLoaded(uid, settings ? settings : {}, callback);
		});
	};

	User.getMultipleUserSettings = function(uids, callback) {
		if (!Array.isArray(uids) || !uids.length) {
			return callback(null, []);
		}

		var keys = uids.map(function(uid) {
			return 'user:' + uid + ':settings';
		});

		db.getObjects(keys, function(err, settings) {
			if (err) {
				return callback(err);
			}

			for (var i=0; i<settings.length; ++i) {
				settings[i] = settings[i] || {};
				settings[i].uid = uids[i];
			}

			async.map(settings, function(setting, next) {
				onSettingsLoaded(setting.uid, setting, next);
			}, callback);
		});
	};

	function onSettingsLoaded(uid, settings, callback) {
		plugins.fireHook('filter:user.getSettings', {uid: uid, settings: settings}, function(err, data) {
			if (err) {
				return callback(err);
			}

			settings = data.settings;

			var defaultTopicsPerPage = parseInt(meta.config.topicsPerPage, 10) || 20;
			var defaultPostsPerPage = parseInt(meta.config.postsPerPage, 10) || 20;

			settings.showemail = parseInt(settings.showemail, 10) === 1;
			settings.showfullname = parseInt(settings.showfullname, 10) === 1;
			settings.openOutgoingLinksInNewTab = parseInt(getSetting(settings, 'openOutgoingLinksInNewTab', 0), 10) === 1;
			settings.dailyDigestFreq = getSetting(settings, 'dailyDigestFreq', 'off');
			settings.usePagination = parseInt(getSetting(settings, 'usePagination', 0), 10) === 1;
			settings.topicsPerPage = Math.min(settings.topicsPerPage ? parseInt(settings.topicsPerPage, 10) : defaultTopicsPerPage, defaultTopicsPerPage);
			settings.postsPerPage = Math.min(settings.postsPerPage ? parseInt(settings.postsPerPage, 10) : defaultPostsPerPage, defaultPostsPerPage);
			settings.notificationSounds = parseInt(settings.notificationSounds, 10) === 1;
			settings.userLang = settings.userLang || meta.config.defaultLang || 'en_GB';
			settings.topicPostSort = getSetting(settings, 'topicPostSort', 'oldest_to_newest');
			settings.categoryTopicSort = getSetting(settings, 'categoryTopicSort', 'newest_to_oldest');
			settings.followTopicsOnCreate = parseInt(getSetting(settings, 'followTopicsOnCreate', 1), 10) === 1;
			settings.followTopicsOnReply = parseInt(getSetting(settings, 'followTopicsOnReply', 0), 10) === 1;
			settings.sendChatNotifications = parseInt(getSetting(settings, 'sendChatNotifications', 0), 10) === 1;
			settings.sendPostNotifications = parseInt(getSetting(settings, 'sendPostNotifications', 0), 10) === 1;
			settings.restrictChat = parseInt(settings.restrictChat, 10) === 1;
			settings.topicSearchEnabled = parseInt(getSetting(settings, 'topicSearchEnabled', 0), 10) === 1;
			settings.bootswatchSkin = settings.bootswatchSkin || 'default';

			callback(null, settings);
		});
	}

	function getSetting(settings, key, defaultValue) {
		if (settings[key] || settings[key] === 0) {
			return settings[key];
		} else if (meta.config[key] || meta.config[key] === 0) {
			return meta.config[key];
		}
		return defaultValue;
	}

	User.saveSettings = function(uid, data, callback) {
		if (invalidPaginationSettings(data)) {
			return callback(new Error('[[error:invalid-pagination-value]]'));
		}

		data.userLang = data.userLang || meta.config.defaultLang;

		plugins.fireHook('action:user.saveSettings', {uid: uid, settings: data});

		var settings = {
			showemail: data.showemail,
			showfullname: data.showfullname,
			openOutgoingLinksInNewTab: data.openOutgoingLinksInNewTab,
			dailyDigestFreq: data.dailyDigestFreq || 'off',
			usePagination: data.usePagination,
			topicsPerPage: Math.min(data.topicsPerPage, parseInt(meta.config.topicsPerPage, 10) || 20),
			postsPerPage: Math.min(data.postsPerPage, parseInt(meta.config.postsPerPage, 10) || 20),
			notificationSounds: data.notificationSounds,
			userLang: data.userLang || meta.config.defaultLang,
			followTopicsOnCreate: data.followTopicsOnCreate,
			followTopicsOnReply: data.followTopicsOnReply,
			sendChatNotifications: data.sendChatNotifications,
			sendPostNotifications: data.sendPostNotifications,
			restrictChat: data.restrictChat,
			topicSearchEnabled: data.topicSearchEnabled,
			groupTitle: data.groupTitle,
			homePageRoute: data.homePageCustom || data.homePageRoute
		};

		if (data.bootswatchSkin) {
			settings.bootswatchSkin = data.bootswatchSkin;
		}

		async.waterfall([
			function(next) {
				db.setObject('user:' + uid + ':settings', settings, next);
			},
			function(next) {
				updateDigestSetting(uid, data.dailyDigestFreq, next);
			},
			function(next) {
				User.getSettings(uid, next);
			}
		], callback);
	};

	function invalidPaginationSettings(data) {
		return !data.topicsPerPage || !data.postsPerPage ||
			parseInt(data.topicsPerPage, 10) <= 0 || parseInt(data.postsPerPage, 10) <= 0 ||
			parseInt(data.topicsPerPage, 10) > meta.config.topicsPerPage || parseInt(data.postsPerPage, 10) > meta.config.postsPerPage;
	}

	function updateDigestSetting(uid, dailyDigestFreq, callback) {
		async.waterfall([
			function(next) {
				db.sortedSetsRemove(['digest:day:uids', 'digest:week:uids', 'digest:month:uids'], uid, next);
			},
			function(next) {
				if (['day', 'week', 'month'].indexOf(dailyDigestFreq) !== -1) {
					db.sortedSetAdd('digest:' + dailyDigestFreq + ':uids', Date.now(), uid, next);
				} else {
					next();
				}
			}
		], callback);
	}

	User.setSetting = function(uid, key, value, callback) {
		db.setObjectField('user:' + uid + ':settings', key, value, callback);
	};

	User.setGroupTitle = function(groupName, uid, callback) {
		if (groupName === 'registered-users') {
			return callback();
		}
		db.getObjectField('user:' + uid + ':settings', 'groupTitle', function(err, currentTitle) {
			if (err || (currentTitle || currentTitle === '')) {
				return callback(err);
			}

			User.setSetting(uid, 'groupTitle', groupName, callback);
		});
	};
};
