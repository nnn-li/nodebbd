"use strict";

var async = require('async');
var user = require('../user');
var meta = require('../meta');

var pagination = require('../pagination');
var plugins = require('../plugins');
var db = require('../database');
var helpers = require('./helpers');


var usersController = {};

usersController.getOnlineUsers = function(req, res, next) {
	usersController.getUsers('users:online', req.uid, req.query.page, function(err, userData) {
		if (err) {
			return next(err);
		}

		if (!userData.isAdminOrGlobalMod) {
			userData.users = userData.users.filter(function(user) {
				return user && user.status !== 'offline';
			});
		}

		userData.anonymousUserCount = require('../socket.io').getOnlineAnonCount();

		render(req, res, userData, next);
	});
};

usersController.getUsersSortedByPosts = function(req, res, next) {
	usersController.renderUsersPage('users:postcount', req, res, next);
};

usersController.getUsersSortedByReputation = function(req, res, next) {
	if (parseInt(meta.config['reputation:disabled'], 10) === 1) {
		return next();
	}
	usersController.renderUsersPage('users:reputation', req, res, next);
};

usersController.getUsersSortedByJoinDate = function(req, res, next) {
	usersController.renderUsersPage('users:joindate', req, res, next);
};

usersController.getBannedUsers = function(req, res, next) {
	usersController.getUsers('users:banned', req.uid, req.query.page, function(err, userData) {
		if (err) {
			return next(err);
		}

		if (!userData.isAdminOrGlobalMod) {
			return next();
		}

		render(req, res, userData, next);
	});
};

usersController.renderUsersPage = function(set, req, res, next) {
	usersController.getUsers(set, req.uid, req.query.page, function(err, userData) {
		if (err) {
			return next(err);
		}
		render(req, res, userData, next);
	});
};

usersController.getUsers = function(set, uid, page, callback) {
	var setToTitles = {
		'users:postcount': '[[pages:users/sort-posts]]',
		'users:reputation': '[[pages:users/sort-reputation]]',
		'users:joindate': '[[pages:users/latest]]',
		'users:online': '[[pages:users/online]]',
		'users:banned': '[[pages:users/banned]]'
	};

	var setToCrumbs = {
		'users:postcount': '[[users:top_posters]]',
		'users:reputation': '[[users:most_reputation]]',
		'users:joindate': '[[global:users]]',
		'users:online': '[[global:online]]',
		'users:banned': '[[user:banned]]'
	};

	var breadcrumbs = [{text: setToCrumbs[set]}];

	if (set !== 'users:joindate') {
		breadcrumbs.unshift({text: '[[global:users]]', url: '/users'});
	}

	page = parseInt(page, 10) || 1;
	var resultsPerPage = parseInt(meta.config.userSearchResultsPerPage, 10) || 20;
	var start = Math.max(0, page - 1) * resultsPerPage;
	var stop = start + resultsPerPage - 1;

	async.parallel({
		isAdministrator: function(next) {
			user.isAdministrator(uid, next);
		},
		isGlobalMod: function(next) {
			user.isGlobalModerator(uid, next);
		},
		usersData: function(next) {
			usersController.getUsersAndCount(set, uid, start, stop, next);
		}
	}, function(err, results) {
		if (err) {
			return callback(err);
		}

		var pageCount = Math.ceil(results.usersData.count / resultsPerPage);
		var userData = {
			loadmore_display: results.usersData.count > (stop - start + 1) ? 'block' : 'hide',
			users: results.usersData.users,
			pagination: pagination.create(page, pageCount),
			title: setToTitles[set] || '[[pages:users/latest]]',
			breadcrumbs: helpers.buildBreadcrumbs(breadcrumbs),
			setName: set,
			isAdminOrGlobalMod: results.isAdministrator || results.isGlobalMod
		};
		userData['route_' + set] = true;
		callback(null, userData);
	});
};

usersController.getUsersAndCount = function(set, uid, start, stop, callback) {
	async.parallel({
		users: function(next) {
			user.getUsersFromSet(set, uid, start, stop, next);
		},
		count: function(next) {
			if (set === 'users:online') {
				var now = Date.now();
				db.sortedSetCount('users:online', now - 300000, now, next);
			} else if (set === 'users:banned') {
				db.sortedSetCard('users:banned', next);
			} else {
				db.getObjectField('global', 'userCount', next);
			}
		}
	}, function(err, results) {
		if (err) {
			return callback(err);
		}
		results.users = results.users.filter(function(user) {
			return user && parseInt(user.uid, 10);
		});

		callback(null, results);
	});
};

function render(req, res, data, next) {
	plugins.fireHook('filter:users.build', {req: req, res: res, templateData: data }, function(err, data) {
		if (err) {
			return next(err);
		}

		var registrationType = meta.config.registrationType;

		data.templateData.maximumInvites = meta.config.maximumInvites;
		data.templateData.inviteOnly = registrationType === 'invite-only' || registrationType === 'admin-invite-only';
		data.templateData.adminInviteOnly = registrationType === 'admin-invite-only';
		data.templateData['reputation:disabled'] = parseInt(meta.config['reputation:disabled'], 10) === 1;

		user.getInvitesNumber(req.uid, function(err, num) {
			if (err) {
				return next(err);
			}

			data.templateData.invites = num;
			res.render('users', data.templateData);
		});
	});
}

module.exports = usersController;
