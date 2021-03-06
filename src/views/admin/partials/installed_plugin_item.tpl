					<!-- IF !installed.error -->
					<li id="{installed.id}" data-plugin-id="{installed.id}" data-version="{installed.version}" class="clearfix">
						<div class="pull-right">
							<!-- IF installed.isTheme -->
							<a href="{config.relative_path}/admin/appearance/themes" class="btn btn-info">主题</a>
							<!-- ELSE -->
							<button data-action="toggleActive" class="btn <!-- IF installed.active --> btn-warning<!-- ELSE --> btn-success<!-- ENDIF installed.active -->"><i class="fa fa-power-off"></i> <!-- IF installed.active -->停用<!-- ELSE -->启用<!-- ENDIF installed.active --></button>
							<!-- ENDIF installed.isTheme -->

							<button data-action="toggleInstall" data-installed="1" class="btn btn-danger"><i class="fa fa-trash-o"></i> 卸载</button>
						</div>

						<h2><strong>{installed.name}</strong></h2>

						<!-- IF installed.description -->
						<p>{installed.description}</p>
						<!-- ENDIF installed.description -->
						<!-- IF installed.outdated --><i class="fa fa-exclamation-triangle text-danger"></i> <!-- ENDIF installed.outdated --><small>安装 <strong class="currentVersion">{installed.version}</strong> | 最新 <strong class="latestVersion">{installed.latest}</strong></small>
						<!-- IF installed.outdated -->
							<button data-action="upgrade" class="btn btn-success btn-xs"><i class="fa fa-download"></i> 升级</button>
						<!-- ENDIF installed.outdated -->
						<!-- IF installed.url -->
						<p>了解更多信息: <a target="_blank" href="{installed.url}">{installed.url}</a></p>
						<!-- ENDIF installed.url -->
					</li>
					<!-- ENDIF !installed.error -->
					<!-- IF installed.error -->
					<li data-plugin-id="{installed.id}" class="clearfix">
						<div class="pull-right">
							<button class="btn btn-default disabled"><i class="fa fa-exclamation-triangle"></i> 未知</button>

							<button data-action="toggleInstall" data-installed="1" class="btn btn-danger"><i class="fa fa-trash-o"></i> 卸载</button>
						</div>

						<h2><strong>{installed.id}</strong></h2>
						<p>
							这个插件的状态不能确定，可能是由于配置不当的错误。
						</p>
					</li>
					<!-- ENDIF installed.error -->
