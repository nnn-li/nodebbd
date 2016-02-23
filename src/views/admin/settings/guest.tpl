<!-- IMPORT admin/settings/header.tpl -->

<div class="row">
	<div class="col-sm-2 col-xs-12 settings-header">游客 handles</div>
	<div class="col-sm-10 col-xs-12">
		<form role="form">
			<div class="checkbox">
				<label class="mdl-switch mdl-js-switch mdl-js-ripple-effect">
					<input class="mdl-switch__input" type="checkbox" data-field="allowGuestHandles">
					<span class="mdl-switch__label"><strong>允许游客 handles</strong></span>
				</label>
			</div>
			<p class="help-block">
				此选项暴露了一个新的领域，让客人挑选一个名字与他们做每个职位相关联。如果禁用，在将简单地称为“客人”
			</p>
		</form>
	</div>
</div>


<div class="row">
	<div class="col-sm-2 col-xs-12 settings-header">Guest权限</div>
	<div class="col-sm-10 col-xs-12">
		<form role="form">
			<div class="checkbox">
				<label class="mdl-switch mdl-js-switch mdl-js-ripple-effect">
					<input class="mdl-switch__input" type="checkbox" data-field="allowGuestSearching">
					<span class="mdl-switch__label"><strong>让游客无需登录搜索</strong></span>
				</label>
			</div>

			<div class="checkbox">
				<label class="mdl-switch mdl-js-switch mdl-js-ripple-effect">
					<input class="mdl-switch__input" type="checkbox" data-field="allowGuestUserSearching">
					<span class="mdl-switch__label"><strong>让游客可以进行搜索的用户无需登录</strong></span>
				</label>
			</div>
		</form>
	</div>
</div>

<!-- IMPORT admin/settings/footer.tpl -->