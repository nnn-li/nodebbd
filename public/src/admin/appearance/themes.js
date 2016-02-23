"use strict";
/* global define, app, socket, bootbox, templates, config */

define('admin/appearance/themes', function() {
	var Themes = {};
	
	Themes.init = function() {
		$('#installed_themes').on('click', function(e){
			var target = $(e.target),
				action = target.attr('data-action');

			if (action && action === 'use') {
				var parentEl = target.parents('[data-theme]'),
					themeType = parentEl.attr('data-type'),
					cssSrc = parentEl.attr('data-css'),
					themeId = parentEl.attr('data-theme');

				socket.emit('admin.themes.set', {
					type: themeType,
					id: themeId,
					src: cssSrc
				}, function(err) {
					if (err) {
						return app.alertError(err.message);
					}
					highlightSelectedTheme(themeId);

					app.alert({
						alert_id: 'admin:theme',
						type: 'info',
						title: '主题变更',
						message: '请重新启动论坛充分激活这个主题',
						timeout: 5000,
						clickfn: function() {
							socket.emit('admin.restart');
						}
					});
				});
			}
		});

		$('#revert_theme').on('click', function() {
			bootbox.confirm('您确定要恢复默认主题?', function(confirm) {
				if (confirm) {
					socket.emit('admin.themes.set', {
						type: 'local',
						id: 'nodebb-theme-persona'
					}, function(err) {
						if (err) {
							return app.alertError(err.message);
						}
						highlightSelectedTheme('nodebb-theme-persona');
						app.alert({
							alert_id: 'admin:theme',
							type: 'success',
							title: '主题变更',
							message: '您已成功重置您的论坛回回到默认主题.',
							timeout: 3500
						});
					});
				}
			});
		});

		socket.emit('admin.themes.getInstalled', function(err, themes) {
			if(err) {
				return app.alertError(err.message);
			}

			var instListEl = $('#installed_themes');

			if (!themes.length) {
				instListEl.append($('<li/ >').addClass('no-themes').html('发现没有安装的主题'));
				return;
			} else {
				templates.parse('admin/partials/theme_list', {
					themes: themes
				}, function(html) {
					translator.translate(html, function(html) {
						instListEl.html(html);
						highlightSelectedTheme(config['theme:id']);
					});
				});
			}
		});
	};

	function highlightSelectedTheme(themeId) {
		$('[data-theme]')
			.removeClass('selected')
			.find('[data-action="use"]')
				.html('选择主题')
				.removeClass('btn-success')
				.addClass('btn-primary');

		$('[data-theme="' + themeId + '"]')
			.addClass('selected')
			.find('[data-action="use"]')
				.html('当前主题')
				.removeClass('btn-primary')
				.addClass('btn-success');
	}

	return Themes;
});
