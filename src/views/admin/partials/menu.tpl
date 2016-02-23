<nav id="menu" class="visible-xs visible-sm">
	<section class="menu-section">
		<h3 class="menu-section-title">常用</h3>
		<ul class="menu-section-list">
			<a href="{relative_path}/admin/general/dashboard">仪表盘</a>
			<li><a href="{relative_path}/admin/general/homepage">首页</a></li>
			<li><a href="{relative_path}/admin/general/navigation">导航</a></li>
			<li><a href="{relative_path}/admin/general/languages">语言</a></li>
			<li><a href="{relative_path}/admin/general/sounds">声音</a></li>
		</ul>
	</section>

	<section class="menu-section">
		<h3 class="menu-section-title">管理</h3>
		<ul class="menu-section-list">
			<li><a href="{relative_path}/admin/manage/categories">分类</a></li>
			<li><a href="{relative_path}/admin/manage/tags">标签</a></li>
			<li><a href="{relative_path}/admin/manage/users/latest">用户</a></li>
			<li><a href="{relative_path}/admin/manage/registration">注册队列</a></li>
			<li><a href="{relative_path}/admin/manage/groups">组</a></li>
			<li><a href="{relative_path}/admin/manage/flags">Flags</a></li>
		</ul>
	</section>

	<section class="menu-section">
		<h3 class="menu-section-title">设置</h3>
		<ul class="menu-section-list">
			<li><a href="{relative_path}/admin/settings/general">General</a></li>
			<li><a href="{relative_path}/admin/settings/reputation">Reputation</a></li>
			<li><a href="{relative_path}/admin/settings/email">电子邮件</a></li>
			<li><a href="{relative_path}/admin/settings/user">用户</a></li>
			<li><a href="{relative_path}/admin/settings/group">组</a></li>
			<li><a href="{relative_path}/admin/settings/guest">宾客</a></li>
			<li><a href="{relative_path}/admin/settings/uploads">上传</a></li>
			<li><a href="{relative_path}/admin/settings/post">Post</a></li>
			<li><a href="{relative_path}/admin/settings/chat">聊天</a></li>
			<li><a href="{relative_path}/admin/settings/pagination">分页</a></li>
			<li><a href="{relative_path}/admin/settings/tags">标签</a></li>
			<li><a href="{relative_path}/admin/settings/notifications">通知</a></li>
			<li><a href="{relative_path}/admin/settings/web-crawler">网络爬虫</a></li>
			<li><a href="{relative_path}/admin/settings/sockets">Sockets</a></li>
			<li><a href="{relative_path}/admin/settings/advanced">高级</a></li>
		</ul>
	</section>

	<section class="menu-section">
		<h3 class="menu-section-title">外形</h3>
		<ul class="menu-section-list">
			<li><a href="{relative_path}/admin/appearance/themes">主题</a></li>
			<li><a href="{relative_path}/admin/appearance/skins">皮肤</a></li>
			<li><a href="{relative_path}/admin/appearance/customise">Custom HTML &amp; CSS</a></li>
		</ul>
	</section>

	<section class="menu-section">
		<h3 class="menu-section-title">扩展</h3>
		<ul class="menu-section-list">
			<li><a href="{relative_path}/admin/extend/plugins">插件</a></li>
			<li><a href="{relative_path}/admin/extend/widgets">小工具</a></li>
			<li><a href="{relative_path}/admin/extend/rewards">rewards</a></li>
		</ul>
	</section>

	<!-- IF authentication.length -->
	<section class="menu-section">
		<h3 class="menu-section-title">Social 认证</h3>
		<ul class="menu-section-list">
			<!-- BEGIN authentication -->
			<li>
				<a href="{relative_path}/admin{authentication.route}">{authentication.name}</a>
			</li>
			<!-- END authentication -->
		</ul>
	</section>
	<!-- ENDIF authentication.length -->

	<!-- IF plugins.length -->
	<section class="menu-section">
		<h3 class="menu-section-title">插件</h3>
		<ul class="menu-section-list">
			<!-- BEGIN plugins -->
			<li>
				<a href="{relative_path}/admin{plugins.route}">{plugins.name}</a>
			</li>
			<!-- END plugins -->
		</ul>
	</section>
	<!-- ENDIF plugins.length -->

	<section class="menu-section">
		<h3 class="menu-section-title">高级</h3>
		<ul class="menu-section-list">
			<li><a href="{relative_path}/admin/advanced/database">数据库</a></li>
			<li><a href="{relative_path}/admin/advanced/events">活动</a></li>
			<li><a href="{relative_path}/admin/advanced/logs">日志</a></li>
			<li><a href="{relative_path}/admin/advanced/post-cache">Post 缓存</a></li>
			<!-- IF env -->
			<li><a href="{relative_path}/admin/development/logger">记录仪</a></li>
			<!-- ENDIF env -->
		</ul>
	</section>
</nav>

<main id="panel">
	<nav class="header" id="header">
		<div class="pull-left">
			<button id="mobile-menu">
				<div class="bar"></div>
				<div class="bar"></div>
				<div class="bar"></div>
			</button>
			<h1 id="main-page-title"></h1>
		</div>

		<ul id="user_label" class="pull-right">
			<li class="dropdown pull-right">
				<a class="dropdown-toggle" data-toggle="dropdown" href="#" id="user_dropdown">
					<i class="fa fa-ellipsis-v"></i>
				</a>
				<ul id="user-control-list" class="dropdown-menu" aria-labelledby="user_dropdown">
					<li>
						<a href="{relative_path}/" target="_top" title="View Forum">
							查看论坛
						</a>
					</li>
					<li role="presentation" class="divider"></li>
					<li>
						<a href="#" class="reload" title="Reload Forum">
							刷新论坛
						</a>
					</li>
					<li>
						<a href="#" class="restart" title="Restart Forum">
							重新启动论坛
						</a>
					</li>
					<li role="presentation" class="divider"></li>
					<li component="logout">
						<a href="#">注销</a>
					</li>
				</ul>
			</li>
			<form class="pull-right hidden-sm hidden-xs" role="search">
				<div class="" id="acp-search" >
					<div class="dropdown">
						<input type="text" data-toggle="dropdown" class="form-control" placeholder="搜索...">
						<ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
					</div>
				</div>
			</form>
		</ul>
		<ul id="main-menu">
			<li class="menu-item">
				<a href="{relative_path}/admin/general/dashboard">仪表盘</a>
			</li>
			<li class="dropdown menu-item">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">常用</a>
				<ul class="dropdown-menu" role="menu">
					<li><a href="{relative_path}/admin/general/homepage">首页</a></li>
					<li><a href="{relative_path}/admin/general/navigation">导航</a></li>
					<li><a href="{relative_path}/admin/general/languages">语言</a></li>
					<li><a href="{relative_path}/admin/general/sounds">声音</a></li>
				</ul>
			</li>
			<li class="dropdown menu-item">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">管理</a>
				<ul class="dropdown-menu" role="menu">				
                    <li><a href="{relative_path}/admin/manage/categories">分类</a></li>
                    <li><a href="{relative_path}/admin/manage/tags">标签</a></li>
                    <li><a href="{relative_path}/admin/manage/users/latest">用户</a></li>
                    <li><a href="{relative_path}/admin/manage/registration">注册队列</a></li>
                    <li><a href="{relative_path}/admin/manage/groups">组</a></li>
                    <li><a href="{relative_path}/admin/manage/flags">Flags</a></li>
				</ul>
			</li>
			<li class="dropdown menu-item">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">设置</a>
				<ul class="dropdown-menu" role="menu">
					<li><a href="{relative_path}/admin/settings/general">General</a></li>
                    <li><a href="{relative_path}/admin/settings/reputation">Reputation</a></li>
                    <li><a href="{relative_path}/admin/settings/email">电子邮件</a></li>
                    <li><a href="{relative_path}/admin/settings/user">用户</a></li>
                    <li><a href="{relative_path}/admin/settings/group">组</a></li>
                    <li><a href="{relative_path}/admin/settings/guest">宾客</a></li>
                    <li><a href="{relative_path}/admin/settings/uploads">上传</a></li>
                    <li><a href="{relative_path}/admin/settings/post">Post</a></li>
                    <li><a href="{relative_path}/admin/settings/chat">聊天</a></li>
                    <li><a href="{relative_path}/admin/settings/pagination">分页</a></li>
                    <li><a href="{relative_path}/admin/settings/tags">标签</a></li>
                    <li><a href="{relative_path}/admin/settings/notifications">通知</a></li>
                    <li><a href="{relative_path}/admin/settings/web-crawler">网络爬虫</a></li>
                    <li><a href="{relative_path}/admin/settings/sockets">Sockets</a></li>
                    <li><a href="{relative_path}/admin/settings/advanced">高级</a></li>
				</ul>
			</li>
			<li class="dropdown menu-item">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">外形</a>
				<ul class="dropdown-menu" role="menu">
                    <li><a href="{relative_path}/admin/appearance/themes">主题</a></li>
                    <li><a href="{relative_path}/admin/appearance/skins">皮肤</a></li>
                    <li><a href="{relative_path}/admin/appearance/customise">Custom HTML &amp; CSS</a></li>
				</ul>
			</li>
			<li class="dropdown menu-item">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">扩展</a>
				<ul class="dropdown-menu" role="menu">
					<li><a href="{relative_path}/admin/extend/plugins">插件</a></li>
					<li><a href="{relative_path}/admin/extend/widgets">小工具</a></li>
					<li><a href="{relative_path}/admin/extend/rewards">Rewards</a></li>
				</ul>
			</li>
			<!-- IF authentication.length -->
			<li class="dropdown menu-item">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Social 认证</a>
				<ul class="dropdown-menu" role="menu">
					<!-- BEGIN authentication -->
					<li>
						<a href="{relative_path}/admin{authentication.route}">{authentication.name}</a>
					</li>
					<!-- END authentication -->
				</ul>
			</li>
			<!-- ENDIF authentication.length -->
			<!-- IF plugins.length -->
			<li class="dropdown menu-item">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">插件</a>
				<ul class="dropdown-menu" role="menu">
					<!-- BEGIN plugins -->
					<li>
						<a href="{relative_path}/admin{plugins.route}">{plugins.name}</a>
					</li>
					<!-- END plugins -->
					<li class="divider"></li>
					<li data-link="1">
						<a href="{relative_path}/admin/extend/plugins">安装插件</a>
					</li>
				</ul>
			</li>
			<!-- ENDIF plugins.length -->
			<li class="dropdown menu-item">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">高级</a>
				<ul class="dropdown-menu" role="menu">
					<li><a href="{relative_path}/admin/advanced/database">数据库</a></li>
                    <li><a href="{relative_path}/admin/advanced/events">活动</a></li>
                    <li><a href="{relative_path}/admin/advanced/logs">日志</a></li>
                    <li><a href="{relative_path}/admin/advanced/post-cache">Post 缓存</a></li>
                    <!-- IF env -->
                    <li><a href="{relative_path}/admin/development/logger">记录仪</a></li>
					<!-- ENDIF env -->
				</ul>
			</li>
		</ul>
	</nav>