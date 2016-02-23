<!-- IMPORT admin/settings/header.tpl -->

<div class="row">
	<div class="col-sm-2 col-xs-12 settings-header">
		Posts
	</div>
	<div class="col-sm-10 col-xs-12">
		<form>
			<div class="checkbox">
				<label class="mdl-switch mdl-js-switch mdl-js-ripple-effect">
					<input class="mdl-switch__input" type="checkbox" data-field="allowFileUploads">
					<span class="mdl-switch__label"><strong>允许用户上传常规文件</strong></span>
				</label>
			</div>

			<div class="checkbox">
				<label class="mdl-switch mdl-js-switch mdl-js-ripple-effect">
					<input class="mdl-switch__input" type="checkbox" data-field="privateUploads">
					<span class="mdl-switch__label"><strong>制作上传的文件私有</strong></span>
				</label>
			</div>

			<div class="checkbox">
				<label class="mdl-switch mdl-js-switch mdl-js-ripple-effect">
					<input class="mdl-switch__input" type="checkbox" data-field="allowGuestUploads">
					<span class="mdl-switch__label"><strong>让游客长传文件</strong></span>
				</label>
			</div>
			
			<div class="form-group">
				<label for="maximumFileSize">最大文件大小</label>
				<input type="text" class="form-control" value="2048" data-field="maximumFileSize">
			</div>

			<div class="checkbox">
				<label class="mdl-switch mdl-js-switch mdl-js-ripple-effect">
					<input class="mdl-switch__input" type="checkbox" data-field="allowTopicsThumbnail">
					<span class="mdl-switch__label"><strong>允许用户上传主题缩略图</strong></span>
				</label>
			</div>

			<div class="form-group">
				<label for="topicThumbSize">主题缩略图大小</label>
				<input type="text" class="form-control" value="120" data-field="topicThumbSize"> 
			</div>

			<div class="form-group">
				<label for="allowedFileExtensions">允许的文件扩展名</label>
				<input type="text" class="form-control" value="" data-field="allowedFileExtensions" />
				<p class="help-block">
					输入文件扩展名的逗号分隔列表 here (e.g. <code>pdf,xls,doc</code>).
					空列表意味着所有的扩展都是允许的。
				</p>
			</div>
		</form>
	</div>
</div>

<!-- IMPORT admin/settings/header.tpl -->

<div class="row">
	<div class="col-sm-2 col-xs-12 settings-header">
		个人资料头像
	</div>
	<div class="col-sm-10 col-xs-12">
		<form>
			<div class="checkbox">
				<label class="mdl-switch mdl-js-switch mdl-js-ripple-effect">
					<input class="mdl-switch__input" type="checkbox" data-field="allowProfileImageUploads">
					<span class="mdl-switch__label"><strong>允许用户上传个人资料图片</strong></span>
				</label>
			</div>

			<div class="checkbox">
				<label class="mdl-switch mdl-js-switch mdl-js-ripple-effect">
					<input class="mdl-switch__input" type="checkbox" data-field="profile:convertProfileImageToPNG">
					<span class="mdl-switch__label"><strong>转换的个人资料图片上传到PNG</strong></span>
				</label>
			</div>

			<div class="form-group">
				<label>自定义的默认头像</label>
				<div class="input-group">
					<input id="defaultAvatar" type="text" class="form-control" placeholder="A custom image to use instead of user icons" data-field="defaultAvatar" />
					<span class="input-group-btn">
						<input data-action="upload" data-target="defaultAvatar" data-route="{config.relative_path}/api/admin/uploadDefaultAvatar" type="button" class="btn btn-default" value="Upload"></input>
					</span>
				</div>
			</div>

			<div class="form-group">
				<label for="profileImageDimension">简介的图片尺寸</label>
				<input id="profileImageDimension" type="text" class="form-control" data-field="profileImageDimension" placeholder="128" />
			</div>

			<div class="form-group">
				<label>最大简介的图片文件大小</label>
				<input type="text" class="form-control" placeholder="Maximum size of uploaded user images in kilobytes" data-field="maximumProfileImageSize" />
			</div>

			<div class="form-group">
				<label>最大封面图片文件大小</label>
				<input type="text" class="form-control" placeholder="Maximum size of uploaded cover images in kilobytes" data-field="maximumCoverImageSize" />
			</div>
		</form>
	</div>
</div>

<div class="row">
	<div class="col-sm-2 col-xs-12 settings-header">配置文件包含</div>
	<div class="col-sm-10 col-xs-12">
		<form>
			<label for="profile:defaultCovers"><strong>默认封面图片</strong></label>
			<p class="help-block">
				添加逗号分隔的默认封面图像，没有上传封面图片帐户
			</p>
			<input type="text" class="form-control input-lg" id="profile:defaultCovers" data-field="profile:defaultCovers" value="{config.relative_path}/images/cover-default.png" placeholder="https://zanjs.com/group1.png, https://zanjs.com/group2.png" />
		</form>
	</div>
</div>

<!-- IMPORT admin/settings/footer.tpl -->