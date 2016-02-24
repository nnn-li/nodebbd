<!-- IMPORT admin/settings/header.tpl -->

<div class="row">
	<div class="col-sm-2 col-xs-12 settings-header">认证</div>
	<div class="col-sm-10 col-xs-12">
		<form role="form">
			<div class="checkbox">
				<label class="mdl-switch mdl-js-switch mdl-js-ripple-effect">
					<input class="mdl-switch__input" type="checkbox" data-field="allowLocalLogin" checked>
					<span class="mdl-switch__label"><strong>允许本地登录</strong></span>
				</label>
			</div>

			<div class="checkbox">
				<label class="mdl-switch mdl-js-switch mdl-js-ripple-effect">
					<input class="mdl-switch__input" type="checkbox" data-field="requireEmailConfirmation">
					<span class="mdl-switch__label"><strong>需要电子邮件确认</strong></span>
				</label>
			</div>

			<div class="form-group form-inline">
				<label for="emailConfirmInterval">用户不得重新发送确认邮件到</label>
				<input class="form-control" data-field="emailConfirmInterval" type="number" id="emailConfirmInterval" placeholder="Default: 10" value="10" />
				<label for="emailConfirmInterval">分钟过去</label>
			</div>

			<div class="form-group">
				<label>允许使用登录</label>
				<select class="form-control" data-field="allowLoginWith">
					<option value="username-email">用户名或电子邮件</option>
					<option value="username">只有用户名</option>
					<option value="email">只有邮箱</option>
				</select>
			</div>

			<div class="form-group">
				<label>注册类型</label>
				<select class="form-control" data-field="registrationType">
					<option value="normal">正常</option>
					<option value="admin-approval">管理员批准</option>
					<option value="invite-only">仅邀请</option>
					<option value="admin-invite-only">只管理员邀请</option>
					<option value="disabled">无需注册</option>
				</select>
			</div>

			<div class="form-group">
				<label>每个用户最多邀请</label>
				<input type="number" class="form-control" data-field="maximumInvites" placeholder="0">
				<p class="help-block">
					0为不限制。管理员获得无限邀请<br>
					仅适用于“邀请只有”
				</p>
			</div>
		</form>
	</div>
</div>

<div class="row">
	<div class="col-sm-2 col-xs-12 settings-header">帐户设置</div>
	<div class="col-sm-10 col-xs-12">
		<form>
			<div class="checkbox">
				<label class="mdl-switch mdl-js-switch mdl-js-ripple-effect">
					<input class="mdl-switch__input" type="checkbox" data-field="username:disableEdit">
					<span class="mdl-switch__label"><strong>禁止改变用户名</strong></span>
				</label>
			</div>
			<div class="checkbox">
				<label class="mdl-switch mdl-js-switch mdl-js-ripple-effect">
					<input class="mdl-switch__input" type="checkbox" data-field="email:disableEdit">
					<span class="mdl-switch__label"><strong>禁用电子邮件的改变</strong></span>
				</label>
			</div>
			<div class="checkbox">
				<label class="mdl-switch mdl-js-switch mdl-js-ripple-effect">
					<input class="mdl-switch__input" type="checkbox" data-field="allowAccountDelete" checked>
					<span class="mdl-switch__label"><strong>允许帐户删除</strong></span>
				</label>
			</div>
			<div class="checkbox">
				<label class="mdl-switch mdl-js-switch mdl-js-ripple-effect">
					<input class="mdl-switch__input" type="checkbox" data-field="privateUserInfo">
					<span class="mdl-switch__label"><strong>使用户私人信息</strong></span>
				</label>
			</div>
		</form>
	</div>
</div>

<div class="row">
	<div class="col-sm-2 col-xs-12 settings-header">主题</div>
	<div class="col-sm-10 col-xs-12">
		<form>
			<div class="checkbox">
				<label class="mdl-switch mdl-js-switch mdl-js-ripple-effect">
					<input class="mdl-switch__input" type="checkbox" data-field="disableCustomUserSkins">
					<span class="mdl-switch__label"><strong>防止用户选择一个自定义皮肤</strong></span>
				</label>
			</div>
		</form>
	</div>
</div>

<div class="row">
	<div class="col-sm-2 col-xs-12 settings-header">账户保护</div>
	<div class="col-sm-10 col-xs-12">
		<form>
			<div class="form-group">
				<label for="loginAttempts">每小时登录尝试</label>
				<input id="loginAttempts" type="text" class="form-control" data-field="loginAttempts" placeholder="5" />
				<p class="help-block">
					如果登录尝试到用户的账户超过此阈值，该帐户将被锁定的时间预先配置的量
				</p>
			</div>
			<div class="form-group">
				<label for="lockoutDuration">帐户锁定时间（分钟）</label>
				<input id="lockoutDuration" type="text" class="form-control" data-field="lockoutDuration" placeholder="60" />
			</div>
			<div class="form-group">
				<label>Days to 记住用户的登录会话</label>
				<input type="text" class="form-control" data-field="loginDays" placeholder="14" />
			</div>
			<div class="form-group">
				<label>在设定的天数后强制重置密码</label>
				<input type="text" class="form-control" data-field="passwordExpiryDays" placeholder="0" />
			</div>
		</form>
	</div>
</div>

<div class="row">
	<div class="col-sm-2 col-xs-12 settings-header">用户注册</div>
	<div class="col-sm-10 col-xs-12">
		<form>
			<div class="form-group">
				<label>最小长度用户名</label>
				<input type="text" class="form-control" value="2" data-field="minimumUsernameLength">
			</div>
			<div class="form-group">
				<label>最大用户名长度</label>
				<input type="text" class="form-control" value="16" data-field="maximumUsernameLength">
			</div>
			<div class="form-group">
				<label>最小密码长度</label>
				<input type="text" class="form-control" value="6" data-field="minimumPasswordLength">
			</div>
			<div class="form-group">
				<label>最大关于我们长度</label>
				<input type="text" class="form-control" value="500" data-field="maximumAboutMeLength">
			</div>
			<div class="form-group">
				<label>论坛使用条款 <small>(留空禁用)</small></label>
				<textarea class="form-control" data-field="termsOfUse"></textarea>
			</div>
		</form>
	</div>
</div>

<div class="row">
	<div class="col-sm-2 col-xs-12 settings-header">用户搜索</div>
	<div class="col-sm-10 col-xs-12">
		<form>
			<div class="form-group">
				<label>结果数显示</label>
				<input type="text" class="form-control" value="24" data-field="userSearchResultsPerPage">
			</div>

		</form>
	</div>
</div>

<div class="row">
	<div class="col-sm-2 col-xs-12 settings-header">默认用户设置</div>
	<div class="col-sm-10 col-xs-12">
		<form>
			<div class="checkbox">
				<label class="mdl-switch mdl-js-switch mdl-js-ripple-effect">
					<input class="mdl-switch__input" type="checkbox" data-field="openOutgoingLinksInNewTab">
					<span class="mdl-switch__label"><strong>[[user:open_links_in_new_tab]]</strong></span>
				</label>
			</div>

			<div class="checkbox">
				<label class="mdl-switch mdl-js-switch mdl-js-ripple-effect">
					<input class="mdl-switch__input" type="checkbox" data-field="topicSearchEnabled">
					<span class="mdl-switch__label"><strong>[[user:enable_topic_searching]]</strong></span>
				</label>
			</div>

			<div class="form-group">
				<label>[[user:digest_label]]</label>
				<select class="form-control" data-field="dailyDigestFreq">
					<option value="off">Off</option>
					<option value="day">每日</option>
					<option value="week">每周</option>
					<option value="month">每月</option>
				</select>
			</div>

			<div class="checkbox">
				<label class="mdl-switch mdl-js-switch mdl-js-ripple-effect">
					<input class="mdl-switch__input" type="checkbox" data-field="sendChatNotifications">
					<span class="mdl-switch__label"><strong>[[user:send_chat_notifications]]</strong></span>
				</label>
			</div>

			<div class="checkbox">
				<label class="mdl-switch mdl-js-switch mdl-js-ripple-effect">
					<input class="mdl-switch__input" type="checkbox" data-field="sendPostNotifications">
					<span class="mdl-switch__label"><strong>[[user:send_post_notifications]]</strong></span>
				</label>
			</div>

			<div class="checkbox">
				<label class="mdl-switch mdl-js-switch mdl-js-ripple-effect">
					<input class="mdl-switch__input" type="checkbox" data-field="followTopicsOnCreate">
					<span class="mdl-switch__label"><strong>[[user:follow_topics_you_create]]</strong></span>
				</label>
			</div>

			<div class="checkbox">
				<label class="mdl-switch mdl-js-switch mdl-js-ripple-effect">
					<input class="mdl-switch__input" type="checkbox" data-field="followTopicsOnReply">
					<span class="mdl-switch__label"><strong>[[user:follow_topics_you_reply_to]]</strong></span>
				</label>
			</div>

		</form>
	</div>
</div>

<!-- IMPORT admin/settings/footer.tpl -->
