<!-- IMPORT admin/settings/header.tpl -->

<div class="row">
	<div class="col-sm-2 col-xs-12 settings-header">Post 排序</div>
	<div class="col-sm-10 col-xs-12">
		<form>
			<div class="form-group">
				<label>默认排序后</label>
				<select class="form-control" data-field="topicPostSort">
					<option value="oldest_to_newest">最旧到最新</option>
					<option value="newest_to_oldest">最新到最旧</option>
					<option value="most_votes">得票最多</option>
				</select>
			</div>
			<div class="form-group">
				<label>默认主题排序</label>
				<select class="form-control" data-field="categoryTopicSort">
					<option value="newest_to_oldest">最新到最旧</option>
					<option value="oldest_to_newest">最旧到最新</option>
					<option value="most_posts">得票最多</option>
				</select>
			</div>
		</form>
	</div>
</div>

<div class="row">
	<div class="col-sm-2 col-xs-12 settings-header">发帖限制</div>
	<div class="col-sm-10 col-xs-12">
		<form>
			<div class="form-group">
				<label for="postDelay">帖子间隔秒数</label>
				<input id="postDelay" type="text" class="form-control" value="10" data-field="postDelay">
			</div>
			<div class="form-group">
				<label for="newbiePostDelay">帖子新用户之间的秒数</label>
				<input id="newbiePostDelay" type="text" class="form-control" value="120" data-field="newbiePostDelay">
			</div>
			<div class="form-group">
				<label for="newbiePostDelayThreshold">在这个信誉阈值限制取消</label>
				<input id="newbiePostDelayThreshold" type="text" class="form-control" value="3" data-field="newbiePostDelayThreshold">
			</div>
			<div class="form-group">
				<label for="initialPostDelay">新的用户多少分钟后可以发布</label>
				<input id="initialPostDelay" type="text" class="form-control" value="10" data-field="initialPostDelay">
			</div>
			<div class="form-group">
				<label for="postEditDuration">多少分钟后允许发布后编辑帖子.</label>
				<input id="postEditDuration" type="text" class="form-control" value="0" data-field="postEditDuration">
			</div>
			<div class="form-group">
				<label for="minimumTitleLength">最小标题长度</label>
				<input id="minimumTitleLength" type="text" class="form-control" value="3" data-field="minimumTitleLength">
			</div>
			<div class="form-group">
				<label for="maximumTitleLength">最大标题长度</label>
				<input id="maximumTitleLength" type="text" class="form-control" value="255" data-field="maximumTitleLength">
			</div>
			<div class="form-group">
				<label for="minimumPostLength">最小帖子长度</label>
				<input id="minimumPostLength" type="text" class="form-control" value="8" data-field="minimumPostLength">
			</div>
			<div class="form-group">
				<label for="maximumPostLength">最大帖子长度</label>
				<input id="maximumPostLength" type="text" class="form-control" value="32767" data-field="maximumPostLength">
			</div>
			<div class="form-group">
				<label for="topicStaleDays"> 多少天后帖子视为无效</label>
				<input id="topicStaleDays" type="text" class="form-control" value="60" data-field="topicStaleDays">
				<p class="help-block">
					如果该主题被认为是“陈旧”，不是一个警告将显示给谁试图回复该主题的用户。
				</p>
			</div>
		</form>
	</div>
</div>

<div class="row">
	<div class="col-sm-2 col-xs-12 settings-header">预告设置</div>
	<div class="col-sm-10 col-xs-12">
		<form>
			<div class="form-group">
				<label>预告帖子</label>
				<select class="form-control" data-field="teaserPost">
					<option value="last">最后</option>
					<option value="first">第一</option>
				</select>
			</div>
		</form>
	</div>
</div>


<div class="row">
	<div class="col-sm-2 col-xs-12 settings-header">未读设置</div>
	<div class="col-sm-10 col-xs-12">
		<form>
			<div class="form-group">
				<label for="unreadCutoff">未读 days</label>
				<input id="unreadCutoff" type="text" class="form-control" value="2" data-field="unreadCutoff">
			</div>
		</form>
	</div>
</div>

<div class="row">
	<div class="col-sm-2 col-xs-12 settings-header">签名设置s</div>
	<div class="col-sm-10 col-xs-12">
		<form>
			<div class="checkbox">
				<label class="mdl-switch mdl-js-switch mdl-js-ripple-effect">
					<input class="mdl-switch__input" type="checkbox" data-field="disableSignatures">
					<span class="mdl-switch__label"><strong>禁用签名</strong></span>
				</label>
			</div>
			<div class="checkbox">
				<label class="mdl-switch mdl-js-switch mdl-js-ripple-effect">
					<input class="mdl-switch__input" type="checkbox" data-field="signatures:disableLinks">
					<span class="mdl-switch__label"><strong>在签名禁用链接</strong></span>
				</label>
			</div>
			<div class="checkbox">
				<label class="mdl-switch mdl-js-switch mdl-js-ripple-effect">
					<input class="mdl-switch__input" type="checkbox" data-field="signatures:disableImages">
					<span class="mdl-switch__label"><strong>在签名禁用图像</strong></span>
				</label>
			</div>
			<div class="form-group">
				<label>最大签名长度</label>
				<input type="text" class="form-control" value="255" data-field="maximumSignatureLength">
			</div>
		</form>
	</div>
</div>

<div class="row">
	<div class="col-sm-2 col-xs-12 settings-header">Composer 设置</div>
	<div class="col-sm-10 col-xs-12">
		<form>
			<p>
				下面的设置控制功能 and/or appearance of the post composer shown
				to 为用户在创建新的主题, or 回复现有主题.
			</p>
			<div class="checkbox">
				<label class="mdl-switch mdl-js-switch mdl-js-ripple-effect" for="composer:showHelpTab">
					<input class="mdl-switch__input" type="checkbox" id="composer:showHelpTab" data-field="composer:showHelpTab" checked />
					<span class="mdl-switch__label">显示帮助”选项卡</span>
				</label>
			</div>
			<div class="checkbox">
				<label class="mdl-switch mdl-js-switch mdl-js-ripple-effect" for="composer:allowPluginHelp">
					<input class="mdl-switch__input" type="checkbox" id="composer:allowPluginHelp" data-field="composer:allowPluginHelp" checked />
					<span class="mdl-switch__label">允许插件将内容添加到帮助标签</span>
				</label>
			</div>
			<div class="form-group">
				<label for="composer:customHelpText">自定义帮助文本</label>
				<textarea class="form-control" id="composer:customHelpText" data-field="composer:customHelpText" rows="5"></textarea>
			</div>
		</form>
	</div>
</div>

<div class="row">
	<div class="col-sm-2 col-xs-12 settings-header">IP跟踪</div>
	<div class="col-sm-10 col-xs-12">
		<form>
			<div class="checkbox">
				<label class="mdl-switch mdl-js-switch mdl-js-ripple-effect">
					<input class="mdl-switch__input" type="checkbox" data-field="trackIpPerPost">
					<span class="mdl-switch__label"><strong>跟踪每个发帖IP 地址</strong></span>
				</label>
			</div>
		</form>
	</div>
</div>
<!-- IMPORT admin/settings/footer.tpl -->