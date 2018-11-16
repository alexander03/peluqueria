<div id="divMensajeError{!! $entidad !!}"></div>
{!! Form::model($movimiento, $formData) !!}	
	<div class="form-group">
		{!! Form::hidden('listar', $listar, array('id' => 'listar')) !!}
		{!! Form::hidden('sucursal',null,array('id'=>'sucursal')) !!}
		{!! Form::hidden('tipopago',null,array('id'=>'tipopago')) !!}
		{!! Form::hidden('total',null,array('id'=>'total')) !!}
		{!! Form::hidden('persona_id', $persona_id,array('id'=>'persona_id')) !!}
	</div>
	<div class="form-group">
		<div class="control-label col-lg-4 col-md-4 col-sm-4" style ="padding-top: 15px">
			{!! Form::label('fecha', 'Fecha:')!!}
		</div>
		<div class="col-lg-6 col-md-6 col-sm-6">
			{!! Form::text('fecha', '', array('class' => 'form-control input-xs', 'id' => 'fecha', 'readOnly')) !!}
		</div>
	</div>
	<div class="form-group">		
		<div class="control-label col-lg-4 col-md-4 col-sm-4" style ="padding-top: 15px">
			{!! Form::label('num_caja', 'Nro:')!!}
		</div>
		<div class="col-lg-6 col-md-6 col-sm-6">
			{!! Form::text('num_caja', '', array('class' => 'form-control input-xs', 'id' => 'num_caja', 'readOnly')) !!}
		</div>
	</div>
	<div class="form-group">
		<div class="control-label col-lg-4 col-md-4 col-sm-4" style ="padding-top: 15px">
			{!! Form::label('concepto', 'Concepto:')!!}
		</div>
		<div class="col-lg-6 col-md-6 col-sm-6">
			{!! Form::text('concepto', '', array('class' => 'form-control input-xs', 'id' => 'concepto', 'readOnly')) !!}
			{!! Form::hidden('concepto_id',null,array('id'=>'concepto_id')) !!}
		</div>
	</div>
	<div class="form-group">
		<div class="control-label col-lg-4 col-md-4 col-sm-4" style ="padding-top: 15px">
			{!! Form::label('comentario', 'Comentario:')!!}
		</div>
		<div class="col-lg-8 col-md-8 col-sm-8">
			<textarea class="form-control input-xs" id="comentario" cols="10" rows="5" name="comentario"></textarea>
		</div>
	</div>
	<div class="form-group">
		<div class="col-lg-12 col-md-12 col-sm-12 text-right">
			{!! Form::button('<i class="fa fa-check fa-lg"></i> '.$boton, array('class' => 'btn btn-success btn-sm', 'id' => 'btnGuardar', 'onclick' => 'guardar(\''.$entidad.'\', this)')) !!}
			{!! Form::button('<i class="fa fa-exclamation fa-lg"></i> Cancelar', array('class' => 'btn btn-warning btn-sm', 'id' => 'btnCancelar'.$entidad, 'onclick' => 'cerrarModal();')) !!}
		</div>
	</div>
{!! Form::close() !!}
<script type="text/javascript">
$(document).ready(function() {
	configurarAnchoModal('400');
	init(IDFORMMANTENIMIENTO+'{!! $entidad !!}', 'M', '{!! $entidad !!}');
	//SUCURSAL
	var sucursal = $('#sucursal_id').val();
	$('#sucursal').val(sucursal);

	// a continuacion creamos la fecha en la variable date
	var date = new Date()
	// Luego le sacamos los datos año, dia, mes 
	// y numero de dia de la variable date
	var año = date.getFullYear()
	var mes = date.getMonth()
	var ndia = date.getDate()
	//Damos a los meses el valor en número
	mes+=1;
	if(mes<10) mes="0"+mes;
	if(ndia<10) ndia="0"+ndia;
	//juntamos todos los datos en una variable
	var fecha = ndia + "/" + mes + "/" + año

	$('#fecha').val(fecha);

	//CONCEPTO
	$('#concepto').val('APERTURA DE CAJA');
	$('#concepto_id').val(1);

	//NRO MOVIMIENTO
	$('#num_caja').val({{$num_caja}});

	//TIPO PAGO
	$('#tipopago').val(1);

	//TOTAL
	$('#total').val(0);

	$('#comentario').focus();

}); 
</script>

