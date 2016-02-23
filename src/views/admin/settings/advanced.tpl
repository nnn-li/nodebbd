<!-- IMPORT admin/settings/header.tpl -->

<div class="row">
	<div class="col-sm-2 col-xs-12 settings-header">维护模式</div>
	<div class="col-sm-10 col-xs-12">
		<form>
			<div class="checkbox">
				<label class="mdl-switch mdl-js-switch mdl-js-ripple-effect">
					<input class="mdl-switch__input" type="checkbox" data-field="maintenanceMode">
					<span class="mdl-switch__label"><strong>维护模式</strong></span>
				</label>
			</div>
			<p class="help-block">
				当论坛处于维护模式，所有的请求将被重定向到一个静态保持页面。
				管理员是从这个豁免的重定向，并且能够正常访问网站。
			</p>
			<div class="form-group">
				<label for="maintenanceModeMessage">维护信息</label>
				<textarea class="form-control" data-field="maintenanceModeMessage"></textarea>
			</div>
		</form>
	</div>
</div>

<div class="row">
	<div class="col-sm-2 col-xs-12 settings-header">Headers</div>
	<div class="col-sm-10 col-xs-12">
		<form>
			<div class="form-group">
				<label for="allow-from-uri">设置允许 - 从以地方NodeBB在iframe</label>
				<input class="form-control" id="allow-from-uri" type="text" placeholder="external-domain.com" data-field="allow-from-uri" /><br />
			</div>
			<div class="form-group">
				<label for="powered-by">自定义的“技术支持”的NodeBB发送头</label>
				<input class="form-control" id="powered-by" type="text" placeholder="NodeBB" data-field="powered-by" /><br />
			</div>
			<div class="form-group">
				<label for="access-control-allow-origin">访问控制允许来源</label>
				<input class="form-control" id="access-control-allow-origin" type="text" placeholder="null" value="null" data-field="access-control-allow-origin" /><br />
				<p class="help-block">
					要拒绝访问的所有网站，留空或设为 <code>null</code>
				</p>
			</div>
			<div class="form-group">
				<label for="access-control-allow-methods">访问控制允许的方法</label>
				<input class="form-control" id="access-control-allow-methods" type="text" placeholder="" data-field="access-control-allow-methods" /><br />
			</div>
			<div class="form-group">
				<label for="access-control-allow-headers">访问控制允许报头</label>
				<input class="form-control" id="access-control-allow-headers" type="text" placeholder="" data-field="access-control-allow-headers" /><br />
			</div>
		</form>
	</div>
</div>

<div class="row">
	<div class="col-sm-2 col-xs-12 settings-header">Cookies</div>
	<div class="col-sm-10 col-xs-12">
		<form>
			<div class="form-group">
				<label for="cookieDomain">设置 域 for session cookie</label>
				<input class="form-control" id="cookieDomain" type="text" placeholder=".domain.tld" data-field="cookieDomain" /><br />
				<p class="help-block">
					留空默认
				</p>
			</div>
		</form>
	</div>
</div>

<div class="row">
	<div class="col-sm-2 col-xs-12 settings-header">Traffic 管理</div>
	<div class="col-sm-10 col-xs-12">
		<p class="help-block">
			NodeBB部署配备了自动拒绝在高流量的请求的模块的情况。您可以在这里调整这些设置，虽然默认值是一个良好的端口。
		</p>
		<form>
			<div class="form-group">
				<label class="mdl-switch mdl-js-switch mdl-js-ripple-effect" for="eventLoopCheckEnabled">
					<input class="mdl-switch__input" id="eventLoopCheckEnabled" type="checkbox" data-field="eventLoopCheckEnabled" checked />
					<span class="mdl-switch__label">启用 Traffic 管理</span>
				</label>
			</div>
			<div class="form-group">
				<label for="eventLoopLagThreshold">事件循环滞后阈值（毫秒）</label>
				<input class="form-control" id="eventLoopLagThreshold" type="number" data-field="eventLoopLagThreshold" placeholder="Default: 70" step="10" min="10" value="70" />
				<p class="help-block">
					减小该值会减少等待页面加载时间，同时也将显示“过载”的消息给更多的用户。 （需要重新加载）
				</p>
			</div>
			<div class="form-group">
				<label for="eventLoopInterval">检查间隔（毫秒）</label>
				<input class="form-control" id="eventLoopInterval" type="number" data-field="eventLoopInterval" placeholder="Default: 500" value="500" step="50" />
				<p class="help-block">
					<!--Lowering this value causes NodeBB to become more sensitive to spikes in load, but
					may also cause the check to become too sensitive. (Reload required)-->
                    降低此值会导致NodeBB成为对负载峰值更敏感，但也可能会导致支票变得过于敏感。 （需要重新加载）
				</p>
			</div>
		</form>
	</div>
</div>

<!-- IMPORT admin/settings/footer.tpl -->
