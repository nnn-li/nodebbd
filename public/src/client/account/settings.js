'use strict';

/*global define, socket, app, ajaxify, config*/

define('forum/account/settings', ['forum/account/header', 'components', 'csrf'], function(header, components, csrf) {
	var	AccountSettings = {};

	AccountSettings.init = function() {
		header.init();

		$('#submitBtn').on('click', function() {
			var settings = {};

			$('.account').find('input, textarea, select').each(function(id, input) {
				input = $(input);
				var setting = input.attr('data-property');
				if (input.is('select')) {
					settings[setting] = input.val();
					return;
				}

				switch (input.attr('type')) {
					case 'text':
					case 'textarea':
						settings[setting] = input.val();
						break;
					case 'checkbox':
						settings[setting] = input.is(':checked') ? 1 : 0;
						break;
				}
			});

			socket.emit('user.saveSettings', {uid: ajaxify.data.theirid, settings: settings}, function(err, newSettings) {
				if (err) {
					return app.alertError(err.message);
				}

				app.alertSuccess('[[success:settings-saved]]');
				var requireReload = false;
				for (var key in newSettings) {
					if (newSettings.hasOwnProperty(key)) {
						if (key === 'userLang' && config.userLang !== newSettings.userLang) {
							requireReload = true;
						}
						config[key] = newSettings[key];
					}
				}

				if (requireReload && parseInt(app.user.uid, 10) === parseInt(ajaxify.data.theirid, 10)) {
					app.alert({
						id: 'setting-change',
						message: '[[user:settings-require-reload]]',
						type: 'warning',
						timeout: 5000,
						clickfn: function() {
							ajaxify.refresh();
						}
					});
				}
			});

			return false;
		});

		$('#bootswatchSkin').on('change', function() {
			var css = $('#bootswatchCSS'),
				val = $(this).val() === 'default' ? config['theme:src'] : 'http://maxcdn.bootstrapcdn.com/bootswatch/latest/' + $(this).val() + '/bootstrap.min.css';

			css.attr('href', val);
		});

		$('[data-property="homePageRoute"]').on('change', toggleCustomRoute);

		toggleCustomRoute();

		components.get('user/sessions').find('.timeago').timeago();
		prepareSessionRevoking();
	};

	function toggleCustomRoute() {
		$('[data-property="homePageCustom"]').val('');
		if ($('[data-property="homePageRoute"]').val() === 'custom') {
			$('#homePageCustom').show();
		}else{
			$('#homePageCustom').hide();
		}
	}

	function prepareSessionRevoking() {
		components.get('user/sessions').on('click', '[data-action]', function() {
			var parentEl = $(this).parents('[data-uuid]'),
				uuid = parentEl.attr('data-uuid');

			if (uuid) {
				// This is done via DELETE because a user shouldn't be able to
				// revoke his own session! This is what logout is for
				$.ajax({
					url: config.relative_path + '/user/' + ajaxify.data.userslug + '/session/' + uuid,
					method: 'delete',
					headers: {
						'x-csrf-token': csrf.get()
					}
				}).done(function() {
					parentEl.remove();
				}).fail(function(err) {
					app.alertError(err.responseText);
				})
			}
		});
	}

	return AccountSettings;
});
