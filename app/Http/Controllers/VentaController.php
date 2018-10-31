<?php

namespace App\Http\Controllers;

use Validator;
use Illuminate\Http\Request;
use App\Http\Requests;
use App\Persona;
use App\Personamaestro;
use App\Movimiento;
use App\Detalleventa;
use App\Servicio;
use App\Sucursal;
use App\Librerias\Libreria;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

class VentaController extends Controller
{

    protected $folderview      = 'app.venta';
    protected $tituloAdmin     = 'Venta Rápida';
    protected $tituloCliente   = 'Registrar Nuevo Cliente';
    protected $rutas           = array('create' => 'trabajador.create', 
            'cliente'   => 'cliente.create',
            'guardarventa'   => 'venta.guardarventa',
            'guardardetalle' => 'venta.guardardetalle',
            'serieventa'     => 'venta.serieventa',
            'permisoRegistrar' => 'venta.permisoRegistrar'
        );

    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $entidad          = 'Venta';
        $title            = $this->tituloAdmin;
        $titulo_cliente   = $this->tituloCliente;
        $ruta             = $this->rutas;
        $user = Auth::user();
        $empresa_id = $user->empresa_id;
        $type = 'E';
        $empleados        = DB::table('personamaestro')
        ->where(function($subquery) use($type)
        {
            if (!is_null($type)) {
               
                $subquery->where('type', '=', $type)->orwhere('secondtype','=', $type)->orwhere('type','=', 'T');
               
            }		            		
        })
        ->leftJoin('persona', 'personamaestro.id', '=', 'persona.personamaestro_id')
        ->where('persona.empresa_id', '=', $empresa_id)
        ->whereNull('personamaestro.deleted_at')
        ->orderBy('apellidos', 'ASC')->orderBy('nombres', 'ASC')->orderBy('razonsocial', 'ASC')
                            ->get();
        $sucursales      = Sucursal::where('empresa_id', '=', $empresa_id)->get();
        return view($this->folderview.'.admin')->with(compact('empleados', 'sucursales' ,'entidad', 'title', 'titulo_cliente', 'ruta'));
    }

    public function clienteautocompletar($searching)
    {
        $type = 'C';
        $user = Auth::user();
        $empresa_id = $user->empresa_id;
        $resultado = DB::table('personamaestro')
            ->where(function($subquery) use($searching)
            {
                $subquery->where(DB::raw('CONCAT(apellidos," ",nombres)'), 'LIKE','%'.strtoupper($searching).'%')->orWhere('razonsocial','LIKE','%'.strtoupper($searching).'%');
            })
            ->where(function($subquery) use($type)
            {
                if (!is_null($type)) {
                   
                    $subquery->where('type', '=', $type)->orwhere('secondtype','=', $type)->orwhere('type','=', 'T');
                   
                }		            		
            })
            ->leftJoin('persona', 'personamaestro.id', '=', 'persona.personamaestro_id')
            ->where('persona.empresa_id', '=', $empresa_id)
            ->whereNull('personamaestro.deleted_at')
            ->orderBy('apellidos', 'ASC')->orderBy('nombres', 'ASC')->orderBy('razonsocial', 'ASC')
            ->take(5);
        $list      = $resultado->get();
        $data = array();
        foreach ($list as $key => $value) {
            $name = '';
            if ($value->razonsocial != null) {
                $name = $value->razonsocial;
            }else{
                $name = $value->apellidos." ".$value->nombres;
            }
            $data[] = array(
                            'label' => trim($name),
                            'id'    => $value->id,
                            'value' => trim($name),
                        );
        }
        return json_encode($data);
    }

    public function servicioautocompletar($searching)
    {
        $user = Auth::user();
        $empresa_id = $user->empresa_id;

        $resultado =DB::table('servicio')
        ->where('descripcion', 'LIKE', '%'.strtoupper($searching).'%')
        ->where('empresa_id', '=', $empresa_id)
        ->whereNull('deleted_at')
        ->orderBy('descripcion', 'ASC')
        ->take(5);

        $list      = $resultado->get();
        $data = array();
        foreach ($list as $key => $value) {
            $data[] = array(
                'id'    => $value->id,
                'descripcion' => $value->descripcion,
                'precio' => $value->precio,
                'tipo' => 'S',
            );
        }
        return json_encode($data);
    }

    public function productoautocompletar($searching)
    {
        $user = Auth::user();
        $empresa_id = $user->empresa_id;

        $resultado =DB::table('producto')
        ->where('descripcion', 'LIKE', '%'.strtoupper($searching).'%')
        ->where('empresa_id', '=', $empresa_id)
        ->whereNull('deleted_at')
        ->orderBy('descripcion', 'ASC')
        ->take(5);

        $list      = $resultado->get();
        $data = array();
        foreach ($list as $key => $value) {
            $data[] = array(
                'id'    => $value->id,
                'descripcion' => $value->descripcion,
                'precio' => $value->precioventa,
                'tipo' => 'P',
            );
        }
        return json_encode($data);
    }

    public function guardarventa(Request $request){
        $reglas     = array('empleado_id' => 'required',
                            'serieventa' => 'required',
                            'cliente_id' => 'required',
                            'tipopago' => 'required',
                            'total' => 'required',
                           );
        $mensajes   = array();
        $validacion = Validator::make($request->all(), $reglas, $mensajes);
        if ($validacion->fails()) {
            return $validacion->messages()->toJson();
        } 
        $error = DB::transaction(function() use($request){
            $movimiento                 = new Movimiento();
            $movimiento->concepto_id    = 3;
            $movimiento->serie_numero   = $request->input('serieventa');
            $total                 = $request->input('total');
            $movimiento->total          = $total;
            $subtotal              = round($total/(1.18),2);
            $movimiento->subtotal       = $subtotal;
            $movimiento->igv            = round($total - $subtotal,2);
            $movimiento->tipo_pago      = (int) $request->input('tipopago'); // 1-efectivo y 2-tarjeta
            $movimiento->estado         = 1;
            $movimiento->cliente_id     = $request->input('cliente_id');
            $movimiento->trabajador_id  = $request->input('empleado_id');
            $user           = Auth::user();
            $movimiento->usuario_id     = $user->id;
            $empresa_id     = $user->empresa_id;
            $movimiento->empresa_id   = $empresa_id;
            $movimiento->sucursal_id   =  $request->input('sucursal_id');
            $movimiento->save();
        });
        return is_null($error) ? "OK" : $error;
    }

    public function guardardetalle(Request $request){
        $detalles = json_decode($_POST["json"]);
        //var_dump($detalles->{"data"}[0]->{"cantidad"});
        $error = null;
        $venta_id = Movimiento::max('id');
        foreach ($detalles->{"data"} as $detalle) {
            $error = DB::transaction(function() use($venta_id, $detalle){
                $detalleventa            = new Detalleventa();
                $detalleventa->cantidad  = $detalle->{"cantidad"};
                $tipo                    = $detalle->{"tipo"};
                if($tipo == "S"){
                    $detalleventa->servicio_id  = $detalle->{"id"};
                }
                if($tipo == "P"){
                    $detalleventa->producto_id  = $detalle->{"id"};
                }
                $detalleventa->venta_id  = $venta_id;
                $detalleventa->save();
            });
        }

        $venta = Movimiento::find($venta_id);
        $persona = Persona::find($venta->trabajador_id);
        $personamaestro = Personamaestro::find($persona->personamaestro_id);

        if($personamaestro->comision == 1){
            $comision = 0;
            foreach ($detalles->{"data"} as $detalle) {
                $tipo                    = $detalle->{"tipo"};
                $cantidad                = $detalle->{"cantidad"};
                if($tipo == "S"){
                    $servicio = Servicio::find($detalle->{"id"});
                    if($servicio->tipo_comision == 0 ){ //porcentaje

                        $comision = $comision + (( $cantidad * $servicio->precio ) * ( $servicio->comision / 100 )); 

                    }elseif($servicio->tipo_comision == 1 ){ //monto

                        $comision = $comision + ($servicio->comision * $cantidad);

                    }
                }
            }

            $comision = round($comision , 1);
            
            $error = DB::transaction(function() use($request, $comision, $venta){
                $movimiento                 = new Movimiento();
                $movimiento->concepto_id    = 8;
                $movimiento->serie_numero   = $venta->serie_numero + 1;
                $movimiento->total          = $comision;
                $movimiento->tipo_pago      = 1; // 1-efectivo y 2-tarjeta
                $movimiento->estado         = 1;
                $movimiento->cliente_id     = $venta->trabajador_id;
                $movimiento->comentario     = "COMISIÓN DE VENTA N° ". $venta->serie_numero;
                $user           = Auth::user();
                $movimiento->usuario_id     = $user->id;
                $empresa_id     = $user->empresa_id;
                $movimiento->empresa_id   = $empresa_id;
                $movimiento->sucursal_id   =  $venta->sucursal_id;
                $movimiento->save();
            });
        }
        return is_null($error) ? "OK" : $error;
    }

    public function serieventa(Request $request){
        $user = Auth::user();
        $empresa_id = $user->empresa_id;		
        $sucursal_id  = $request->input('sucursal_id');   
        $movimiento = Movimiento::where('empresa_id', $empresa_id)
                                ->where('sucursal_id', $sucursal_id)
                                    ->max('serie_numero');
        $serieventa = $movimiento + 1;
        return $serieventa;
    }

    public function permisoRegistrar(Request $request){//registrar solo si hay apertura de caja sin cierre

        $user = Auth::user();
        $empresa_id = $user->empresa_id;
        $sucursal_id  = $request->input('sucursal_id');

        //cantidad de aperturas
        $aperturas = Movimiento::where('concepto_id', 1)
                ->where('empresa_id', "=", $empresa_id)
                ->where('sucursal_id', "=", $sucursal_id)
                ->count();
        //cantidad de cierres
        $cierres = Movimiento::where('concepto_id', 2)
                ->where('empresa_id', "=", $empresa_id)
                ->where('sucursal_id', "=", $sucursal_id)
                ->count();
                
        $aperturaycierre = null;

        if($aperturas == $cierres){ // habilitar apertura de caja
            $aperturaycierre = 0;
        }else if($aperturas != $cierres){ //habilitar cierre de caja
            $aperturaycierre = 1;
        }

        return $aperturaycierre;

    }

}
