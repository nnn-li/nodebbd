<!-- IMPORT admin/settings/header.tpl -->

<div class="row">
	<div class="col-sm-2 col-xs-12 settings-header">邮箱 设置</div>
	<div class="col-sm-10 col-xs-12">
		<form>
			<div class="form-group">
				<label for="email:from"><strong>邮箱地址</strong></label>
				<p class="help-block">
					以下电子邮件地址是指收件人将在“发件人”看和“答复”字段中的电子邮件。
				</p>
				<input type="text" class="form-control input-lg" id="email:from" data-field="email:from" placeholder="info@example.org" /><br />
			</div>
			<div class="form-group">
				<label for="email:from_name"><strong>From Name</strong></label>
				<p class="help-block">
					在电子邮件中显示该名称。
				</p>
				<input type="text" class="form-control input-lg" id="email:from_name" data-field="email:from_name" placeholder="NodeBB" /><br />
			</div>
		</form>
	</div>
</div>

<div class="row">
	<div class="col-sm-2 col-xs-12 settings-header">Gmail 的路由</div>
	<div class="col-sm-10 col-xs-12">
		<form>
			<div class="checkbox">
				<label for="email:GmailTransport:enabled" class="mdl-switch mdl-js-switch mdl-js-ripple-effect">
					<input class="mdl-switch__input" type="checkbox" id="email:GmailTransport:enabled" data-field="email:GmailTransport:enabled" name="email:GmailTransport:enabled" />
					<span class="mdl-switch__label">Route emails through a Gmail/Google 应用帐户</span>
				</label>
			</div>
			<div class="form-group">
				<label for="email:GmailTransport:user"><strong>用户名</strong></label>
				<input type="text" class="form-control input-lg" id="email:GmailTransport:user" data-field="email:GmailTransport:user" placeholder="admin@example.org" /><br />
				<p class="help-block">
					在此输入完整的电子邮件地址, especially if you are using a Google Apps managed domain.
				</p>
			</div>
			<div class="form-group">
				<label for="email:GmailTransport:pass"><strong>密码</strong></label>
				<input type="password" class="form-control input-lg" id="email:GmailTransport:pass" data-field="email:GmailTransport:pass" /><br />
			</div>
		</form>
	</div>
</div>

<div class="row">
	<div class="col-sm-2 col-xs-12 settings-header">编辑电子邮件模板</div>
	<div class="col-sm-10 col-xs-12">
		<label>选择电子邮件模板</label><br />
		<select id="email-editor-selector" class="form-control">
			<!-- BEGIN emails -->
			<option value="{emails.path}">{emails.path}</option>
			<!-- END emails -->
		</select>
		<br />
		<div id="email-editor"></div>
		<input type="hidden" id="email-editor-holder" value="" data-field="" />
		<br />
		<button class="btn btn-warning" type="button" data-action="email.revert">恢复到原始</button>
	</div>
</div>

<div class="row">
	<div class="col-sm-2 col-xs-12 settings-header">电子邮件测试</div>
	<div class="col-sm-10 col-xs-12">
		<label>选择电子邮件模板</label><br />
		<select id="test-email" class="form-control">
			<!-- BEGIN sendable -->
			<option value="{sendable.path}">{sendable.path}</option>
			<!-- END sendable -->
		</select><br />
		<button class="btn btn-primary" type="button" data-action="email.test">发送测试电子邮件</button>
		<p class="help-block">
			测试电子邮件将会被发送到当前登录用户的电子邮件地址。
		</p>
	</div>
</div>

<div class="row">
	<div class="col-sm-2 col-xs-12 settings-header">电子邮件订阅</div>
	<div class="col-sm-10 col-xs-12">
		<form>
			<div class="checkbox">
				<label for="disableEmailSubscriptions" class="mdl-switch mdl-js-switch mdl-js-ripple-effect">
					<input class="mdl-switch__input" type="checkbox" id="disableEmailSubscriptions" data-field="disableEmailSubscriptions" name="disableEmailSubscriptions" />
					<span class="mdl-switch__label">禁用用户通知邮件</span>
				</label>
			</div>
		</form>
	</div>
</div>

<!-- IMPORT admin/settings/footer.tpl -->