<div class="registration panel panel-primary">
	<div class="panel-heading">
		队列
	</div>
	<!-- IF !users.length -->
	<p class="panel-body">
		有在注册队列中没有用户. <br>
		要启用此功能, 点击 <a href="{config.relative_path}/admin/settings/user">设置 -> 用户 -> 认证</a> 然后设置
		<strong>注册类型</strong> 需要 "管理员批准".
	</p>
	<!-- ENDIF !users.length -->
	<table class="table table-striped users-list">
		<tr>
			<th>用户名</th>
			<th>邮箱</th>
			<th>IP</th>
			<th>时间</th>
			<th></th>
		</tr>
		<!-- BEGIN users -->
		<tr data-username="{users.username}">
			<td>
				<!-- IF users.usernameSpam -->
				<i class="fa fa-times-circle text-danger" title="Frequency: {users.spamData.username.frequency} Appears: {users.spamData.username.appears} Confidence: {users.spamData.username.confidence}"></i>
				<!-- ELSE -->
				<i class="fa fa-check text-success"></i>
				<!-- ENDIF users.usernameSpam -->
				{users.username}
			</td>
			<td>
				<!-- IF users.emailSpam -->
				<i class="fa fa-times-circle text-danger" title="Frequency: {users.spamData.email.frequency} Appears: {users.spamData.email.appears}"></i>
				<!-- ELSE -->
				<i class="fa fa-check text-success"></i>
				<!-- ENDIF users.emailSpam -->
				{users.email}
			</td>
			<td>
				<!-- IF users.ipSpam -->
				<i class="fa fa-times-circle text-danger" title="Frequency: {users.spamData.ip.frequency} Appears: {users.spamData.ip.appears}"></i>
				<!-- ELSE -->
				<i class="fa fa-check text-success"></i>
				<!-- ENDIF users.ipSpam -->
				{users.ip}
			</td>
			<td>
				<span class="timeago" title="{users.timestamp}"></span>
			</td>
			<td>
				<div class="btn-group pull-right">
					<button class="btn btn-success btn-xs" data-action="accept"><i class="fa fa-check"></i></button>
					<button class="btn btn-danger btn-xs" data-action="delete"><i class="fa fa-times"></i></button>
				</div>
			</td>
		</tr>
		<!-- END users -->
	</table>
</div>

<div class="invitations panel panel-success">
	<div class="panel-heading">
		邀请
	</div>
	<p class="panel-body">
		以下是发出了邀请的完整列表。使用Ctrl-F通过电子邮件或用户名在列表中搜索。
		<br><br>
		用户名将会收到电子邮件的邀请用户。
	</p>
	<table class="table table-striped users-list">
		<tr>
			<th>邀请人用户名</th>
			<th>受邀者的电子邮件</th>
			<th>被邀请的用户名（如果已注册）</th>
		</tr>
		<!-- BEGIN invites -->
		<tr>
			<!-- BEGIN invites.invitations -->
			<td><!-- IF @first -->{invites.username}<!-- ENDIF @first --></td>
			<td>{invites.invitations.email}</td>
			<td>{invites.invitations.username}</td>
		</tr>
		<!-- END invites.invitations -->
		<!-- END invites -->
	</table>
</div>
