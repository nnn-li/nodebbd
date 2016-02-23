<!-- IMPORT admin/settings/header.tpl -->

<div class="row">
	<div class="col-sm-2 col-xs-12 settings-header">标签设置</div>
	<div class="col-sm-10 col-xs-12">
		<form>
			<div class="form-group">
				<label for="minimumTagsPerTopics">每个主题最少标签</label>
				<input id="minimumTagsPerTopics" type="text" class="form-control" value="0" data-field="minimumTagsPerTopic">
			</div>
			<div class="form-group">
				<label for="maximumTagsPerTopics">每个主题最多标签</label>
				<input id="maximumTagsPerTopics" type="text" class="form-control" value="5" data-field="maximumTagsPerTopic">
			</div>
			<div class="form-group">
				<label for="minimumTagLength">最小标签长度</label>
				<input id="minimumTagLength" type="text" class="form-control" value="3" data-field="minimumTagLength">
			</div>
			<div class="form-group">
				<label for="maximumTagLength">最大标签长度</label>
				<input id="maximumTagLength" type="text" class="form-control" value="15" data-field="maximumTagLength">
			</div>
		</form>
		Click <a href="/admin/manage/tags">here</a> to 访问标签管理页面.
	</div>
</div>


<div class="row">
	<div class="col-sm-2 col-xs-12 settings-header">隐私</div>
	<div class="col-sm-10 col-xs-12">
		<form>
			<div class="checkbox">
				<label class="mdl-switch mdl-js-switch mdl-js-ripple-effect">
					<input class="mdl-switch__input" type="checkbox" data-field="privateTagListing">
					<span class="mdl-switch__label">使标签列表私密</span>
				</label>
			</div>
		</form>
	</div>
</div>

<div class="row">
	<div class="col-sm-2 col-xs-12 settings-header">相关主题</div>
	<div class="col-sm-10 col-xs-12">
		<form>
			<div class="form-group">
				<label for="maximumRelatedTopics">最大相关主题显示 (如果主题支持)</label>
				<input id="maximumRelatedTopics" type="text" class="form-control" value="5" data-field="maximumRelatedTopics">
			</div>
		</form>
	</div>
</div>

<!-- IMPORT admin/settings/footer.tpl -->