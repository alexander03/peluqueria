<div id="divMensajeError{!! $entidad !!}"></div>
{!! Form::model($sucursal, $formData) !!}	
	{!! Form::hidden('listar', $listar, array('id' => 'listar')) !!}
	<div class="form-group">
		{!! Form::label('serieventa', 'Num Serie:', array('class' => 'col-lg-5 col-md-5 col-sm-5 control-label')) !!}
		<div class="col-lg-7 col-md-7 col-sm-7">
			{!! Form::text('serieventa', $serieventaa->serie, array('class' => 'form-control input-xs', 'id' => 'serieventa', 'placeholder' => 'Serie Venta', 'readOnly')) !!}
		</div>
	</div>
	<div class="form-group">
		<div class="col-lg-12 col-md-12 col-sm-12 text-right">
		@if($cantidadserie == 1)
			@if($cantidad == 0)
				{!! Form::button('<i class="fa fa-plus fa-lg"></i> Aumentar', array('class' => 'btn btn-success btn-sm', 'id' => 'btnAumentar', 'onclick' => 'aumentarserie(\''.$sucursal->id.'\', this)', 'disabled' => 'disabled')) !!}
				{!! Form::button('<i class="fa fa-times fa-lg"></i> Eliminar', array('class' => 'btn btn-danger btn-sm', 'id' => 'btnEliminar', 'onclick' => 'eliminarserie(\''.$sucursal->id.'\', this)', 'disabled' => 'disabled')) !!}
				{!! Form::button('<i class="fa fa-exclamation fa-lg"></i> Cancelar', array('class' => 'btn btn-warning btn-sm', 'id' => 'btnCancelar'.$entidad, 'onclick' => 'cerrarModal(); buscar("Sucursal")')) !!}
			@else
				{!! Form::button('<i class="fa fa-plus fa-lg"></i> Aumentar', array('class' => 'btn btn-success btn-sm', 'id' => 'btnAumentar', 'onclick' => 'aumentarserie(\''.$sucursal->id.'\', this)')) !!}
				{!! Form::button('<i class="fa fa-times fa-lg"></i> Eliminar', array('class' => 'btn btn-danger btn-sm', 'id' => 'btnEliminar', 'onclick' => 'eliminarserie(\''.$sucursal->id.'\', this)', 'disabled' => 'disabled')) !!}
				{!! Form::button('<i class="fa fa-exclamation fa-lg"></i> Cancelar', array('class' => 'btn btn-warning btn-sm', 'id' => 'btnCancelar'.$entidad, 'onclick' => 'cerrarModal(); buscar("Sucursal")')) !!}
			@endif
		@else
			@if($cantidad == 0)
				{!! Form::button('<i class="fa fa-plus fa-lg"></i> Aumentar', array('class' => 'btn btn-success btn-sm', 'id' => 'btnAumentar', 'onclick' => 'aumentarserie(\''.$sucursal->id.'\', this)', 'disabled' => 'disabled')) !!}
				{!! Form::button('<i class="fa fa-times fa-lg"></i> Eliminar', array('class' => 'btn btn-danger btn-sm', 'id' => 'btnEliminar', 'onclick' => 'eliminarserie(\''.$sucursal->id.'\', this)')) !!}
				{!! Form::button('<i class="fa fa-exclamation fa-lg"></i> Cancelar', array('class' => 'btn btn-warning btn-sm', 'id' => 'btnCancelar'.$entidad, 'onclick' => 'cerrarModal(); buscar("Sucursal")')) !!}
			@else
				{!! Form::button('<i class="fa fa-plus fa-lg"></i> Aumentar', array('class' => 'btn btn-success btn-sm', 'id' => 'btnAumentar', 'onclick' => 'aumentarserie(\''.$sucursal->id.'\', this)')) !!}
				{!! Form::button('<i class="fa fa-times fa-lg"></i> Eliminar', array('class' => 'btn btn-danger btn-sm', 'id' => 'btnEliminar', 'onclick' => 'eliminarserie(\''.$sucursal->id.'\', this)', 'disabled' => 'disabled')) !!}
				{!! Form::button('<i class="fa fa-exclamation fa-lg"></i> Cancelar', array('class' => 'btn btn-warning btn-sm', 'id' => 'btnCancelar'.$entidad, 'onclick' => 'cerrarModal(); buscar("Sucursal")')) !!}
			@endif
		@endif
		</div>
	</div>
{!! Form::close() !!}
<script type="text/javascript">
$(document).ready(function() {
	configurarAnchoModal('350');
	init(IDFORMMANTENIMIENTO+'{!! $entidad !!}', 'M', '{!! $entidad !!}');
}); 

function aumentarserie(sucursal_id){

	var respuesta ="";

	var ajax = $.ajax({
		"method": "POST",
		"url": "{{ url('/sucursal/aumentarserieventa') }}",
		"data": {
			"sucursal_id" : sucursal_id, 
			"_token": "{{ csrf_token() }}",
			}
	}).done(function(info){
		respuesta = info;
	}).always(function(){
		actualizarserie(sucursal_id);
		$('#btnAumentar').prop('disabled',true);
		$('#btnEliminar').prop('disabled',false);
	});

}

function eliminarserie(sucursal_id){

	var respuesta ="";

	var ajax = $.ajax({
		"method": "POST",
		"url": "{{ url('/sucursal/eliminarserieventa') }}",
		"data": {
			"sucursal_id" : sucursal_id, 
			"_token": "{{ csrf_token() }}",
			}
	}).done(function(info){
		respuesta = info;
	}).always(function(){
		actualizarserie(sucursal_id);
		$('#btnAumentar').prop('disabled',false);
		$('#btnEliminar').prop('disabled',true);
	});

}

function actualizarserie(sucursal_id){

	var respuesta ="";

	var ajax = $.ajax({
		"method": "POST",
		"url": "{{ url('/sucursal/actualizarserieventa') }}",
		"data": {
			"sucursal_id" : sucursal_id, 
			"_token": "{{ csrf_token() }}",
			}
	}).done(function(info){
		respuesta = info;
	}).always(function(){
		$('#serieventa').val(respuesta);
	});

}
</script>