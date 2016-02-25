
'use strict';

var async = require('async');
var request = require('request');

var db = require('../database');
var meta = require('../meta');
var emailer = require('../emailer');
var notifications = require('../notifications');
var groups = require('../groups');
var translator = require('../../public/src/modules/translator');
var utils = require('../../public/src/utils');


module.exports = function(User) {

	User.addToApprovalQueue = function(userData, callback) {
		userData.userslug = utils.slugify(userData.username);
		async.waterfall([
			function(next) {
				User.isDataValid(userData, next);
			},
			function(next) {
				User.hashPassword(userData.password, next);
			},
			function(hashedPassword, next) {
				var data = {
					username: userData.username,
					email: userData.email,
					ip: userData.ip,
					hashedPassword: hashedPassword
				};

				db.setObject('registration:queue:name:' + userData.username, data, next);
			},
			function(next) {
				db.sortedSetAdd('registration:queue', Date.now(), userData.username, next);
			},
			function(next) {
				sendNotificationToAdmins(userData.username, next);
			}
		], callback);
	};

	function sendNotificationToAdmins(username, callback) {
		notifications.create({
			bodyShort: '[[notifications:new_register, ' + username + ']]',
			nid: 'new_register:' + username,
			path: '/admin/manage/registration'
		}, function(err, notification) {
			if (err || !notification) {
				return callback(err);
			}

			notifications.pushGroup(notification, 'administrators', callback);
		});
	}

	User.acceptRegistration = function(username, callback) {
		var uid;
		var userData;
		async.waterfall([
			function(next) {
				db.getObject('registration:queue:name:' + username, next);
			},
			function(_userData, next) {
				if (!_userData) {
					return callback(new Error('[[error:invalid-data]]'));
				}
				userData = _userData;
				User.create(userData, next);
			},
			function(_uid, next) {
				uid = _uid;
				User.setUserField(uid, 'password', userData.hashedPassword, next);
			},
			function(next) {
				var title = meta.config.title || meta.config.browserTitle || 'Julian';
				translator.translate('[[email:welcome-to, ' + title + ']]', meta.config.defaultLang, function(subject) {
					var data = {
						site_title: title,
						username: username,
						subject: subject,
						template: 'registration_accepted',
						uid: uid
					};

					emailer.send('registration_accepted', uid, data, next);
				});
			},
			function(next) {
				removeFromQueue(username, next);
			},
			function(next) {
				markNotificationRead(username, next);
			}
		], callback);
	};

	function markNotificationRead(username, callback) {
		var nid = 'new_register:' + username;
		async.waterfall([
			function (next) {
				groups.getMembers('administrators', 0, -1, next);
			},
			function (uids, next) {
				async.each(uids, function(uid, next) {
					notifications.markRead(nid, uid, next);
				}, next);
			}
		], callback);
	}

	User.rejectRegistration = function(username, callback) {
		async.waterfall([
			function (next) {
				removeFromQueue(username, next);
			},
			function (next) {
				markNotificationRead(username, next);
			}
		], callback);
	};

	function removeFromQueue(username, callback) {
		async.parallel([
			async.apply(db.sortedSetRemove, 'registration:queue', username),
			async.apply(db.delete, 'registration:queue:name:' + username)
		], function(err, results) {
			callback(err);
		});
	}

	User.getRegistrationQueue = function(start, stop, callback) {
		var data;
		async.waterfall([
			function(next) {
				db.getSortedSetRevRangeWithScores('registration:queue', start, stop, next);
			},
			function(_data, next) {
				data = _data;
				var keys = data.filter(Boolean).map(function(user) {
					return 'registration:queue:name:' + user.value;
				});
				db.getObjects(keys, next);
			},
			function(users, next) {
				users.forEach(function(user, index) {
					if (user) {
						user.timestamp = utils.toISOString(data[index].score);
					}
				});

				async.map(users, function(user, next) {
					if (!user) {
						return next(null, user);
					}

					// temporary: see http://www.stopforumspam.com/forum/viewtopic.php?id=6392
					user.ip = user.ip.replace('::ffff:', '');

					request('http://api.stopforumspam.org/api?ip=' + user.ip + '&email=' + user.email + '&username=' + user.username + '&f=json', function (err, response, body) {
						if (err) {
							return next(null, user);
						}
						if (response.statusCode === 200) {
							var data = JSON.parse(body);
							user.spamData = data;

							user.usernameSpam = data.username.frequency > 0 || data.username.appears > 0;
							user.emailSpam = data.email.frequency > 0 || data.email.appears > 0;
							user.ipSpam = data.ip.frequency > 0 || data.ip.appears > 0;
						}
						next(null, user);
					});
				}, next);
			}
		], callback);
	};


};
