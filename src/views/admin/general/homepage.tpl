<div class="row">
	<div class="col-sm-2 col-xs-12 settings-header">首页</div>
	<div class="col-sm-10 col-xs-12">
		<p>
			选择何时用户浏览到您的论坛根URL所显示的网页。
		</p>
		<form class="row">
			<div class="col-sm-6">
				<label>首页路由</label>
				<select class="form-control" data-field="homePageRoute">
					<!-- BEGIN routes -->
					<option value="{routes.route}">{routes.name}</option>
					<!-- END routes -->
				</select>
				<div id="homePageCustom" style="display: none;">
					<br>
					<label>自定义路由</label>
					<input type="text" class="form-control" data-field="homePageCustom"/>
				</div>
				<br>
				<div class="checkbox">
					<label class="mdl-switch mdl-js-switch mdl-js-ripple-effect">
						<input class="mdl-switch__input" type="checkbox" data-field="allowUserHomePage">
						<span class="mdl-switch__label"><strong>允许用户主页面</strong></span>
					</label>
				</div>
			</div>
		</form>
	</div>
</div>

<button id="save" class="floating-button mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored">
	<i class="material-icons">save</i>
</button>

<script>
	require(['admin/settings'], function(Settings) {
		Settings.prepare();
	});
</script>
