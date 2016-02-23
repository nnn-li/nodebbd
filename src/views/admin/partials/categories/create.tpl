<form type="form">
	<div class="form-group">
		<label for="name">分类名称</label>
		<input type="text" class="form-control" name="name" id="name" />
	</div>
	<div class="form-group">
		<label for="parentCid">(Optional) 父类别</label>
		<select class="form-control" name="parentCid" id="parentCid">
			<option value=""></option>
			<!-- BEGIN categories -->
			<option value="{categories.cid}">{categories.name}</option>
			<!-- END categories -->
		</select>
	</div>
</form>