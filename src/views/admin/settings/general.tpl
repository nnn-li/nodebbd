<!-- IMPORT admin/settings/header.tpl -->

<div class="row">
	<div class="col-sm-2 col-xs-12 settings-header">
		网站设置
	</div>
	<div class="col-sm-10 col-xs-12">
		<form>
			<label>网站标题</label>
			<input class="form-control" type="text" placeholder="Your Community Name" data-field="title" />

			<div class="checkbox">
				<label for="showSiteTitle" class="mdl-switch mdl-js-switch mdl-js-ripple-effect">
					<input type="checkbox" class="mdl-switch__input" id="showSiteTitle" data-field="showSiteTitle" name="showSiteTitle" />
					<span class="mdl-switch__label">在标题显示网站标题</span>
				</label>
			</div>

			<label>浏览器标题</label>
			<input class="form-control" type="text" placeholder="Browser Title" data-field="browserTitle" />
			<p class="help-block">
				如果没有指定浏览器标题，网站标题将用
			</p>

			<label>标题布局</label>
			<input class="form-control" type="text" placeholder="Title Layout" data-field="titleLayout" />
			<p class="help-block">
				定义浏览器标题将如何构建 ie. &#123;pageTitle&#125; | &#123;browserTitle&#125;
			</p>

			<label>网站说明</label>
			<input type="text" class="form-control" placeholder="A short description about your community" data-field="description" /><br />

			<label>网站关键词</label>
			<input type="text" class="form-control" placeholder="Keywords describing your community, comma-separated" data-field="keywords" /><br />
		</form>
	</div>
</div>

<div class="row">
	<div class="col-sm-2 col-xs-12 settings-header">网站 Logo</div>
	<div class="col-sm-10 col-xs-12">
		<div class="form-group">
			<label for="logoUrl">图片</label>
			<div class="input-group">
				<input id="logoUrl" type="text" class="form-control" placeholder="Path to a logo to display on forum header" data-field="brand:logo" data-action="upload" data-target="logoUrl" data-route="{config.relative_path}/api/admin/uploadlogo" readonly />
				<span class="input-group-btn">
					<input data-action="upload" data-target="logoUrl" data-route="{config.relative_path}/api/admin/uploadlogo" type="button" class="btn btn-default" value="上传"></input>
					<button data-action="removeLogo" type="button" class="btn btn-default btn-danger"><i class="fa fa-times"></i></button>
				</span>
			</div>
		</div>
		<div class="form-group">
			<label for="brand:logo:url">URL</label>
			<input id ="brand:logo:url" type="text" class="form-control" placeholder="The URL of the site logo" data-field="brand:logo:url" />
			<p class="help-block">
				当点击标识，用户发送到这个地址。如果留空，用户将被发到论坛索引。
			</p>
		</div>
		<div class="form-group">
			<label for="brand:logo:alt">替换文本</label>
			<input id ="brand:logo:alt" type="text" class="form-control" placeholder="Alternative text for accessibility" data-field="brand:logo:alt" />
		</div>
	</div>
</div>

<div class="row">
	<div class="col-sm-2 col-xs-12 settings-header">
		网站图标
	</div>
	<div class="col-sm-10 col-xs-12">
		<div class="form-group">
			<div class="input-group">
				<input id="faviconUrl" type="text" class="form-control" placeholder="favicon.ico" data-field="brand:favicon" data-action="upload" data-target="faviconUrl" data-route="{config.relative_path}/api/admin/uploadfavicon" readonly />
				<span class="input-group-btn">
					<input data-action="upload" data-target="faviconUrl" data-route="{config.relative_path}/api/admin/uploadfavicon" data-help="0" type="button" class="btn btn-default" value="上传"></input>
					<button data-action="removeFavicon" type="button" class="btn btn-default btn-danger"><i class="fa fa-times"></i></button>
				</span>
			</div>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-sm-2 col-xs-12 settings-header">
		主屏幕/触摸图标
	</div>
	<div class="col-sm-10 col-xs-12">
		<div class="form-group">
			<div class="input-group">
				<input id="touchIconUrl" type="text" class="form-control" data-field="brand:touchIcon" data-action="upload" data-target="touchIconUrl" data-route="{config.relative_path}/api/admin/uploadTouchIcon" readonly />
				<span class="input-group-btn">
					<input data-action="upload" data-target="touchIconUrl" data-route="{config.relative_path}/api/admin/uploadTouchIcon" type="button" class="btn btn-default" value="上传"></input>
					<button data-action="removeTouchIcon" type="button" class="btn btn-default btn-danger"><i class="fa fa-times"></i></button>
				</span>
			</div>
			<p class="help-block">
				推荐大小和格式：192x192，只有PNG格式。如果没有指定触摸图标，NodeBB将回落到使用图标。
			</p>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-sm-2 col-xs-12 settings-header">杂项</div>
	<div class="col-sm-10 col-xs-12">
		<form>
			<div class="checkbox">
				<label class="mdl-switch mdl-js-switch mdl-js-ripple-effect">
					<input type="checkbox" class="mdl-switch__input" id="showSiteTitle" data-field="useOutgoingLinksPage">
					<span class="mdl-switch__label"><strong>使用传出链接警告Page</strong></span>
				</label>
			</div>
			<div class="checkbox">
				<label class="mdl-switch mdl-js-switch mdl-js-ripple-effect">
					<input type="checkbox" class="mdl-switch__input" id="showSiteTitle" data-field="disableSocialButtons">
					<span class="mdl-switch__label"><strong>禁用社交按钮</strong></span>
				</label>
			</div>

		</form>
	</div>
</div>

<!-- IMPORT admin/settings/footer.tpl -->