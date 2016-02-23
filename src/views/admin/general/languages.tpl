<div class="languages">
	<div class="row">
		<div class="col-sm-2 col-xs-12 settings-header">语言设置</div>
		<div class="col-sm-10 col-xs-12">
			<p>
				谁正在访问您的论坛 默认语言确定所有用户的语言设置. <br />
				个人用户可以覆盖默认的语言他们的帐户设置页面上.
			</p>

			<form class="row">
				<div class="form-group col-sm-6">
					<label for="defaultLang">默认语言</label>
					<select id="language" data-field="defaultLang" class="form-control">
						<!-- BEGIN languages -->
						<option value="{languages.code}" <!-- IF languages.selected -->selected<!-- ENDIF languages.selected -->>{languages.name} ({languages.code})</option>
						<!-- END languages -->
					</select>
				</div>
			</form>
		</div>
	</div>
</div>

<button id="save" class="floating-button mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored">
	<i class="material-icons">save</i>
</button>