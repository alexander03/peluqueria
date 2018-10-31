<div id="divMensajeError{!! $entidad !!}"></div>
{!! Form::model($servicio, $formData) !!}	
	{!! Form::hidden('listar', $listar, array('id' => 'listar')) !!}
	<div class="form-group">
		{!! Form::label('descripcion', 'Descripción:', array('class' => 'col-lg-3 col-md-3 col-sm-3 control-label')) !!}
		<div class="col-lg-9 col-md-9 col-sm-9">
			{!! Form::text('descripcion', null, array('class' => 'form-control input-xs', 'id' => 'name', 'placeholder' => 'Ingrese descripción')) !!}
		</div>
	</div>
	<div class="form-group">
		{!! Form::label('precio', 'Precio:', array('class' => 'col-lg-3 col-md-3 col-sm-3 control-label')) !!}
		<div class="col-lg-9 col-md-9 col-sm-9">
			{!! Form::text('precio', null, array('class' => 'form-control input-xs', 'id' => 'name', 'placeholder' => 'Ingrese precio')) !!}
		</div>
	</div>
	<div class="form-group">
		{!! Form::label('tipocomision', 'Tipo de Comisión:', array('class' => 'col-lg-3 col-md-3 col-sm-3 control-label')) !!}
		<div class="col-lg-9 col-md-9 col-sm-9">
			@if($servicio == null)
			<select id="tipocomision" name="tipocomision" class="form-control input-xs">
				<option disabled selected>SELECCIONE TIPO DE COMISIÓN</option>
				<option value="0">PORCENTAJE ( % )</option>
				<option value="1">MONTO (S/.)</option>
			</select>
			@else
				@if($servicio->tipo_comision == 0)
				<select id="tipocomision" name="tipocomision" class="form-control input-xs">
					<option disabled >SELECCIONE TIPO DE COMISIÓN</option>
					<option selected value="0">PORCENTAJE ( % )</option>
					<option value="1">MONTO (S/.)</option>
				</select>
				@elseif($servicio->tipo_comision == 1)
				<select id="tipocomision" name="tipocomision" class="form-control input-xs">
					<option disabled >SELECCIONE TIPO DE COMISIÓN</option>
					<option value="0">PORCENTAJE ( % )</option>
					<option selected value="1">MONTO (S/.)</option>
				</select>
				@endif
			@endif
		</div>
	</div>
	<div class="form-group">
		{!! Form::label('comision', 'Comisión:', array('class' => 'col-lg-3 col-md-3 col-sm-3 control-label')) !!}
		<div class="col-lg-9 col-md-9 col-sm-9">
			{!! Form::text('comision', null, array('class' => 'form-control input-xs', 'id' => 'name', 'placeholder' => 'Ingrese comisión')) !!}
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
	configurarAnchoModal('450');
	init(IDFORMMANTENIMIENTO+'{!! $entidad !!}', 'M', '{!! $entidad !!}');
}); 
</script>