<div class="groups">
	<div class="col-lg-9">
		<div class="panel panel-default">
			<div class="panel-heading"><i class="fa fa-group"></i> 组列表</div>
			<div class="panel-body">

				<input id="group-search" type="text" class="form-control" placeholder="Search" /><br/>

				<table class="table table-striped groups-list">
					<tr>
						<th>组名称</th>
						<th>组描述</th>
					</tr>
					<!-- BEGIN groups -->
					<tr data-groupname="{groups.displayName}">
						<td>
							{groups.displayName}
							<!-- IF groups.system -->
							<span class="badge">System Group</span>
							<!-- ENDIF groups.system -->
						</td>
						<td>
							<div class="btn-group pull-right">
								<a href="{config.relative_path}/admin/manage/groups/{groups.nameEncoded}" class="btn btn-default btn-xs"><i class="fa fa-edit"></i> 编辑</a>
								<!-- IF !groups.system -->
								<button class="btn btn-danger btn-xs" data-action="delete"><i class="fa fa-times"></i></button>
								<!-- ENDIF !groups.system -->
							</div>
							<p class="description">{groups.description}</p>
						</td>
					</tr>
					<!-- END groups -->
				</table>
				<!-- IMPORT partials/paginator.tpl -->
			</div>
		</div>
	</div>

	<div class="col-lg-3 acp-sidebar">
		<div class="panel panel-default">
			<div class="panel-heading">组控制面板</div>
			<div class="panel-body">
				<div>
					<button class="btn btn-primary" id="create">新建组</button>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="create-modal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title">创建组</h4>
				</div>
				<div class="modal-body">
					<div class="alert alert-danger hide" id="create-modal-error"></div>
					<form>
						<div class="form-group">
							<label for="group-name">组名称</label>
							<input type="text" class="form-control" id="create-group-name" placeholder="Group Name" />
						</div>
						<div class="form-group">
							<label for="group-name">描述</label>
							<input type="text" class="form-control" id="create-group-desc" placeholder="A short description about your group" />
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="create-modal-go">创建</button>
				</div>
			</div>
		</div>
	</div>

</div>



