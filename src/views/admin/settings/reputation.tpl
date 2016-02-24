<!-- IMPORT admin/settings/header.tpl -->


<div class="row">
	<div class="col-sm-2 col-xs-12 settings-header">威望设置</div>
	<div class="col-sm-10 col-xs-12">
		<form>
			<div class="checkbox">
				<label class="mdl-switch mdl-js-switch mdl-js-ripple-effect">
					<input type="checkbox" class="mdl-switch__input" data-field="reputation:disabled">
					<span class="mdl-switch__label"><strong>禁用威望系统</strong></span>
				</label>
			</div>
			<div class="checkbox">
				<label class="mdl-switch mdl-js-switch mdl-js-ripple-effect">
					<input type="checkbox" class="mdl-switch__input" data-field="downvote:disabled">
					<span class="mdl-switch__label"><strong>禁用 上下投票</trong></strong>
				</label>
			</div>
		</form>
	</div>
</div>


<div class="row">
	<div class="col-sm-2 col-xs-12 settings-header">威望提升</div>
	<div class="col-sm-10 col-xs-12">
		<form>
			<strong>最小威望 to downvote 帖子</strong><br /> <input type="text" class="form-control" placeholder="0" data-field="privileges:downvote"><br />
			<strong>最小威望 to flag 帖子</strong><br /> <input type="text" class="form-control" placeholder="0" data-field="privileges:flag"><br />
		</form>
	</div>
</div>

<!-- IMPORT admin/settings/footer.tpl -->