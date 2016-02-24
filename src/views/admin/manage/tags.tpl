<div class="tags row">

	<div class="col-lg-9">
		<div class="panel panel-default tag-management">
			<div class="panel-body">
				<!-- IF !tags.length -->
				您的论坛话题没有任何有关标签.
				<!-- ENDIF !tags.length -->
				<div class="tag-list">
					<!-- BEGIN tags -->
					<div class="tag-row" data-tag="{tags.value}">
						<div data-value="{tags.value}">
							<span class="tag-item" data-tag="{tags.value}" style="<!-- IF tags.color -->color: {tags.color};<!-- ENDIF tags.color --><!-- IF tags.bgColor -->background-color: {tags.bgColor};<!-- ENDIF tags.bgColor -->">{tags.value}</span><span class="tag-topic-count"><a href="{config.relative_path}/tags/{tags.value}" target="_blank">{tags.score}</a></span>
						</div>
						<div class="tag-modal hidden">
							<div class="form-group">
								<label for="bgColor">背景颜色</label>
								<input id="bgColor" placeholder="#ffffff" data-name="bgColor" value="{tags.bgColor}" class="form-control category_bgColor" />
							</div>
							<div class="form-group">
								<label for="color">文字颜色</label>
								<input id="color" placeholder="#a2a2a2" data-name="color" value="{tags.color}" class="form-control category_color" />
							</div>
						</div>
					</div>
					<!-- END tags -->
				</div>
			</div>
		</div>
	</div>

	<div class="col-lg-3 acp-sidebar">
		<div class="panel panel-default">
			<div class="panel-heading">修改标签</div>
			<div class="panel-body">
				<p>通过点击和/或拖动，使用Shift选择标签选择多个.</p>
				<button class="btn btn-primary btn-block" id="modify">修改标签</button>
				<button class="btn btn-warning btn-block" id="deleteSelected">删除标签</button>
			</div>
		</div>

		<div class="panel panel-default">
			<div class="panel-body">
				<input class="form-control" type="text" id="tag-search" placeholder="Search for tags..."/><br/>
				Click <a href="/admin/settings/tags">here</a> 访问标签设置页面.
			</div>
		</div>
	</div>

</div>
