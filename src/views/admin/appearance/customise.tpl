<div id="customise" class="customise">
	<ul class="nav nav-pills">
		<li class="active"><a href="#custom-css" data-toggle="tab">自定义 CSS</a></li>
		<li><a href="#custom-header" data-toggle="tab">自定义 Header</a></li>
	</ul>
	<br />
	<div class="tab-content">
		<div class="tab-pane fade active in" id="custom-css">
			<p>
				在这里输入你自己的CSS声明，将所有其他样式后应用。
			</p>
			<div id="customCSS"></div>
			<input type="hidden" id="customCSS-holder" value="" data-field="customCSS" />

			<br />
			<form class="form">
				<div class="form-group">
					<label class="mdl-switch mdl-js-switch mdl-js-ripple-effect" for="useCustomCSS">
						<input class="mdl-switch__input" id="useCustomCSS" type="checkbox" data-field="useCustomCSS" />
						<span class="mdl-switch__label">启用自定义CSS</span>
					</label>
				</div>
			</form>
		</div>
		<div class="tab-pane fade" id="custom-header">
			<p>
				在此输入自定义HTML (ex. JavaScript, Meta Tags, etc.), 这将被附加到 <code>&lt;head&gt;</code> 页面的标记段.
			</p>

			<div id="customHTML"></div>
			<input type="hidden" id="customHTML-holder" value="" data-field="customJS" />

			<br />
			<form class="form">
				<div class="form-group">
					<label class="mdl-switch mdl-js-switch mdl-js-ripple-effect" for="useCustomJS">
						<input class="mdl-switch__input" id="useCustomJS" type="checkbox" data-field="useCustomJS" />
						<span class="mdl-switch__label">启用自定义页</span>
					</label>
				</div>
			</form>
		</div>
	</div>
</div>

<button id="save" class="floating-button mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored">
	<i class="material-icons">save</i>
</button>