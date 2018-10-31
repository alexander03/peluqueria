<?php

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use App\Menuoption;
use App\OperacionMenu;
use App\Personamaestro;
use App\Persona;
use App\User;
use App\Concepto;

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
* anular
*/

?>
<div style="padding-top: 50px">

@if($aperturaycierre == 0)
		
	{!! Form::button('<i class="glyphicon glyphicon-plus"></i> Apertura', array('class' => 'btn btn-success waves-effect waves-light m-l-10 btn-sm btnApertura' , 'onclick' => 'modalCaja (\''.URL::route($ruta["apertura"], array('listar'=>'SI')).'\', \''.$titulo_apertura.'\', this);')) !!}

	{!! Form::button('<i class="glyphicon glyphicon-usd"></i> Nuevo', array('class' => 'btn btn-info waves-effect waves-light m-l-10 btn-sm btnNuevo', 'disabled' , 'onclick' => 'modalCaja (\''.URL::route($ruta["create"], array('listar'=>'SI')).'\', \''.$titulo_registrar.'\', this);')) !!}

	{!! Form::button('<i class="glyphicon glyphicon-remove-circle"></i> Cierre', array('class' => 'btn btn-danger waves-effect waves-light m-l-10 btn-sm btnCierre', 'disabled' , 'onclick' => 'modalCaja (\''.URL::route($ruta["cierre"], array('listar'=>'SI')).'\', \''.$titulo_cierre.'\', this);')) !!}

@else
			
	{!! Form::button('<i class="glyphicon glyphicon-plus"></i> Apertura', array('class' => 'btn btn-success waves-effect waves-light m-l-10 btn-sm btnApertura', 'disabled' , 'onclick' => 'modalCaja (\''.URL::route($ruta["apertura"], array('listar'=>'SI')).'\', \''.$titulo_apertura.'\', this);')) !!}

	{!! Form::button('<i class="glyphicon glyphicon-usd"></i> Nuevo', array('class' => 'btn btn-info waves-effect waves-light m-l-10 btn-sm btnNuevo', 'activo' => 'si' , 'onclick' => 'modalCaja (\''.URL::route($ruta["create"], array('listar'=>'SI')).'\', \''.$titulo_registrar.'\', this);')) !!}

	{!! Form::button('<i class="glyphicon glyphicon-remove-circle"></i> Cierre', array('class' => 'btn btn-danger waves-effect waves-light m-l-10 btn-sm btnCierre' , 'onclick' => 'modalCaja (\''.URL::route($ruta["cierre"], array('listar'=>'SI')).'\', \''.$titulo_cierre.'\', this);')) !!}

@endif

<input id="ingresos_efectivo" name="ingresos_efectivo" type="hidden" value="{{$ingresos_efectivo}}">
<input id="ingresos_tarjeta" name="ingresos_tarjeta" type="hidden" value="{{$ingresos_tarjeta}}">
<input id="ingresos_total" name="ingresos_total" type="hidden" value="{{$ingresos_total}}">
<input id="egresos" name="egresos" type="hidden" value="{{$egresos}}">
<input id="saldo" name="saldo" type="hidden" value="{{$saldo}}">

</div>
@if(count($lista) == 0)
<h3 class="text-warning" style="padding-top: 40px">No se encontraron resultados.</h3>
@else
{!! $paginacion or '' !!}
<table id="example1" style="font-size: 70%" class="table table-bordered table-striped table-condensed table-hover">

	<thead>
		<tr>
			@foreach($cabecera as $key => $value)
				<th @if((int)$value['numero'] > 1) colspan="{{ $value['numero'] }}" @endif>{!! $value['valor'] !!}</th>
			@endforeach
		</tr>
	</thead>
	<tbody>
		<?php
		$contador = $inicio + 1;
		?>
		@foreach ($lista as $key => $value)

		@if($value->estado == 1)
		<tr style ="background-color: #ffffff !important">
		@elseif($value->estado == 0)
		<tr style ="background-color: #ff9ea2 !important">
		@endif

			<td align="center">{{ $fechaformato = date("d/m/Y",strtotime($value->fecha))}}</td>
			
			<td align="center">{{ $value->serie_numero }}</td>
			
			<?php
			$concepto = Concepto::find($value->concepto_id);
			?>
			
			<td>{{ $concepto->concepto}}</td>

			<?php
			$persona = Persona::find($value->cliente_id);
			$cliente = Personamaestro::find($persona->personamaestro_id);
			?>
			@if($cliente->razonsocial == null)
				<td>{{ $cliente->nombres . ' ' .$cliente->apellidos }}</td>
			@else
				<td>{{ $cliente->razonsocial }}</td>
			@endif
			
			@if($concepto->tipo == 0)
			<td style="color:green;font-weight: bold;">{{ $value->total }}</td>
			<td align="center"> - </td>
			@elseif($concepto->tipo == 1)
			<td align="center"> - </td>
			<td align="center" style="color:red;font-weight: bold;">{{ $value->total }}</td>
			@endif
			
			@if( $value->tipo_pago == '1')
				<td> EFECTIVO </td>
			@elseif( $value->tipo_pago == '2')
				<td> TARJETA DE CRÉDITO/DÉBITO </td>
			@endif

			@if( $value->comentario == null )
			<td align="center"> - </td>
			@else
			<td>{{ $value->comentario }}</td>
			@endif

			<?php
				$usuario = User::find($value->usuario_id);
				$persona = Persona::find($usuario->persona_id);
				$personamaestro = Personamaestro::find($persona->personamaestro_id);
			?>

			<td>{{ $personamaestro->nombres . ' ' . $personamaestro->apellidos }}</td>

			<td align="center">
			@if($aperturaycierre == 1)	
				@if(in_array('9',$operacionesnombres)) 
					@if($value->estado == 1)
						@if($concepto->id == 1)
							-
						@elseif ($concepto->id == 2)
							-
						@else
							{!! Form::button('<div class="glyphicon glyphicon-remove"></div> Anular', array('onclick' => 'modal (\''.URL::route($ruta["delete"], array($value->id, 'SI')).'\', \''.$titulo_eliminar.'\', this);', 'class' => 'btn btn-xs btn-danger btnEliminar' ,'activo' => 'si')) !!}
						@endif
					@elseif($value->estado == 0)
						{!! Form::button('<div class="glyphicon glyphicon-remove"></div> Anular', array('onclick' => 'modal (\''.URL::route($ruta["delete"], array($value->id, 'SI')).'\', \''.$titulo_eliminar.'\', this);', 'class' => 'btn btn-xs btn-secondary btnEliminar' ,'disabled')) !!}
					@endif
				@else
				{!! Form::button('<div class="glyphicon glyphicon-remove"></div> Anular', array('onclick' => 'modal (\''.URL::route($ruta["delete"], array($value->id, 'SI')).'\', \''.$titulo_eliminar.'\', this);', 'class' => 'btn btn-xs btn-danger btnEliminar' ,'activo' => 'no')) !!}
				@endif
			@elseif($aperturaycierre == 0)	
				-
			@endif
			</td>
		</tr>
		<?php
		$contador = $contador + 1;
		?>
		@endforeach
	</tbody>
</table>
<table class="table-bordered table-striped table-condensed" align="center">
    <thead>
        <tr>
            <th class="text-center" colspan="2">Resumen de Caja</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <th>INGRESOS :</th>
            <th class="text-right"><div id ="ingresostotal"></div></th>
        </tr>
        <tr>
            <td>EFECTIVO :</td>
            <td align="right"><div id ="ingresosefectivo"></div></td>
        </tr>
        <tr>
            <td>TARJETA :</td>
            <td align="right"><div id ="ingresostarjeta"></div></td>
        </tr>
        <tr>
            <th>EGRESOS :</th>
            <th class="text-right"><div id ="egreso"></div></th>
        </tr>
        <tr>
            <th>SALDO :</th>
            <th class="text-right"><div id ="saldoo"></div></th>
        </tr>
    </tbody>
</table>

@endif
<script>
	var ingresos_total = {{$ingresos_total}};
	var ingresos_efectivo = {{$ingresos_efectivo}};
	var ingresos_tarjeta = {{$ingresos_tarjeta}};
	var egresos = {{$egresos}};
	var saldo = {{$saldo}};
	
	$(document).ready(function () {

		if($(".btnEliminar").attr('activo')=== 'no'){
			$('.btnEliminar').attr("disabled", true);
		}

		$('#ingresostotal').html(ingresos_total.toFixed(2));
		$('#ingresosefectivo').html(ingresos_efectivo.toFixed(2));
		$('#ingresostarjeta').html(ingresos_tarjeta.toFixed(2));
		$('#egreso').html(egresos.toFixed(2));
		$('#saldoo').html(saldo.toFixed(2));
	});

</script>
