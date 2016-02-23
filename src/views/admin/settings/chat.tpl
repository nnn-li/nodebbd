<!-- IMPORT admin/settings/header.tpl -->


<div class="row">
	<div class="col-sm-2 col-xs-12 settings-header">聊天设置</div>
	<div class="col-sm-10 col-xs-12">
		<div class="form-group">
			<div class="checkbox">
				<label class="mdl-switch mdl-js-switch mdl-js-ripple-effect">
					<input type="checkbox" class="mdl-switch__input" id="disableChat" data-field="disableChat">
					<span class="mdl-switch__label"><strong>禁用聊天</strong></span>
				</label>
			</div>
		</div>
		<div class="form-group">
			<strong>聊天消息收件箱大小</strong><br /> <input type="text" class="form-control" value="250" data-field="chatMessageInboxSize">
		</div>

		<div class="form-group">
			<label>聊天消息的最大长度</label>
			<input type="text" class="form-control" value="1000" data-field="maximumChatMessageLength">
		</div>

		<div class="form-group">
			<label>在聊天室的最大用户数</label>
			<input type="text" class="form-control" value="0" data-field="maximumUsersInChatRoom">
		</div>
	</div>
</div>

<!-- IMPORT admin/settings/footer.tpl -->