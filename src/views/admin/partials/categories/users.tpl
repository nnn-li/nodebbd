<!-- BEGIN users -->
<li data-uid="{users.uid}">
	<div class="btn-group pull-right">
		<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
			特权 <span class="caret"></span>
		</button>
		<ul class="dropdown-menu" role="menu">
			<li role="presentation"><a href="#" data-priv="find" class="<!-- IF users.privileges.find -->active<!-- ENDIF users.privileges.find -->">查找类别</a></li>
			<li role="presentation"><a href="#" data-priv="read" class="<!-- IF users.privileges.read -->active<!-- ENDIF users.privileges.read -->">访问 &amp; 阅读</a></li>
			<li role="presentation"><a href="#" data-priv="topics:create" class="<!-- IF users.privileges.topics:create -->active<!-- ENDIF users.privileges.topics:create -->">创建主题</a></li>
			<li role="presentation"><a href="#" data-priv="topics:reply" class="<!-- IF users.privileges.topics:reply -->active<!-- ENDIF users.privileges.topics:reply -->">回复主题</a></li>
			<li role="presentation" class="divider"></li>
			<li role="presentation"><a href="#" data-priv="mods" class="<!-- IF users.privileges.mods -->active<!-- ENDIF users.privileges.mods -->">Moderator</a></li>
		</ul>
	</div>
	<img src="{users.picture}" /> {users.username}
</li>
<!-- END users -->