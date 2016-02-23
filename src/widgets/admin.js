"use strict";


var async = require('async'),
	plugins = require('../plugins');

var admin = {};

admin.get = function(callback) {
	async.parallel({
		areas: function(next) {
			var defaultAreas = [
				{ name: '全局侧边栏', template: 'global', location: 'sidebar' },
				{ name: '全局头部', template: 'global', location: 'header' },
				{ name: '全局底部', template: 'global', location: 'footer' },

				{ name: '全局页面 (Left)', template: 'groups/details.tpl', location: 'left'},
				{ name: '全局页面 (Right)', template: 'groups/details.tpl', location: 'right'}
			];

			plugins.fireHook('filter:widgets.getAreas', defaultAreas, next);
		},
		widgets: function(next) {
			plugins.fireHook('filter:widgets.getWidgets', [], next);
		}
	}, function(err, widgetData) {
		if (err) {
			return callback(err);
		}
		widgetData.areas.push({ name: '开发区草案', template: 'global', location: 'drafts' });

		async.each(widgetData.areas, function(area, next) {
			require('./index').getArea(area.template, area.location, function(err, areaData) {
				area.data = areaData;
				next(err);
			});

		}, function(err) {
			if (err) {
				return callback(err);
			}
			for (var w in widgetData.widgets) {
				if (widgetData.widgets.hasOwnProperty(w)) {
					// if this gets anymore complicated, it needs to be a template
					widgetData.widgets[w].content += "<br /><label>Title:</label><input type=\"text\" class=\"form-control\" name=\"title\" placeholder=\"标题（仅适用于某些容器中所示)\" /><br /><label>Container:</label><textarea rows=\"4\" class=\"form-control container-html\" name=\"container\" placeholder=\"拖放一个容器或在此处输入HTML.\"></textarea><div class=\"checkbox\"><label><input name=\"hide-guests\" type=\"checkbox\"> 来自匿名用户隐藏?</label></div><div class=\"checkbox\"><label><input name=\"hide-registered\" type=\"checkbox\"> Hide from registered users?</input></label></div>";
				}
			}

			var templates = [],
				list = {}, index = 0;

			widgetData.areas.forEach(function(area) {
				if (typeof list[area.template] === 'undefined') {
					list[area.template] = index;
					templates.push({
						template: area.template,
						areas: []
					});

					index++;
				}

				templates[list[area.template]].areas.push({
					name: area.name,
					location: area.location
				});
			});

			callback(false, {
				templates: templates,
				areas: widgetData.areas,
				widgets: widgetData.widgets
			});
		});
	});
};

module.exports = admin;