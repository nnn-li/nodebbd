'use strict';

/* globals define, socket, utils, config, app, ajaxify, templates, Tinycon*/

define('notifications', ['sounds', 'translator', 'components'], function(sound, translator, components) {
	var Notifications = {};

	Notifications.prepareDOM = function() {
		var notifContainer = components.get('notifications'),
			notifTrigger = notifContainer.children('a'),
			notifList = components.get('notifications/list'),
			notifIcon = components.get('notifications/icon');

		notifTrigger
			.on('click', function(e) {
				e.preventDefault();
				if (notifContainer.hasClass('open')) {
					return;
				}

				Notifications.loadNotifications(notifList);
			})
			.on('dblclick', function(e) {
				e.preventDefault();
				if (parseInt(notifIcon.attr('data-content'), 10) > 0) {
					Notifications.markAllRead();
				}
			});

		notifList.on('click', '[data-nid]', function() {
			var unread = $(this).hasClass('unread');
			if (!unread) {
				return;
			}
			socket.emit('notifications.markRead', $(this).attr('data-nid'), function(err) {
				if (err) {
					return app.alertError(err.message);
				}
				incrementNotifCount(-1);
			});
		});

		notifContainer.on('click', '.mark-all-read', Notifications.markAllRead);

		notifList.on('click', '.mark-read', function(e) {
			var liEl = $(this).parent(),
				unread = liEl.hasClass('unread');

			e.preventDefault();
			e.stopPropagation();

			socket.emit('notifications.mark' + (unread ? 'Read' : 'Unread'), liEl.attr('data-nid'), function(err) {
				if (err) {
					return app.alertError(err.message);
				}

				liEl.toggleClass('unread');
				incrementNotifCount(unread ? -1 : 1);
			});
		});

		function incrementNotifCount(delta) {
			var count = parseInt(notifIcon.attr('data-content'), 10) + delta;
			Notifications.updateNotifCount(count);
		}

		socket.on('event:new_notification', function(notifData) {
			// If a path is defined, show notif data, otherwise show generic data
			var payload = {
				alert_id: 'new_notif',
				title: '[[notifications:new_notification]]',
				timeout: 2000
			};

			if (notifData.path) {
				payload.message = notifData.bodyShort;
				payload.type = 'info';
				payload.clickfn = function() {
					socket.emit('notifications.generatePath', notifData.nid, function(err, path) {
						if (err) {
							return app.alertError(err.message);
						}
						if (path) {
							ajaxify.go(path);
						}
					});
				};
			} else {
				payload.message = '[[notifications:you_have_unread_notifications]]';
				payload.type = 'warning';
			}

			app.alert(payload);
			app.refreshTitle();

			if (ajaxify.currentPage === 'notifications') {
				ajaxify.refresh();
			}

			incrementNotifCount(1);

			sound.play('notification');
		});

		socket.on('event:notifications.updateCount', function(count) {
			Notifications.updateNotifCount(count);
		});
	};

	Notifications.loadNotifications = function(notifList) {
		socket.emit('notifications.get', null, function(err, data) {
			if (err) {
				return app.alertError(err.message);
			}

			var notifs = data.unread.concat(data.read).sort(function(a, b) {
				return parseInt(a.datetime, 10) > parseInt(b.datetime, 10) ? -1 : 1;
			});

			translator.toggleTimeagoShorthand();
			for(var i=0; i<notifs.length; ++i) {
				notifs[i].timeago = $.timeago(new Date(parseInt(notifs[i].datetime, 10)));
			}
			translator.toggleTimeagoShorthand();

			templates.parse('partials/notifications_list', {notifications: notifs}, function(html) {
				notifList.translateHtml(html);
			});
		});
	};

	Notifications.updateNotifCount = function(count) {
		var notifIcon = components.get('notifications/icon');
		count = Math.max(0, count);
		if (count > 0) {
			notifIcon.removeClass('fa-bell-o').addClass('fa-bell');
		} else {
			notifIcon.removeClass('fa-bell').addClass('fa-bell-o');
		}

		notifIcon.toggleClass('unread-count', count > 0);
		notifIcon.attr('data-content', count > 99 ? '99+' : count);

		var payload = {
			count: count,
			updateFavicon: true
		};
		$(window).trigger('action:notification.updateCount', payload);

		if (payload.updateFavicon) {
			Tinycon.setBubble(count);
		}
	};

	Notifications.markAllRead = function() {
		socket.emit('notifications.markAllRead', function(err) {
			if (err) {
				app.alertError(err.message);
			}
			Notifications.updateNotifCount(0);
		});
	};

	return Notifications;
});
