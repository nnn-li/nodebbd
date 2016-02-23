<!-- IMPORT admin/settings/header.tpl -->

<div class="row">
	<div class="col-sm-2 col-xs-12 settings-header">分页设置</div>
	<div class="col-sm-10 col-xs-12">
		<form>
			<div class="checkbox">
				<label class="mdl-switch mdl-js-switch mdl-js-ripple-effect">
					<input class="mdl-switch__input" type="checkbox" data-field="usePagination">
					<span class="mdl-switch__label"><strong>分页主题和帖子，而不是使用无限滚动.</strong></span>
				</label>
			</div>
		</form>
	</div>
</div>

<div class="row">
	<div class="col-sm-2 col-xs-12 settings-header">主题分页</div>
	<div class="col-sm-10 col-xs-12">
		<form>
			<strong>每页帖子</strong><br /> <input type="text" class="form-control" value="20" data-field="postsPerPage">
		</form>
	</div>
</div>

<div class="row">
	<div class="col-sm-2 col-xs-12 settings-header">分页类</div>
	<div class="col-sm-10 col-xs-12">
		<form>
			<strong>每页专题</strong><br /> <input type="text" class="form-control" value="20" data-field="topicsPerPage"><br />
			<strong>主题的初始数量上加载未读、最近、流行</strong><br /> <input type="text" class="form-control" value="20" data-field="topicsPerList">
		</form>
	</div>
</div>

<!-- IMPORT admin/settings/footer.tpl -->