<div id="divMensajeError{!! $entidad !!}"></div>
{!! Form::model($modelo, $formData) !!}
{!! Form::hidden('listar', $listar, array('id' => 'listar')) !!}

@if($modelo != null)
	@if($modelo->razonsocial !=null)
		<p><strong>Razón Social:</strong><p>{{ $modelo->razonsocial }}</p>
	@else
		<p><strong>Nombres y Apellidos:</strong> {{ $modelo->nombres . ' ' . $modelo->apellidos }}</p>
	@endif
	@if($modelo->dni != null )
		<p><strong>Documento:</strong> {{ $modelo->dni }}</p>
	@else
		<p><strong>Documento:</strong> {{ $modelo->ruc }}</p>
	@endif
	@if($modelo->direccion != null)
		<p><strong>Dirección:</strong> {{ $modelo->direccion }}</p>
	@endif
	@if($modelo->telefono != null)
		<p><strong>Teléfono:</strong> {{ $modelo->telefono }}</p>
	@endif
	@if($modelo->celular != null)
		<p><strong>Celular:</strong> {{ $modelo->celular }}</p>
	@endif
	@if($modelo->email != null)
		<p><strong>e-mail:</strong> {{ $modelo->email }}</p>
	@endif
	@if($modelo->fechanacimiento != null)
		<p><strong>Fecha de Nacimiento:</strong> {{ date("d/m/Y", strtotime( $modelo->fechanacimiento))  }}</p>
	@endif
	@if($modelo->distrito_id != null )
		<p><strong>Ubicación:</strong> {{ $departamento->nombre . ' - ' . $provincia->nombre . ' - ' . $distrito->nombre  }}</p>
	@endif 
@endif

{!! $mensaje or '<blockquote><p class="text-dark">Tenemos un registro con este documento, ¿Desea registrarlo?</p></blockquote>' !!}
<div class="form-group">
	<div class="col-lg-12 col-md-12 col-sm-12 text-right">
		{!! Form::button('<i class="fa fa-check fa-lg"></i> Registrar', array('class' => 'btn btn-success btn-sm', 'id' => 'btnGuardar', 'onclick' => 'guardarrepetido(\''.$modelo->id.'\',"'. $entidad.'")')) !!}
		{!! Form::button('<i class="fa fa-exclamation fa-lg"></i> Cancelar', array('class' => 'btn btn-warning btn-sm', 'id' => 'btnCancelar'.$entidad, 'onclick' => 'cerrarModal((contadorModal - 1));')) !!}
	</div>
</div>
{!! Form::close() !!}
<script type="text/javascript">
	$(document).ready(function() {
		init(IDFORMMANTENIMIENTO+'{!! $entidad !!}', 'M', '{!! $entidad !!}');
		configurarAnchoModal('400');
	}); 

	function guardarrepetido(id, entidad){

		var respuesta ="";

		if(entidad == "cliente"){

			var ajax = $.ajax({
				"method": "POST",
				"url": "{{ url('/cliente/guardarrepetido') }}",
				"data": {
					"persona_id" : id, 
					"_token": "{{ csrf_token() }}",
					}
			}).done(function(info){
				respuesta = info;
			}).always(function(){

				cerrarModal();

			});
		
		}else if(entidad == "Proveedor"){

			var ajax = $.ajax({
				"method": "POST",
				"url": "{{ url('/proveedor/guardarrepetido') }}",
				"data": {
					"persona_id" : id, 
					"_token": "{{ csrf_token() }}",
					}
			}).done(function(info){
				respuesta = info;
			}).always(function(){

				cerrarModal();

			});

		}else if(entidad == "Trabajador"){

			var ajax = $.ajax({
				"method": "POST",
				"url": "{{ url('/trabajador/guardarrepetido') }}",
				"data": {
					"persona_id" : id, 
					"_token": "{{ csrf_token() }}",
					}
			}).done(function(info){
				respuesta = info;
			}).always(function(){

				cerrarModal();

			});

		}

	}

</script>