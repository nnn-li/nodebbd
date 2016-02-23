<!-- IMPORT admin/settings/header.tpl -->

<div class="row">
	<div class="col-sm-2 col-xs-12 settings-header">爬虫设置</div>
	<div class="col-sm-10 col-xs-12">
		<form>
			<strong>Custom Robots.txt <small>留空默认</small></strong><br />
			<textarea class="form-control" data-field="robots.txt"></textarea>
		</form>
	</div>
</div>

<div class="row">
	<div class="col-sm-2 col-xs-12 settings-header">网站地图 & 源设置</div>
	<div class="col-sm-10 col-xs-12">
		<form>
			<div class="checkbox">
				<label class="mdl-switch mdl-js-switch mdl-js-ripple-effect">
					<input class="mdl-switch__input" type="checkbox" data-field="feeds:disableRSS">
					<span class="mdl-switch__label"><strong>禁用RSS订阅</strong></span>
				</label>
			</div>

			<div class="checkbox">
				<label class="mdl-switch mdl-js-switch mdl-js-ripple-effect">
					<input class="mdl-switch__input" type="checkbox" data-field="feeds:disableSitemap">
					<span class="mdl-switch__label"><strong>关闭 Sitemap.xml</strong></span>
				</label>
			</div>

			<div class="form-group">
				<label>主题数在地图显示</label>
				<input class="form-control" type="text" data-field="sitemapTopics" />
			</div>

			<br />
			<p>
				<button id="clear-sitemap-cache" class="btn btn-warning">清除缓存地图</button>
				<a href="/sitemap.xml" target="_blank" class="btn btn-link">查看站点地图</a>
			</p>

		</form>
	</div>
</div>

<!-- IMPORT admin/settings/footer.tpl -->