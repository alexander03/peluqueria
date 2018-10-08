<?php

namespace App\Http\Controllers;

use Validator;
use Illuminate\Http\Request;
use App\Http\Requests;
use App\Personamaestro;
use App\Venta;
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


}
