<!-- Page-Title -->
<?php

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use App\Menuoption;
use App\OperacionMenu;
use App\Movimiento;

$user = Auth::user();
/*
SELECT operacion_menu.operacion_id
FROM  operacion_menu 
inner join permiso_operacion
on permiso_operacion.operacionmenu_id = operacion_menu.id
where po.usertype_id = 4 and om.menuoption_id = 9
*/
/*$operaciones = DB::table('operacion_menu')
					->join('permiso_operacion','operacion_menu.id','=','permiso_operacion.operacionmenu_id')
					->select('operacion_menu.operacion_id')
					->where([
						['permiso_operacion.usertype_id','=',$user->usertype_id],
						['operacion_menu.menuoption_id','=', 6 ],
					])->get();*/
$opcionmenu = Menuoption::where('link','=',$entidad)->orderBy('id','ASC')->first();
$operaciones = OperacionMenu::join('permiso_operacion','operacion_menu.id','=','permiso_operacion.operacionmenu_id')
					->select('operacion_menu.*')
					->where([
						['permiso_operacion.usertype_id','=',$user->usertype_id],
						['operacion_menu.menuoption_id','=', $opcionmenu->id ],
					])->get();					
$operacionesnombres = array();
foreach($operaciones as $key => $value){
	$operacionesnombres[] = $value->operacion_id;
}
/*
operaciones 
1 nuevo
2 editar
3 eliminar
*/
?>

<div class="row">
    <div class="col-sm-12">
        <div class="page-title-box">
            {{--
            <ol class="breadcrumb pull-right">
                <li><a href="#">Minton</a></li>
                <li><a href="#">Tables</a></li>
                <li class="active">Datatable</li>
            </ol>
            --}}
            <h4 class="page-title">{{ $title }}</h4>
        </div>
    </div>
</div>


<div class="row" style="background: rgba(51,122,183,0.10);">
    <div class="col-sm-12">
        <div class="card-box table-responsive">
		{!! Form::open(['route' => $ruta["guardarventa"], 'method' => 'POST' ,'onsubmit' => 'return false;', 'role' => 'form', 'autocomplete' => 'off', 'id' => 'IDFORMMANTENIMIENTO'.$entidad]) !!}

			<h4 class="page-title">Seleccione Empleado</h4>
			<div id="empleados" class="row m-b-30" style="display: -webkit-inline-box; width: 100%; overflow-x: scroll;">
				@foreach($empleados  as $key => $value)
					<div class="empleado" id="{{ $value->id}}" style="margin: 5px; width: 150px; height: 170px; text-align: center; border-style: solid; border-color: rgb(63, 81, 181);" >
						<img src="assets/images/empleado.png" style="width: 120px; height: 120px">
						<label>{{ $value->razonsocial ? $value->razonsocial : $value->nombres.' '.$value->apellidos}}</label>
					</div>
				@endforeach
				{!! Form::hidden('empleado_id',null,array('id'=>'empleado_id')) !!}
			</div>

			
			<div class="row m-b-30">
				<div class="form-group">
					<div class="col-lg-3 col-md-3 col-sm-3">
						<div class="col-lg-4 col-md-4 col-sm-4" style ="padding-top: 15px">
							{!! Form::label('sucursal_id', 'Sucursal:')!!}
						</div>
						<div class="col-lg-8 col-md-8 col-sm-8">
							<select class="form-control input-xs" onchange="generarNumeroSerie(); permisoRegistrar();" id="sucursal_id" name="sucursal_id">
								<option disabled selected>SELECCIONE</option>
								@foreach($sucursales as $key => $value)
								<option value="{{$value->id}}">{{$value->nombre}}</option>
								@endforeach
							</select>
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-sm-3">
						<div class="col-lg-6 col-md-6 col-sm-6" style ="padding-top: 15px">
							{!! Form::label('serieventa', 'N° de Venta:')!!}
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6">
							{!! Form::text('serieventa', '', array('class' => 'form-control input-xs', 'id' => 'serieventa', 'readOnly')) !!}
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-sm-3">
						<div class="col-lg-3 col-md-3 col-sm-3" style ="padding-top: 15px">
							{!! Form::label('fecha', 'Fecha:')!!}
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6">
							{!! Form::text('fecha', '', array('class' => 'form-control input-xs', 'id' => 'fecha', 'readOnly')) !!}
						</div>
					</div>
				</div>
			</div>			

			<h4 class="page-title">Seleccione Cliente</h4>
			<div class="row m-b-30">
				<div class="form-group">
					<div class="col-lg-7 col-md-7 col-sm-7">
						{!! Form::text('cliente', '', array('class' => 'form-control input-xs', 'id' => 'cliente', 'placeholder' => 'Ingrese nombre o razón social del cliente')) !!}
						{!! Form::hidden('cliente_id',null,array('id'=>'cliente_id')) !!}
					</div>
					<div class="col-lg-5 col-md-5 col-sm-5" style ="padding-top: 10px">
						{!! Form::button('<i class="glyphicon glyphicon-plus"></i> Nuevo', array('class' => 'btn btn-success waves-effect waves-light m-l-10 btn-sm btnCliente', 'activo' => 'si' , 'onclick' => 'modal (\''.URL::route($ruta["cliente"], array('listar'=>'SI')).'\', \''.$titulo_cliente.'\', this);')) !!}
						{!! Form::button('<i class="glyphicon glyphicon-user"></i> Por Defecto', array('class' => 'btn btn-primary waves-effect waves-light m-l-10 btn-sm btnDefecto', 'activo' => 'si' )) !!}
					</div>
				</div>
			</div>
			<h4 class="page-title">Seleccione Servicios/Productos</h4>
			<div class="row m-b-30">
				<div class="form-group">
					<div class="col-lg-5 col-md-5 col-sm-5">
						{!! Form::text('servicio', '', array('class' => 'form-control input-xs', 'id' => 'servicio', 'placeholder' => 'Ingrese nombre del servicio o producto')) !!}
						{!! Form::hidden('servicio_id',null,array('id'=>'servicio_id')) !!}
						{!! Form::hidden('tipo',null,array('id'=>'tipo')) !!}
						{!! Form::hidden('precio',null,array('id'=>'precio')) !!}
					</div>
					<div class="col-lg-2 col-md-2 col-sm-2">
						<div class="col-lg-6 col-md-6 col-sm-6" style ="padding-top: 15px">
							{!! Form::label('cantidad', 'Cantidad:')!!}
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6">
							{!! Form::number('cantidad', null, array('class' => 'form-control input-xs', 'min' => '1', 'id' => 'cantidad', 'value' => '1')) !!}
						</div>
					</div>
					<div class="col-lg-5 col-md-5 col-sm-5" style ="padding-top: 10px">
						{!! Form::button('<i class="glyphicon glyphicon-plus"></i> Agregar', array('class' => 'btn btn-primary waves-effect waves-light m-l-10 btn-sm btnAgregar', 'activo' => 'si' )) !!}
					</div>
					{!! Form::hidden('cant',null,array('id'=>'cant', 'value' => '0')) !!}
				</div>
			</div>

			<table class="table table-striped table-bordered">
				<thead id="cabecera"></thead>
				<tbody id="detalle"></tbody>
            </table>

			<h4 class="page-title">Seleccione Medio de Pago</h4>
			<div class="row m-b-30">
				<div class="form-group">
					<div class="col-lg-5 col-md-5 col-sm-5">
						<select id="tipopago" name="tipopago" class="form-control input-xs">
							<option disabled selected>SELECCIONE MEDIO DE PAGO</option>
							<option value="1">EFECTIVO</option>
							<option value="2">TARJETA DE CRÉDITO/DÉBITO</option>
						</select>
					</div>
					<div class="col-lg-3 col-md-3 col-sm-3">
						<div class="col-lg-6 col-md-6 col-sm-6" style ="padding-top: 15px">
							{!! Form::label('total', 'Total a pagar:')!!}
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6">

							{!! Form::text('total', '', array('class' => 'form-control input-xs', 'id' => 'total', 'readOnly')) !!}
						</div>
					</div>
					<div class="col-lg-4 col-md-4 col-sm-4" style ="padding-top: 10px">
						{!! Form::button('<i class="glyphicon glyphicon-floppy-disk"></i> Guardar', array( 'onclick' => 'guardarventa()' , 'class' => 'btn btn-success waves-effect waves-light m-l-10 btn-sm btnGuardar', 'activo' => 'si' )) !!}
					</div>
				</div>
			</div>
			<div id="divMensajeError{!! $entidad !!}"></div>
        </div>
    </div>
</div>
<script>
$(document).ready(function(){

	//colocar total 0.00

	$("#total").val((0).toFixed(2));

	//cant = 0

	$("#cant").val(0);

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

	//CLIENTE ANÓNIMO

	$('.btnDefecto').on('click', function(){
		$('#cliente_id').val(2);
		$('#cliente').val('ANÓNIMO');
	});

	if($('#sucursal_id').val){
		$('serieventa').val("");
	}else{
		generarNumeroSerie();
	}

	permisoRegistrar();

});

function generarNumeroSerie(){
	var serieventa = null;

	var sucursal_id = $('#sucursal_id').val();

	var serieajax = $.ajax({
		"method": "POST",
		"url": "{{ url('/venta/serieventa') }}",
		"data": {
			"sucursal_id" : sucursal_id, 
			"_token": "{{ csrf_token() }}",
			}
	}).done(function(info){
		serieventa = info;
	}).always(function(){
		$('#serieventa').val(serieventa);
	});
}


function permisoRegistrar(){

	var aperturaycierre = null;

	var sucursal_id = $('#sucursal_id').val();

	var ajax = $.ajax({
		"method": "POST",
		"url": "{{ url('/venta/permisoRegistrar') }}",
		"data": {
			"sucursal_id" : sucursal_id, 
			"_token": "{{ csrf_token() }}",
			}
	}).done(function(info){
		aperturaycierre = info;
	}).always(function(){
		if(aperturaycierre == 0){
			$('form').find('input, textarea, button').prop('disabled',true);
			$("#tipopago").prop('disabled',true);

			$(".empleado").css('background', 'rgb(255,255,255)');

			$(".empleado").on('click', function(){
				$(".empleado").css('background', 'rgb(255,255,255)');
			});

			$('#divMensajeErrorVenta').html("");

			var cadenaError = '<div class="alert alert-danger"><button type="button" class="close" data-dismiss="alert">&times;</button><strong>Por favor corrige los siguentes errores:</strong><ul><li>Aperturar caja de la sucursal escogida</li></ul></div>';

			var surcursal_id = $('#sucursal_id').val();

			if(sucursal_id != null){
				$('#divMensajeErrorVenta').html(cadenaError);
			}


		}else if(aperturaycierre == 1){
			$('form').find('input, textarea, button').prop('disabled',false);
			$("#tipopago").prop('disabled',false);

			$(".empleado").css('background', 'rgb(255,255,255)');

			$(".empleado").on('click', function(){
				var idempleado = $(this).attr('id');
				$(".empleado").css('background', 'rgb(255,255,255)');
				$(this).css('background', 'rgb(179,188,237)');
				$('#empleado_id').attr('value',idempleado);
			});
			
			$('#divMensajeErrorVenta').html("");

		}
	});

	return aperturaycierre;
}

</script>

<script>
var clientes = new Bloodhound({
        datumTokenizer: function (d) {
            return Bloodhound.tokenizers.whitespace(d.value);
        },
        limit: 5,
        queryTokenizer: Bloodhound.tokenizers.whitespace,
        remote: {
            url: 'venta/clienteautocompletar/%QUERY',
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
    $('#cliente').typeahead(null,{
        displayKey: 'value',
        source: clientes.ttAdapter()
    }).on('typeahead:selected', function (object, datum) {
        $('#cliente').val(datum.value);
        $('#cliente_id').val(datum.id);
    }); 
</script>

<script>
var servicios = new Bloodhound({
        datumTokenizer: function (d) {
            return Bloodhound.tokenizers.whitespace(d.descripcion);
        },
        limit: 5,
        queryTokenizer: Bloodhound.tokenizers.whitespace,
        remote: {
            url: 'venta/servicioautocompletar/%QUERY',
            filter: function (servicios) {
                return $.map(servicios, function (servicio) {
                    return {
						precio: servicio.precio,
                        descripcion: servicio.descripcion,
                        id: servicio.id,
						tipo: servicio.tipo,
                    };
                });
            }
        }
    });
    servicios.initialize();

var productos = new Bloodhound({
        datumTokenizer: function (d) {
            return Bloodhound.tokenizers.whitespace(d.descripcion);
        },
        limit: 5,
        queryTokenizer: Bloodhound.tokenizers.whitespace,
        remote: {
            url: 'venta/productoautocompletar/%QUERY',
            filter: function (productos) {
                return $.map(productos, function (producto) {
                    return {
						precio: producto.precio,
                        descripcion: producto.descripcion,
                        id: producto.id,
						tipo: producto.tipo,
                    };
                });
            }
        }
    });
    productos.initialize();


    $('#servicio').typeahead({
		highlight: true
	},
	{
		name: 'servicios',
		displayKey: 'descripcion',
		source: servicios.ttAdapter(),
		templates: {
			header: '<h4 style="margin-left: 10px">SERVICIOS</h4>'
		}
	},
	{
		name: 'productos',
		displayKey: 'descripcion',
		source: productos.ttAdapter(),
		templates: {
			header: '<h4 style="margin-left: 10px">PRODUCTOS</h4>'
		}
	}).on('typeahead:selected', function (object, datum) {
        $('#servicio').val(datum.descripcion);
        $('#servicio_id').val(datum.id);
		$('#tipo').val(datum.tipo);
		$('#precio').val(datum.precio);
    }); 
</script>

<script>
$(document).ready(function(){
	$('.btnAgregar').on('click', function(){
		var servicio = $("#servicio").val();	
		var cantidad = $("#cantidad").val();
		var servicio_id = $("#servicio_id").val();
		var precio = $("#precio").val();	
		var cant = $("#cant"). val();
		var total = $("#total").val();
		if(total){
			var total = parseFloat($("#total").val());
		}else{
			var total = 0;
		}
		if(servicio && cantidad && servicio_id){
			if(cant == 0){
				var thead = '<tr><th>Descripción</th><th>Cantidad</th><th>Precio</th><th>Eliminar</th></tr>';
				$("#cabecera").append(thead);
				cant++;
				var fila = "";
				if($("#tipo").val() == 'S'){
					fila =  '<tr class="DetalleServicio" id="'+ servicio_id +'" cantidad="'+ cantidad +'"><td>'+ servicio +'</td><td>'+ cantidad +'</td><td>'+ (precio*cantidad).toFixed(2) +'</td><td><a onclick="eliminarDetalle(this)" class="btn btn-xs btn-danger btnEliminar" precio='+ (precio*cantidad).toFixed(2) +' type="button"><div class="glyphicon glyphicon-remove"></div> Eliminar</a></td></tr>';
				}else{
					fila =  '<tr class="DetalleProducto" id="'+ servicio_id +'" cantidad="'+ cantidad +'"><td>'+ servicio +'</td><td>'+ cantidad +'</td><td>'+ (precio*cantidad).toFixed(2) +'</td><td><a onclick="eliminarDetalle(this)" class="btn btn-xs btn-danger btnEliminar" precio='+ (precio*cantidad).toFixed(2) +' type="button"><div class="glyphicon glyphicon-remove"></div> Eliminar</a></td></tr>';
				}
				$("#detalle").append(fila);
				$("#cant").val(cant);
				$("#servicio").val("");
				$("#cantidad").val("");
				$("#servicio_id").val("");
				$("#precio").val("");	
			}else{
				cant++;
				var fila = "";
				if($("#tipo").val() == 'S'){
					fila =  '<tr class="DetalleServicio" id="'+ servicio_id +'" cantidad="'+ cantidad +'"><td>'+ servicio +'</td><td>'+ cantidad +'</td><td>'+ (precio*cantidad).toFixed(2) +'</td><td><a onclick="eliminarDetalle(this)" class="btn btn-xs btn-danger btnEliminar" precio='+ (precio*cantidad).toFixed(2) +' type="button"><div class="glyphicon glyphicon-remove"></div> Eliminar</a></td></tr>';
				}else{
					fila =  '<tr class="DetalleProducto" id="'+ servicio_id +'" cantidad="'+ cantidad +'"><td>'+ servicio +'</td><td>'+ cantidad +'</td><td>'+ (precio*cantidad).toFixed(2)+'</td><td><a onclick="eliminarDetalle(this)"class="btn btn-xs btn-danger btnEliminar" precio='+ (precio*cantidad).toFixed(2) +' type="button"><div class="glyphicon glyphicon-remove"></div> Eliminar</a></td></tr>';
				}
				$("#detalle").append(fila);
				$("#cant").val(cant);
				$("#servicio").val("");
				$("#cantidad").val("");
				$("#servicio_id").val("");
				$("#precio").val("");	
			}
			total += (precio*cantidad);
			$("#total").val(total.toFixed(2));
		}
	});
});
</script>

<script>


function eliminarDetalle(comp){
	var precioeliminar = parseFloat($(comp).attr('precio'));
	var cant = $("#cant"). val();
	cant--;
	$("#cant").val(cant);
	var total = parseFloat($("#total").val());
	total -= precioeliminar;
	$("#total").val(total.toFixed(2));
	(($(comp).parent()).parent()).remove();
	if(cant == 0){
		$("#cabecera").html("");
	}
}

function detalleventa(){
	var data = [];
	$("#detalle tr").each(function(){
		var element = $(this); // <-- en la variable element tienes tu elemento
		var tipo = element.attr('class');
		if(tipo === "DetalleServicio"){
			tipo = "S";
		}
		if(tipo === "DetalleProducto"){
			tipo = "P";
		}
		var id = element.attr('id');
		var cantidad = element.attr('cantidad');
	
		data.push(
			{"tipo": tipo , "id": id , "cantidad": cantidad }
		);

	});
	var detalle = {"data": data};
	var json = JSON.stringify(detalle);
	var respuesta = "";

	var ajax = $.ajax({
		"method": "POST",
		"url": "{{ url('/venta/guardardetalle') }}",
		"data": {
			"_token": "{{ csrf_token() }}",
			"json": json
			}
	}).done(function(info){
		respuesta = info;
	}).always(function() {
		if (respuesta === 'OK') {
			$("#IDFORMMANTENIMIENTOVenta")[0].reset();

			//colocar total 0.00
			$("#total").val((0).toFixed(2));
			
			//cant = 0
			$("#cant").val(0);

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
			
			$("#cabecera").html("");
			$("#detalle").html("");

			if($('#sucursal_id').val){
				$('serieventa').val("");
			}else{
				generarNumeroSerie();
			}

			permisoRegistrar();

			$('#cliente_id').val("");
			$('#empleado_id').val("");

			$(".empleado").css('background', 'rgb(255,255,255)');
		}
	});
}

</script>


