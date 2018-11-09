<div id="divMensajeError{!! $entidad !!}"></div>
{!! Form::model($movimiento, $formData) !!}	
	{!! Form::hidden('listar', $listar, array('id' => 'listar')) !!}
	{!! Form::hidden('sucursal',null,array('id'=>'sucursal')) !!}
	<div class="form-group">
		<div class="col-lg-5 col-md-5 col-sm-5">
			<div class="control-label col-lg-3 col-md-3 col-sm-3" style ="padding-top: 15px">
				{!! Form::label('serieventa', 'Nro:')!!}
			</div>
			<div class="col-lg-9 col-md-9 col-sm-9">
				{!! Form::text('serieventa', '', array('class' => 'form-control input-xs', 'id' => 'serieventa', 'readOnly')) !!}
			</div>
		</div>
		<div class="col-lg-2 col-md-2 col-sm-2">
		</div>
		<div class="col-lg-5 col-md-5 col-sm-5">
			<div class="control-label col-lg-4 col-md-4 col-sm-4" style ="padding-top: 15px">
				{!! Form::label('fecha', 'Fecha:')!!}
			</div>
			<div class="col-lg-8 col-md-8 col-sm-8">
				{!! Form::text('fecha', '', array('class' => 'form-control input-xs', 'id' => 'fecha', 'readOnly')) !!}
			</div>
		</div>
	</div>
	<div class="form-group">
		<div class="col-lg-5 col-md-5 col-sm-5">
			<div class="control-label col-lg-3 col-md-3 col-sm-3" style ="padding-top: 15px">
				{!! Form::label('tipo', 'Tipo:')!!}
			</div>
			<div class="col-lg-8 col-md-8 col-sm-8">
				<select id="tipo" name="tipo" onchange="generarConcepto(this.value)" class="form-control input-xs">
					<option value="0">INGRESOS</option>
					<option value="1">EGRESOS</option>
				</select>
			</div>
		</div>
		<div class="col-lg-7 col-md-7 col-sm-7">
			<div class="control-label col-lg-4 col-md-4 col-sm-4" style ="padding-top: 15px">
				{!! Form::label('concepto', 'Concepto:')!!}
			</div>
			<div class="col-lg-8 col-md-8 col-sm-8">
				<select id="concepto_id" name="concepto_id" class="form-control input-xs">
					
				</select>
			</div>
		</div>
	</div>
	<div class="form-group">
		<div class="col-lg-12 col-md-12 col-sm-12">
			<div class="col-lg-2 col-md-2 col-sm-2" style ="padding-top: 15px">
				{!! Form::label('persona', 'Persona:')!!}
			</div>
			<div class="col-lg-10 col-md-10 col-sm-10">
				{!! Form::text('persona', '', array('class' => 'form-control input-xs', 'id' => 'persona', 'placeholder' => 'Ingrese nombre o razón social')) !!}
				{!! Form::hidden('persona_id',null,array('id'=>'persona_id')) !!}
			</div>
		</div>
		
	</div>
	<div class="form-group">
		<div class="col-lg-7 col-md-7 col-sm-7">
			<div class="col-lg-4 col-md-4 col-sm-4" style ="padding-top: 15px">
				{!! Form::label('tipopago', 'Tipo de pago:')!!}
			</div>
			<div class="col-lg-8 col-md-8 col-sm-8">
				<select id="tipopago" name="tipopago" class="form-control input-xs">
					<option disabled selected>SELECCIONE MEDIO DE PAGO</option>
					<option value="1">EFECTIVO</option>
					<option value="2">TARJETA DE CRÉDITO/DÉBITO</option>
				</select>
			</div>
		</div>
		<div class="col-lg-5 col-md-5 col-sm-5">
			<div class="control-label col-lg-4 col-md-4 col-sm-4" style ="padding-top: 15px">
				{!! Form::label('total', 'Total:')!!}
			</div>
			<div class="col-lg-8 col-md-8 col-sm-8">
				{!! Form::text('total', '', array('class' => 'form-control input-xs', 'id' => 'total', 'placeholder' => '0.00' )) !!}
			</div>
		</div>
	</div>
	<div class="form-group">
		<div class="col-lg-12 col-md-12 col-sm-12 text-right">
			<div class="control-label col-lg-2 col-md-2 col-sm-2" style ="padding-top: 15px">
				{!! Form::label('comentario', 'Comentario:')!!}
			</div>
			<div class="col-lg-10 col-md-10 col-sm-10">
				<textarea class="form-control input-xs" id="comentario" cols="10" rows="5" name="comentario"></textarea>
			</div>
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
	configurarAnchoModal('700');
	init(IDFORMMANTENIMIENTO+'{!! $entidad !!}', 'M', '{!! $entidad !!}');
	//GENERAR CONCEPTO
	generarConcepto($('#tipo').val());

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

	//NRO MOVIMIENTO
	$('#serieventa').val({{$serieventa}});

}); 


var clientes = new Bloodhound({
	datumTokenizer: function (d) {
		return Bloodhound.tokenizers.whitespace(d.value);
	},
	limit: 5,
	queryTokenizer: Bloodhound.tokenizers.whitespace,
	remote: {
		url: 'caja/clienteautocompletar/%QUERY',
		filter: function (clientes) {
			return $.map(clientes, function (cliente) {
				return {
					value: cliente.value,
					id: cliente.id,
				};
			});
		}
	}
});
clientes.initialize();

var proveedores = new Bloodhound({
	datumTokenizer: function (d) {
		return Bloodhound.tokenizers.whitespace(d.value);
	},
	limit: 5,
	queryTokenizer: Bloodhound.tokenizers.whitespace,
	remote: {
		url: 'caja/proveedorautocompletar/%QUERY',
		filter: function (proveedores) {
			return $.map(proveedores, function (proveedor) {
				return {
					value: proveedor.value,
					id: proveedor.id,
				};
			});
		}
	}
});
proveedores.initialize();

var empleados = new Bloodhound({
	datumTokenizer: function (d) {
		return Bloodhound.tokenizers.whitespace(d.value);
	},
	limit: 5,
	queryTokenizer: Bloodhound.tokenizers.whitespace,
	remote: {
		url: 'caja/empleadoautocompletar/%QUERY',
		filter: function (empleados) {
			return $.map(empleados, function (empleado) {
				return {
					value: empleado.value,
					id: empleado.id,
				};
			});
		}
	}
});
empleados.initialize();


$('#persona').typeahead({
	hint: true,
	highlight: true
},
{
	name: 'clientes',
	displayKey: 'value',
	source: clientes.ttAdapter(),
	templates: {
		header: '<h4 style="margin-left: 10px">CLIENTES</h4>'
	}
},
{
	name: 'proveedores',
	displayKey: 'value',
	source: proveedores.ttAdapter(),
	templates: {
		header: '<h4 style="margin-left: 10px">PROVEEDORES</h4>'
	}
},
{
	name: 'empleados',
	displayKey: 'value',
	source: empleados.ttAdapter(),
	templates: {
		header: '<h4 style="margin-left: 10px">EMPLEADOS</h4>'
	}
}).on('typeahead:selected', function (object, datum) {
	$('#persona').val(datum.value);
	$('#persona_id').val(datum.id);
}); 

function generarConcepto(valor){
    $.ajax({
        type: "GET",
        url: "caja/generarConcepto",
        data: "tipoconcepto_id="+valor+"&_token="+$(IDFORMMANTENIMIENTO + 'Caja :input[name="_token"]').val(),
        success: function(a) {
            $(IDFORMMANTENIMIENTO + 'Caja :input[name="concepto_id"]').html(a);
        }
    });
}
</script>
