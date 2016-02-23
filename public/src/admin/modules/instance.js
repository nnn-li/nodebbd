"use strict";

/*globals define, app, socket*/

define('admin/modules/instance', function() {
	var instance = {};

	instance.reload = function(callback) {
		app.alert({
			alert_id: 'instance_reload',
			type: 'info',
			title: '重载... <i class="fa fa-spin fa-refresh"></i>',
			message: '论坛重新加载中.',
			timeout: 5000
		});

		socket.emit('admin.reload', function(err) {
			if (!err) {
				app.alert({
					alert_id: 'instance_reload',
					type: 'success',
					title: '<i class="fa fa-check"></i> 成功',
					message: '论坛已经成功地重新加载.',
					timeout: 5000
				});
			} else {
				app.alert({
					alert_id: 'instance_reload',
					type: 'danger',
					title: '[[global:alert.error]]',
					message: '[[error:reload-failed, ' + err.message + ']]'
				});
			}

			if (typeof callback === 'function') {
				callback();
			}
		});
	};

	instance.restart = function(callback) {
		app.alert({
			alert_id: 'instance_restart',
			type: 'info',
			title: 'Restarting... <i class="fa fa-spin fa-refresh"></i>',
			message: '论坛重新启动.',
			timeout: 5000
		});

		$(window).one('action:reconnected', function() {
			app.alert({
				alert_id: 'instance_restart',
				type: 'success',
				title: '<i class="fa fa-check"></i> Success',
				message: '论坛 已成功重新启动.',
				timeout: 5000
			});

			if (typeof callback === 'function') {
				callback();
			}
		});

		socket.emit('admin.restart');
	};
	
	return instance;
});
