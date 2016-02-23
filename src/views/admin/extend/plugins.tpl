<ul class="nav nav-pills">
	<li class="active"><a href="#installed" data-toggle="tab">以安装的插件</a></li>
	<li><a href="#download" data-toggle="tab">下载插件</a></li>
</ul>
<br />

<div class="plugins row">
	<div class="col-lg-9">
		<div class="tab-content">
			<div class="tab-pane fade active in" id="installed">
				<ul class="installed">
					<!-- BEGIN installed -->
					<!-- IMPORT admin/partials/installed_plugin_item.tpl -->
					<!-- END installed -->
				</ul>
			</div>
			<div class="tab-pane fade" id="download">
				<div class="panel-body">
					<ul class="download">
						<!-- BEGIN download -->
						<!-- IMPORT admin/partials/download_plugin_item.tpl -->
						<!-- END download -->
					</ul>
				</div>
			</div>
		</div>
	</div>

	<div class="col-lg-3 acp-sidebar">
		<div class="panel panel-default">
			<div class="panel-heading">搜索插件</div>
			<div class="panel-body">
				<input autofocus class="form-control" type="text" id="plugin-search" placeholder="Search for plugin..."/><br/>
			</div>
		</div>

		<div class="panel panel-default">
			<div class="panel-heading">重新排序插件</div>
			<div class="panel-body">
				<button class="btn btn-default btn-block" id="plugin-order"><i class="fa fa-exchange"></i> 插件的前后状态</button>
			</div>
		</div>

		<div class="panel panel-default">
			<div class="panel-heading">有兴趣写论坛插件？</div>
			<div class="panel-body">
				<p>
				关于插件制作完整文档可以在找到 <a target="_blank" href="https://docs.nodebb.org/en/latest/plugins/create.html">论坛文档</a>.
				</p>
			</div>
		</div>
	</div>


	<div class="modal fade" id="order-active-plugins-modal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title">插件的前后状态</h4>
				</div>
				<div class="modal-body">
					<p>
						指定某些插件工作的前后排序时，他们被其他插件前/后初始化。
					</p>
					<p>
						在插件加载前后在此指定，从顶部到底部
					</p>
					<ul class="plugin-list"></ul>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="save-plugin-order">保存</button>
				</div>
			</div>
		</div>
	</div>


</div>


