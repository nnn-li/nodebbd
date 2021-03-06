<div class="sounds settings" class="row">
	<form role="form">
		<div class="row">
			<div class="col-sm-2 col-xs-12 settings-header">通知</div>
			<div class="col-sm-10 col-xs-12">
				<label for="notification">通知</label>
				<div class="row">
					<div class="form-group col-xs-9">
						<select class="form-control" id="notification" name="notification">
							<option value=""></option>
							<!-- BEGIN sounds -->
							<option value="{sounds.name}">{sounds.name}</option>
							<!-- END sounds -->
						</select>
					</div>
					<div class="btn-group col-xs-3">
						<button type="button" class="form-control btn btn-sm btn-default" data-action="play">播放 <i class="fa fa-play"></i></button>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-sm-2 col-xs-12 settings-header">聊天消息</div>
			<div class="col-sm-10 col-xs-12">
				<label for="chat-incoming">收到消息</label>
				<div class="row">
					<div class="form-group col-xs-9">
						<select class="form-control" id="chat-incoming" name="chat-incoming">
							<option value=""></option>
							<!-- BEGIN sounds -->
							<option value="{sounds.name}">{sounds.name}</option>
							<!-- END sounds -->
						</select>
					</div>
					<div class="btn-group col-xs-3">
						<button type="button" class="form-control btn btn-sm btn-default" data-action="play">播放 <i class="fa fa-play"></i></button>
					</div>
				</div>

				<label for="chat-outgoing">发出消息</label>
				<div class="row">
					<div class="form-group col-xs-9">
						<select class="form-control" id="chat-outgoing" name="chat-outgoing">
							<option value=""></option>
							<!-- BEGIN sounds -->
							<option value="{sounds.name}">{sounds.name}</option>
							<!-- END sounds -->
						</select>
					</div>
					<div class="btn-group col-xs-3">
						<button type="button" class="form-control btn btn-sm btn-default" data-action="play">播放 <i class="fa fa-play"></i></button>
					</div>
				</div>
			</div>
		</div>
	</form>
</div>

<button id="save" class="floating-button mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored">
	<i class="material-icons">save</i>
</button>