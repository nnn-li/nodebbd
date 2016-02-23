<!-- IMPORT admin/settings/header.tpl -->

<div class="row">
	<div class="col-sm-2 col-xs-12 settings-header">常用</div>
	<div class="col-sm-10 col-xs-12">
		<form role="form">
			<div class="checkbox">
				<label class="mdl-switch mdl-js-switch mdl-js-ripple-effect">
					<input class="mdl-switch__input" type="checkbox" data-field="allowPrivateGroups">
					<span class="mdl-switch__label"><strong>Private Groups</strong></span>
				</label>
			</div>

			<p class="help-block">
				如果启用，团体加入需要组所有者批准<em>(Default: enabled)</em>
			</p>
			<p class="help-block">
				<strong>注意!</strong> 如果这个选项被禁用，你有私人团体，他们自动成为公共.
			</p>

			<div class="checkbox">
				<label class="mdl-switch mdl-js-switch mdl-js-ripple-effect">
					<input class="mdl-switch__input" type="checkbox" data-field="allowGroupCreation">
					<span class="mdl-switch__label"><strong>允许组创建</strong></span>
				</label>
			</div>

			<p class="help-block">
				如果启用，用户可以创建群组 <em>(Default: disabled)</em>
			</p>
		</form>
	</div>
</div>

<div class="row">
	<div class="col-sm-2 col-xs-12 settings-header">组封面图片</div>
	<div class="col-sm-10 col-xs-12">
		<form role="form">
			<label for="groups:defaultCovers"><strong>默认封面图片</strong></label>
			<p class="help-block">
				添加逗号分隔的默认封面图像，没有上载封面图片组
			</p>
			<input type="text" class="form-control input-lg" id="groups:defaultCovers" data-field="groups:defaultCovers" value="{config.relative_path}/images/cover-default.png" placeholder="https://example.com/group1.png, https://example.com/group2.png" /><br />
		</form>
	</div>
</div>

<!-- IMPORT admin/settings/footer.tpl -->