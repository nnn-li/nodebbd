<div id="rewards">
	<div class="col-lg-9">
		<div class="panel panel-default">
			<div class="panel-heading"> 授予悬赏</div>
			<div class="panel-body">
				<ul id="active">
					<!-- BEGIN active -->
					<li data-rid="{active.rid}" data-id="{active.id}">
						<form class="main inline-block">
							<div class="well inline-block">
								<label for="condition">If User's</label><br />
								<select name="condition" data-selected="{active.condition}">
									<!-- BEGIN conditions -->
									<option value="{conditions.condition}">{conditions.name}</option>
									<!-- END conditions -->
								</select>
							</div>
							<div class="well inline-block">
								<label for="condition">Is:</label><br />
								<select name="conditional" data-selected="{active.conditional}">
									<!-- BEGIN conditionals -->
									<option value="{conditionals.conditional}">{conditionals.name}</option>
									<!-- END conditionals -->
								</select>
								<input type="text" name="value" value="{active.value}" />
							</div>
							<div class="well inline-block">
								<label for="condition">Then:</label><br />
								<select name="rid" data-selected="{active.rid}">
									<!-- BEGIN rewards -->
									<option value="{rewards.rid}">{rewards.name}</option>
									<!-- END rewards -->
								</select>
							</div>
						</form>

						<form class="rewards inline-block">
							<div class="inputs well inline-block"></div>
						</form>
						<div class="clearfix"></div>

						<div class="pull-right">
							<div class="panel-body inline-block">
								<form class="main">
									<label for="claimable">Amount of times reward is claimable</label><br />
									<input type="text" name="claimable" value="{active.claimable}" placeholder="1" />
									<small>无限输入 0</small>
								</form>
							</div>
							<div class="panel-body inline-block">
								<button class="btn btn-danger delete">删除</button>
								<!-- IF active.disabled -->
								<button class="btn btn-success toggle">启用</button>
								<!-- ELSE -->
								<button class="btn btn-warning toggle">关闭</button>
								<!-- ENDIF active.disabled -->
							</div>
						</div>
						<div class="clearfix"></div>
					</li>
					<!-- END active -->
				</ul>
			</div>
		</div>
	</div>

	<div class="col-lg-3 acp-sidebar">
		<div class="panel panel-default">
			<div class="panel-heading">悬赏 控制</div>
			<div class="panel-body">
				<button class="btn btn-success btn-md" id="new">发布悬赏</button>
				<button class="btn btn-primary btn-md" id="save">保存更改</button>
			</div>
		</div>
	</div>
</div>