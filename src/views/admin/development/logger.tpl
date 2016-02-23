<div class="logger">
	<div class="col-lg-9">
		<div class="panel panel-default">
			<div class="panel-heading">记录器设置</div>
			<div class="panel-body">
				<p>
					通过启用复选框，您将收到日志到终端。如果指定路径，日志将被保存到一个文件来代替。
                     HTTP记录是收集关于谁，何时，人们对你的论坛访问哪些数据是有用的。除了记录的HTTP请求，我们也可以登录socket.io事件。
                     Socket.io记录，与Redis的-CLI显示器的组合，可以为学习NodeBB的内部非常有帮助。
				</p>
				<br/>
				<p>
					只需选中/取消选中的日志记录设置来启用或动态禁用日志记录。无需重新启动需要。
				</p>
				<br/>

				<form>

					<label>
						<input type="checkbox" data-field="loggerStatus"> <strong>启用HTTP记录</strong>
					</label>
					<br/>
					<br/>

					<label>
						<input type="checkbox" data-field="loggerIOStatus"> <strong>启用socket.io事件记录</strong>
					</label>
					<br/>
					<br/>

					<label>路径日志文件</label>
					<input class="form-control" type="text" placeholder="/path/to/log/file.log ::: 留空以登录到你的终端" data-field="loggerPath" />
				</form>
			</div>
		</div>

	</div>

	<div class="col-lg-3 acp-sidebar">
		<div class="panel panel-default">
			<div class="panel-heading">记录仪控制面板</div>
			<div class="panel-body">
				<button class="btn btn-primary" id="save">更新日志设置</button>
			</div>
		</div>
	</div>
</div>


<script>
	require(['admin/settings'], function(Settings) {
		Settings.prepare();
	});
</script>
