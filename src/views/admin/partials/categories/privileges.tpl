					<table class="table table-striped table-hover privilege-table">
						<tr>
							<th colspan="2">用户</th>
							<!-- BEGIN privileges.labels.users -->
							<th class="text-center">{privileges.labels.users.name}</th>
							<!-- END privileges.labels.users -->
						</tr>
						<!-- IF privileges.users.length -->
						<!-- BEGIN privileges.users -->
						<tr data-uid="{privileges.users.uid}">
							<td>
								<!-- IF ../picture -->
								<img class="avatar avatar-sm" src="{privileges.users.picture}" title="{privileges.users.username}" />
								<!-- ELSE -->
								<div class="avatar avatar-sm" style="background-color: {../icon:bgColor};">{../icon:text}</div>
								<!-- ENDIF ../picture -->
							</td>
							<td>{privileges.users.username}</td>
							{function.spawnPrivilegeStates, privileges.users.username, privileges}
						</tr>
						<!-- END privileges.users -->
						<tr>
							<td colspan="{privileges.columnCount}">
								<button type="button" class="btn btn-primary pull-right" data-ajaxify="false" data-action="search.user"> 添加用户</button>
							</td>
						</tr>
						<!-- ELSE -->
						<tr>
							<td colspan="{privileges.columnCount}">
								<button type="button" class="btn btn-primary pull-right" data-ajaxify="false" data-action="search.user"> 添加用户</button>
								此类别中没有用户特定权限。
							</td>
						</tr>
						<!-- ENDIF privileges.users.length -->
					</table>

					<table class="table table-striped table-hover privilege-table">
						<tr>
							<th colspan="2">组</th>
							<!-- BEGIN privileges.labels.groups -->
							<th class="text-center">{privileges.labels.groups.name}</th>
							<!-- END privileges.labels.groups -->
						</tr>
						<!-- BEGIN privileges.groups -->
						<tr data-group-name="{privileges.groups.name}" data-private="<!-- IF privileges.groups.isPrivate -->1<!-- ELSE -->0<!-- ENDIF privileges.groups.isPrivate -->">
							<td>
								<!-- IF privileges.groups.isPrivate -->
								<i class="fa fa-lock text-muted" title="This group is private"></i>
								<!-- ENDIF privileges.groups.isPrivate -->
								{privileges.groups.name}
							</td>
							<td></td>
							{function.spawnPrivilegeStates, name, privileges}
						</tr>
						<!-- END privileges.groups -->
						<tr>
							<td colspan="{privileges.columnCount}">
								<div class="btn-toolbar">
									<button type="button" class="btn btn-primary pull-right" data-ajaxify="false" data-action="search.group"> 添加 组</button>
									<button type="button" class="btn btn-info pull-right" data-ajaxify="false" data-action="copyToChildren"> 复制 to Children</button>
								</div>
							</td>
						</tr>
					</table>
					<div class="help-block">
						If the <code>注册用户</code> 组被授予特定权限, 所有其他组收到
						<strong>隐性权限</strong>, 即使它们没有明确定义/检查. 这隐含
权限显示给你，因为所有用户都部分 <code>注册用户</code> 用户组,
						所以, 额外的权限群体不需要明确授予。
					</div>
