<!-- BEGIN groups -->
<li data-name="{groups.displayName}">
	<div class="btn-group pull-right">
		<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
			权限 <span class="caret"></span>
		</button>
		<ul class="dropdown-menu" role="menu">
			<li role="presentation"><a href="#" data-priv="groups:find" class="<!-- IF groups.privileges.groups:find -->active<!-- ENDIF groups.privileges.groups:find -->">查找类别</a></li>
			<li role="presentation"><a href="#" data-priv="groups:read" class="<!-- IF groups.privileges.groups:read -->active<!-- ENDIF groups.privileges.groups:read -->">访问 &amp; 阅读</a></li>
			<li role="presentation"><a href="#" data-priv="groups:topics:create" class="<!-- IF groups.privileges.groups:topics:create -->active<!-- ENDIF groups.privileges.groups:topics:create -->">创建主题</a></li>
			<li role="presentation"><a href="#" data-priv="groups:topics:reply" class="<!-- IF groups.privileges.groups:topics:reply -->active<!-- ENDIF groups.privileges.groups:topics:reply -->">回复主题</a></li>
		</ul>
	</div>
	{groups.displayName}
</li>
<!-- END groups -->