<?php

namespace App\Http\Controllers;

use Validator;
use Illuminate\Http\Request;
use App\Http\Requests;
use App\Personamaestro;
use App\Venta;
use App\Detalleventa;
use App\Librerias\Libreria;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

class CajaController extends Controller
{

    protected $folderview      = 'app.caja';
    protected $tituloAdmin     = 'Caja';
    protected $tituloCliente   = 'Registrar Nuevo Cliente';
    protected $rutas           = array('create' => 'trabajador.create', 
            'cliente'   => 'cliente.create',
            'guardarventa'   => 'caja.guardarventa',
            'guardardetalle' => 'caja.guardardetalle',
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
        $entidad          = 'Caja';
        $title            = $this->tituloAdmin;
        $titulo_cliente   = $this->tituloCliente;
        $ruta             = $this->rutas;
        $user = Auth::user();
        $empresa_id = $user->empresa_id;
        $empleados        = Personamaestro::where('type','=','E')->orWhere('secondtype','=','E')->orWhere('secondtype','=','T')
                            ->leftJoin('persona', 'personamaestro.id', '=', 'persona.personamaestro_id')
                            ->where('persona.empresa_id', '=', $empresa_id)
                            ->orderBy('nombres', 'ASC')->orderBy('apellidos', 'ASC')->orderBy('razonsocial', 'ASC')
                            ->get();
        $serieventa       = Venta::where('empresa_id','=',$empresa_id)->count() + 1;
        return view($this->folderview.'.admin')->with(compact('empleados','entidad', 'serieventa', 'title', 'titulo_cliente', 'ruta'));
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
                   
                    $subquery->where('type', '=', $type)->orwhere('secondtype','=', $type)->orwhere('secondtype','=', 'T');
                   
                }		            		
            })
            ->leftJoin('persona', 'personamaestro.id', '=', 'persona.personamaestro_id')
            ->where('persona.empresa_id', '=', $empresa_id)
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
            $venta                 = new Venta();
            $venta->serie_numero   = $request->input('serieventa');
            $total                 = $request->input('total');
            $venta->total          = $total;
            $subtotal              = round($total/(1.18),2);
            $venta->subtotal       = $subtotal;
            $venta->igv            = round($total - $subtotal,2);
            $venta->tipo_pago      = (int) $request->input('tipopago'); // 1-efectivo y 2-tarjeta
            $venta->cliente_id     = $request->input('cliente_id');
            $venta->trabajador_id  = $request->input('empleado_id');
            $user           = Auth::user();
            $empresa_id     = $user->empresa_id;
            $venta->empresa_id   = $empresa_id;
            $venta->save();
        });
        return is_null($error) ? "OK" : $error;
    }

    public function guardardetalle(Request $request){
        $detalles = json_decode($_POST["json"]);
        //var_dump($detalles->{"data"}[0]->{"cantidad"});
        $error = null;
        $venta_id = Venta::max('id');
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
        return is_null($error) ? "OK" : $error;
    }


}
