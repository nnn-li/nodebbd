<div class="row dashboard">
	<div class="col-lg-9">
		<div class="panel panel-default">
			<div class="panel-heading">论坛 Traffic</div>
			<div class="panel-body">
				<div class="graph-container">
					<ul class="graph-legend">
						<li><div class="page-views"></div><span>页面访问量</span></li>
						<li><div class="unique-visitors"></div><span>唯一访问者</span></li>
					</ul>
					<canvas id="analytics-traffic" width="100%" height="400"></canvas>
				</div>
				<hr/>
				<div class="text-center pull-left monthly-pageviews">
					<div><strong id="pageViewsLastMonth"></strong></div>
					<div><a href="#" data-action="updateGraph" data-units="days" data-until="last-month">上个页面月访问量</a></div>
				</div>
				<div class="text-center pull-left monthly-pageviews">
					<div><strong id="pageViewsThisMonth"></strong></div>
					<div><a href="#" data-action="updateGraph" data-units="days">本月页面浏览量</a></div>
				</div>
				<div class="text-center pull-left monthly-pageviews">
					<div><strong id="pageViewsPastDay"></strong></div>
					<div><a href="#" data-action="updateGraph" data-units="hours">在过去的24小时页面访问量</a></div>
				</div>
			</div>
		</div>

		<div class="row">
			<!-- BEGIN stats -->
			<div class="col-lg-6">
				<div class="panel panel-default">
					<div class="panel-heading">{stats.name}</div>
					<div class="panel-body">
						<div id="unique-visitors">
							<div class="text-center pull-left">
								<span class="formatted-number">{stats.day}</span>
								<div>天</div>
							</div>
							<div class="text-center pull-left">
								<span class="formatted-number">{stats.week}</span>
								<div>周</div>
							</div>
							<div class="text-center pull-left">
								<span class="formatted-number">{stats.month}</span>
								<div>月</div>
							</div>
							<div class="text-center pull-left">
								<span class="formatted-number">{stats.alltime}</span>
								<div>所有时间</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- END stats -->

			<div class="col-lg-6">
				<div class="panel panel-default">
					<div class="panel-heading">更新</div>
					<div class="panel-body">
						<div class="alert alert-info version-check">
							<p>You are running <strong>NodeBB v<span id="version">{version}</span></strong>.</p>
						</div>
						<p>
							务必确保您的NodeBB是最新的最新的安全补丁和漏洞修复。
						</p>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div class="panel panel-default">
					<div class="panel-heading">Notices</div>
					<div class="panel-body">
					<!-- BEGIN notices -->
						<div>
							<!-- IF notices.done -->
							<i class="fa fa-fw fa-check text-success"></i> {notices.doneText}
							<!-- ELSE -->
							<!-- IF notices.link --><a href="{notices.link}" data-toggle="tooltip" title="{notices.tooltip}"><!-- ENDIF notices.link -->
							<i class="fa fa-fw fa-times text-danger"></i> {notices.notDoneText}
							<!-- IF notices.link --></a><!-- ENDIF notices.link -->
							<!-- ENDIF notices.done -->
						</div>
					<!-- END notices -->
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="col-lg-3">
		<div class="panel panel-default">
			<div class="panel-heading">系统控制</div>
			<div class="panel-body text-center">
				<p>
					<button class="btn btn-warning reload" data-placement="bottom" data-toggle="tooltip" title="刷新激活新的插件">刷新</button>
					<button class="btn btn-danger restart" data-placement="bottom" data-toggle="tooltip" title="重新启动将下降几秒钟，所有现有连接">重新启动</button>
				</p>
				<p>
					<a href="{config.relative_path}/admin/settings/advanced" class="btn btn-info" data-placement="bottom" data-toggle="tooltip" title="点击这里设的维护模式">维护模式</a>
				</p>

				<hr />
				<span id="toggle-realtime">实时更新图 <strong>OFF</strong> <i class="fa fa fa-toggle-off pointer"></i></span>
			</div>
		</div>

		<div class="panel panel-default">
			<div class="panel-heading">匿名VS注册用户</div>
			<div class="panel-body">
				<div class="graph-container pie-chart legend-up">
					<ul class="graph-legend">
						<li><div class="anonymous"></div><span>匿名</span></li>
						<li><div class="registered"></div><span>注册</span></li>
					</ul>
					<canvas id="analytics-registered"></canvas>
				</div>
			</div>
		</div>

		<div class="panel panel-default">
			<div class="panel-heading">用户存在</div>
			<div class="panel-body">
				<div class="graph-container pie-chart legend-up">
					<ul class="graph-legend">
						<li><div class="on-categories"></div><span>在分类列表</span></li>
						<li><div class="reading-posts"></div><span>读帖</span></li>
						<li><div class="browsing-topics"></div><span>浏览主题</span></li>
						<li><div class="recent"></div><span>最近</span></li>
						<li><div class="unread"></div><span>未读</span></li>
					</ul>
					<canvas id="analytics-presence"></canvas>
				</div>
			</div>
		</div>

		<div class="panel panel-default">
			<div class="panel-heading">高亮主题</div>
			<div class="panel-body">
				<div class="graph-container pie-chart legend-down">
					<canvas id="analytics-topics"></canvas>
					<ul class="graph-legend" id="topics-legend"></ul>
				</div>
			</div>
		</div>



		<div class="panel panel-default">
			<div class="panel-heading">活跃用户</div>
			<div class="panel-body">
				<div id="active-users"></div>
			</div>
		</div>
	</div>
</div>