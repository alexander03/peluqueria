<?php

namespace App\Http\Controllers;

use Validator;
use Illuminate\Http\Request;
use App\Http\Requests;
use App\Movimiento;
use App\Sucursal;
use App\Concepto;
use App\Librerias\Libreria;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

class CajaController extends Controller
{

    protected $folderview      = 'app.caja';
    protected $tituloAdmin     = 'Caja';
    protected $tituloRegistrar = 'Registrar Movimiento de Caja';
    protected $tituloEliminar  = 'Anular Moviminto de Caja';
    protected $tituloApertura  = 'Apertura de Caja';
    protected $tituloCierre    = 'Cierre de Caja';
    protected $rutas           = array('create' => 'caja.create', 
            'delete'   => 'caja.eliminar',
            'search'   => 'caja.buscar',
            'index'    => 'caja.index',
            'apertura' => 'caja.apertura',
            'cierre'   => 'caja.cierre',
            'aperturaycierre' => 'caja.aperturaycierre',
        );

    public function __construct()
    {
        $this->middleware('auth');
    }

    public function buscar(Request $request)
    {
        $user = Auth::user();
        $empresa_id = $user->empresa_id;
        $sucursal_id      = Libreria::getParam($request->input('sucursal_id'));

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

        //max apertura
        $maxapertura = Movimiento::where('concepto_id', 1)
                ->where('empresa_id', "=", $empresa_id)
                ->where('sucursal_id', "=", $sucursal_id)
                ->max('serie_numero');
        //max cierre
        $maxcierre = Movimiento::where('concepto_id', 2)
                ->where('empresa_id', "=", $empresa_id)
                ->where('sucursal_id', "=", $sucursal_id)
                ->max('serie_numero');

        $ingresos_efectivo = 0.00;
        $ingresos_tarjeta = 0.00;
        $ingresos_total = 0.00;
        $egresos = 0.00;
        $saldo = 0.00;

        if (!is_null($maxapertura) && !is_null($maxcierre)) {
            if($aperturaycierre == 0){ //apertura y cierre iguales ---- mostrar desde apertura a cierre
                /*

                SELECT SUM(total)
                FROM movimiento as mov
                INNER JOIN concepto as con 
                ON mov.concepto_id = con.id
                WHERE mov.serie_numero >= 5 
                and mov.empresa_id = 1 
                and mov.sucursal_id = 1
                and mov.tipo_pago = 1  // EFECTIVO
                and con.tipo = 0 // INGRESO

                */
                
                //ingresos efectivo
                $ingresos_efectivo = Movimiento::where('serie_numero','>', $maxapertura)
                                            ->where('serie_numero','<', $maxcierre)
                                            ->where('estado', "=", 1)
                                            ->where('empresa_id', "=", $empresa_id)
                                            ->where('sucursal_id', "=", $sucursal_id)
                                            ->join('concepto', 'movimiento.concepto_id', '=', 'concepto.id')
                                            ->where('movimiento.tipo_pago', "=", 1) //efectivo
                                            ->where('concepto.tipo', "=", 0) //ingreso
                                            ->sum('total');

                round($ingresos_efectivo,2);

                /*

                SELECT SUM(total)
                FROM movimiento as mov
                INNER JOIN concepto as con 
                ON mov.concepto_id = con.id
                WHERE mov.serie_numero >= 5 
                and mov.empresa_id = 1 
                and mov.sucursal_id = 1
                and mov.tipo_pago = 2  // TARJETA
                and con.tipo = 0 // INGRESO

                */
                //ingresos tarjeta

                $ingresos_tarjeta = Movimiento::where('serie_numero','>', $maxapertura)
                                            ->where('serie_numero','<', $maxcierre)
                                            ->where('estado', "=", 1)
                                            ->where('empresa_id', "=", $empresa_id)
                                            ->where('sucursal_id', "=", $sucursal_id)
                                            ->join('concepto', 'movimiento.concepto_id', '=', 'concepto.id')
                                            ->where('movimiento.tipo_pago', "=", 2) //tarjeta
                                            ->where('concepto.tipo', "=", 0) //ingreso
                                            ->sum('total');

                round($ingresos_tarjeta,2);

                //ingresos total

                $ingresos_total = Movimiento::where('serie_numero','>', $maxapertura)
                                            ->where('serie_numero','<', $maxcierre)
                                            ->where('estado', "=", 1)
                                            ->where('empresa_id', "=", $empresa_id)
                                            ->where('sucursal_id', "=", $sucursal_id)
                                            ->join('concepto', 'movimiento.concepto_id', '=', 'concepto.id')
                                            ->where('concepto.tipo', "=", 0) //ingreso
                                            ->sum('total');
                round($ingresos_total,2);

                /*

                SELECT SUM(total)
                FROM movimiento as mov
                INNER JOIN concepto as con 
                ON mov.concepto_id = con.id
                WHERE mov.serie_numero >= 5 
                and mov.empresa_id = 1 
                and mov.sucursal_id = 1
                and con.tipo = 1 // EGRESO

                */
                //egresos
                $egresos = Movimiento::where('serie_numero','>', $maxapertura)
                                            ->where('serie_numero','<', $maxcierre)
                                            ->where('estado', "=", 1)
                                            ->where('empresa_id', "=", $empresa_id)
                                            ->where('sucursal_id', "=", $sucursal_id)
                                            ->join('concepto', 'movimiento.concepto_id', '=', 'concepto.id')
                                            ->where('concepto.tipo', "=", 1) //egreso
                                            ->sum('total');
                round($egresos,2);

                //saldo
                $saldo = round($ingresos_total - $egresos, 2);

            }else if($aperturaycierre == 1){ //apertura y cierre diferentes ------- mostrar desde apertura hasta ultimo movimiento
                /*

                SELECT SUM(total)
                FROM movimiento as mov
                INNER JOIN concepto as con 
                ON mov.concepto_id = con.id
                WHERE mov.serie_numero >= 5 
                and mov.empresa_id = 1 
                and mov.sucursal_id = 1
                and mov.tipo_pago = 1  // EFECTIVO
                and con.tipo = 0 // INGRESO

                */
                
                //ingresos efectivo
                $ingresos_efectivo = Movimiento::where('serie_numero','>', $maxapertura)
                                            ->where('estado', "=", 1)
                                            ->where('empresa_id', "=", $empresa_id)
                                            ->where('sucursal_id', "=", $sucursal_id)
                                            ->join('concepto', 'movimiento.concepto_id', '=', 'concepto.id')
                                            ->where('movimiento.tipo_pago', "=", 1) //efectivo
                                            ->where('concepto.tipo', "=", 0) //ingreso
                                            ->sum('total');
                round($ingresos_efectivo,2);
                /*

                SELECT SUM(total)
                FROM movimiento as mov
                INNER JOIN concepto as con 
                ON mov.concepto_id = con.id
                WHERE mov.serie_numero >= 5 
                and mov.empresa_id = 1 
                and mov.sucursal_id = 1
                and mov.tipo_pago = 2  // TARJETA
                and con.tipo = 0 // INGRESO

                */
                //ingresos tarjeta

                $ingresos_tarjeta = Movimiento::where('serie_numero','>', $maxapertura)
                                            ->where('estado', "=", 1)
                                            ->where('empresa_id', "=", $empresa_id)
                                            ->where('sucursal_id', "=", $sucursal_id)
                                            ->join('concepto', 'movimiento.concepto_id', '=', 'concepto.id')
                                            ->where('movimiento.tipo_pago', "=", 2) //tarjeta
                                            ->where('concepto.tipo', "=", 0) //ingreso
                                            ->sum('total');
                round($ingresos_tarjeta,2);

                //ingresos total

                $ingresos_total = Movimiento::where('serie_numero','>', $maxapertura)
                                            ->where('estado', "=", 1)
                                            ->where('empresa_id', "=", $empresa_id)
                                            ->where('sucursal_id', "=", $sucursal_id)
                                            ->join('concepto', 'movimiento.concepto_id', '=', 'concepto.id')
                                            ->where('concepto.tipo', "=", 0) //ingreso
                                            ->sum('total');
                round($ingresos_total,2);

                /*

                SELECT SUM(total)
                FROM movimiento as mov
                INNER JOIN concepto as con 
                ON mov.concepto_id = con.id
                WHERE mov.serie_numero >= 5 
                and mov.empresa_id = 1 
                and mov.sucursal_id = 1
                and con.tipo = 1 // EGRESO

                */
                //egresos
                $egresos = Movimiento::where('serie_numero','>', $maxapertura)
                                            ->where('estado', "=", 1)
                                            ->where('empresa_id', "=", $empresa_id)
                                            ->where('sucursal_id', "=", $sucursal_id)
                                            ->join('concepto', 'movimiento.concepto_id', '=', 'concepto.id')
                                            ->where('concepto.tipo', "=", 1) //egreso
                                            ->sum('total');
                round($egresos,2);
                //saldo
                $saldo = round($ingresos_total - $egresos, 2);
            }
        }else if(!is_null($maxapertura) && is_null($maxcierre)) {
            if($aperturaycierre == 1){ //apertura y cierre diferentes ------- mostrar desde apertura hasta ultimo movimiento
                /*

                SELECT SUM(total)
                FROM movimiento as mov
                INNER JOIN concepto as con 
                ON mov.concepto_id = con.id
                WHERE mov.serie_numero >= 5 
                and mov.empresa_id = 1 
                and mov.sucursal_id = 1
                and mov.tipo_pago = 1  // EFECTIVO
                and con.tipo = 0 // INGRESO

                */
                
                //ingresos efectivo
                $ingresos_efectivo = Movimiento::where('serie_numero','>', $maxapertura)
                                            ->where('estado', "=", 1)
                                            ->where('empresa_id', "=", $empresa_id)
                                            ->where('sucursal_id', "=", $sucursal_id)
                                            ->join('concepto', 'movimiento.concepto_id', '=', 'concepto.id')
                                            ->where('movimiento.tipo_pago', "=", 1) //efectivo
                                            ->where('concepto.tipo', "=", 0) //ingreso
                                            ->sum('total');
                round($ingresos_efectivo,2);
                /*

                SELECT SUM(total)
                FROM movimiento as mov
                INNER JOIN concepto as con 
                ON mov.concepto_id = con.id
                WHERE mov.serie_numero >= 5 
                and mov.empresa_id = 1 
                and mov.sucursal_id = 1
                and mov.tipo_pago = 2  // TARJETA
                and con.tipo = 0 // INGRESO

                */
                //ingresos tarjeta

                $ingresos_tarjeta = Movimiento::where('serie_numero','>', $maxapertura)
                                            ->where('estado', "=", 1)
                                            ->where('empresa_id', "=", $empresa_id)
                                            ->where('sucursal_id', "=", $sucursal_id)
                                            ->join('concepto', 'movimiento.concepto_id', '=', 'concepto.id')
                                            ->where('movimiento.tipo_pago', "=", 2) //tarjeta
                                            ->where('concepto.tipo', "=", 0) //ingreso
                                            ->sum('total');
                round($ingresos_tarjeta,2);

                //ingresos total

                $ingresos_total = Movimiento::where('serie_numero','>', $maxapertura)
                                            ->where('estado', "=", 1)
                                            ->where('empresa_id', "=", $empresa_id)
                                            ->where('sucursal_id', "=", $sucursal_id)
                                            ->join('concepto', 'movimiento.concepto_id', '=', 'concepto.id')
                                            ->where('concepto.tipo', "=", 0) //ingreso
                                            ->sum('total');
                round($ingresos_total,2);

                /*

                SELECT SUM(total)
                FROM movimiento as mov
                INNER JOIN concepto as con 
                ON mov.concepto_id = con.id
                WHERE mov.serie_numero >= 5 
                and mov.empresa_id = 1 
                and mov.sucursal_id = 1
                and con.tipo = 1 // EGRESO

                */
                //egresos
                $egresos = Movimiento::where('serie_numero','>', $maxapertura)
                                            ->where('estado', "=", 1)
                                            ->where('empresa_id', "=", $empresa_id)
                                            ->where('sucursal_id', "=", $sucursal_id)
                                            ->join('concepto', 'movimiento.concepto_id', '=', 'concepto.id')
                                            ->where('concepto.tipo', "=", 1) //egreso
                                            ->sum('total');
                round($egresos,2);
                //saldo
                $saldo = round($ingresos_total - $egresos, 2);
            }
        }

        $pagina           = $request->input('page');
        $filas            = $request->input('filas');
        $entidad          = 'Caja';
        $folio            = Libreria::getParam($request->input('folio'));
        $fechainicio      = Libreria::getParam($request->input('fechainicio'));
        $fechafin         = Libreria::getParam($request->input('fechafin'));
        $resultado        = Movimiento::listar($fechainicio,$fechafin,$folio, $sucursal_id, $aperturaycierre, $maxapertura, $maxcierre);
        $lista            = $resultado->get();
        $cabecera         = array();
        $cabecera[]       = array('valor' => 'Fecha', 'numero' => '1');
        $cabecera[]       = array('valor' => 'Nro', 'numero' => '1');
        $cabecera[]       = array('valor' => 'Concepto', 'numero' => '1');
        $cabecera[]       = array('valor' => 'Persona', 'numero' => '1');
        $cabecera[]       = array('valor' => 'Ingresos', 'numero' => '1');
        $cabecera[]       = array('valor' => 'Egresos', 'numero' => '1');
        $cabecera[]       = array('valor' => 'Tipo Pago', 'numero' => '1');
        $cabecera[]       = array('valor' => 'Comentario', 'numero' => '1');
        $cabecera[]       = array('valor' => 'Usuario', 'numero' => '1');
        $cabecera[]       = array('valor' => 'Operaciones', 'numero' => '1');
        
        $titulo_eliminar  = $this->tituloEliminar;
        $titulo_registrar = $this->tituloRegistrar;
        $titulo_apertura  = $this->tituloApertura;
        $titulo_cierre    = $this->tituloCierre;
        $ruta             = $this->rutas;

        if (count($lista) > 0) {
            $clsLibreria     = new Libreria();
            $paramPaginacion = $clsLibreria->generarPaginacion($lista, $pagina, $filas, $entidad);
            $paginacion      = $paramPaginacion['cadenapaginacion'];
            $inicio          = $paramPaginacion['inicio'];
            $fin             = $paramPaginacion['fin'];
            $paginaactual    = $paramPaginacion['nuevapagina'];
            $lista           = $resultado->paginate($filas);
            $request->replace(array('page' => $paginaactual));
            return view($this->folderview.'.list')->with(compact('lista', 'ingresos_efectivo', 'ingresos_tarjeta', 'ingresos_total', 'egresos' , 'saldo',  'aperturas' , 'cierres' , 'ruta', 'paginacion', 'inicio', 'fin', 'entidad', 'cabecera', 'aperturaycierre', 'titulo_eliminar', 'titulo_registrar', 'titulo_apertura', 'titulo_cierre', 'ruta'));
        }
        return view($this->folderview.'.list')->with(compact('lista', 'ingresos_efectivo', 'ingresos_tarjeta', 'ingresos_total', 'egresos' , 'saldo', 'aperturas' , 'cierres' , 'ruta', 'aperturaycierre', 'titulo_registrar', 'titulo_apertura', 'titulo_cierre', 'entidad'));
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
        $titulo_registrar = $this->tituloRegistrar;
        $titulo_apertura  = $this->tituloApertura;
        $titulo_cierre    = $this->tituloCierre;
        $ruta             = $this->rutas;
        $user = Auth::user();
        $empresa_id = $user->empresa_id;
        $cboSucursal      = Sucursal::where('empresa_id', '=', $empresa_id)->pluck('nombre', 'id')->all();
        return view($this->folderview.'.admin')->with(compact('entidad', 'cboSucursal' , 'title', 'titulo_registrar', 'titulo_apertura' , 'titulo_cierre' , 'ruta'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request)
    {
        $listar       = Libreria::getParam($request->input('listar'), 'NO');
        $entidad      = 'Caja';
        $movimiento   = null;
        $formData     = array('caja.store');
        $formData     = array('route' => $formData, 'class' => 'form-horizontal', 'id' => 'formMantenimiento'.$entidad, 'autocomplete' => 'off');
        
        $sucursal_id  = $request->input('sucursal_id');
        $user = Auth::user();
        $empresa_id = $user->empresa_id;
        $serieventa   = Movimiento::where('empresa_id','=',$empresa_id)->where('sucursal_id', '=' , $sucursal_id)->count() + 1;
        
        $boton        = 'Registrar'; 
        return view($this->folderview.'.mant')->with(compact('serieventa' , 'movimiento', 'formData', 'entidad', 'boton', 'listar'));
    }

    public function apertura(Request $request)
    {
        $listar       = Libreria::getParam($request->input('listar'), 'NO');
        $entidad      = 'Caja';
        $movimiento   = null;
        $formData     = array('caja.store');
        $formData     = array('route' => $formData, 'class' => 'form-horizontal', 'id' => 'formMantenimiento'.$entidad, 'autocomplete' => 'off');
        
        $sucursal_id  = $request->input('sucursal_id');
        $user = Auth::user();
        $empresa_id = $user->empresa_id;
        $persona_id = $user->persona_id;
        $serieventa   = Movimiento::where('empresa_id','=',$empresa_id)->where('sucursal_id', '=' , $sucursal_id)->count() + 1;
        
        $boton        = 'Registrar'; 
        return view($this->folderview.'.apertura')->with(compact('persona_id' , 'serieventa', 'movimiento', 'formData', 'entidad', 'boton', 'listar'));
    }


    public function cierre(Request $request)
    {
        $listar       = Libreria::getParam($request->input('listar'), 'NO');
        $entidad      = 'Caja';
        $movimiento   = null;
        $formData     = array('caja.store');
        $formData     = array('route' => $formData, 'class' => 'form-horizontal', 'id' => 'formMantenimiento'.$entidad, 'autocomplete' => 'off');

        $sucursal_id  = $request->input('sucursal_id');
        $user = Auth::user();
        $empresa_id = $user->empresa_id;
        $persona_id = $user->persona_id;
        $serieventa   = Movimiento::where('empresa_id','=',$empresa_id)->where('sucursal_id', '=' , $sucursal_id)->count() + 1;
        
        $boton        = 'Registrar';
        return view($this->folderview.'.cierre')->with(compact('persona_id' , 'serieventa', 'movimiento', 'formData', 'entidad', 'boton', 'listar'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     * 
     * 
     * EDITAR NUEVO
     * 
     * 
     */
    public function store(Request $request)
    {
        $listar     = Libreria::getParam($request->input('listar'), 'NO');
        $reglas     = array('serieventa' => 'required|numeric',
                            'fecha'      => 'required',
                            'concepto_id'   => 'required',
                            'persona_id' => 'required',
                            //'total'      => 'required',
                            'tipopago'   => 'required'
                         );
        $mensajes   = array();
        $validacion = Validator::make($request->all(), $reglas, $mensajes);
        if ($validacion->fails()) {
            return $validacion->messages()->toJson();
        }
        $error = DB::transaction(function() use($request){
            $movimiento       = new Movimiento();
            $movimiento->concepto_id    = $request->input('concepto_id');
            $movimiento->serie_numero   = $request->input('serieventa');
            //$movimiento->total          = 0;
            $movimiento->total          = $request->input('total');
            $movimiento->tipo_pago      = (int) $request->input('tipopago'); // 1-efectivo y 2-tarjeta
            $movimiento->estado         = 1;
            $movimiento->cliente_id     = $request->input('persona_id');
            $user           = Auth::user();
            $movimiento->usuario_id     = $user->id;
            $empresa_id     = $user->empresa_id;
            $movimiento->empresa_id   = $empresa_id;
            $movimiento->sucursal_id   = $request->input('sucursal');
            $movimiento->comentario     = strtoupper($request->input('comentario'));
            $movimiento->save();
        });
        return is_null($error) ? "OK" : $error;
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
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

    public function proveedorautocompletar($searching)
    {
        $type = 'P';
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

    public function empleadoautocompletar($searching)
    {
        $type = 'E';
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

    public function generarConcepto(Request $request)
    {
        //QUITAR APERTURA Y CIERRE DE CAJA
        $tipoconcepto_id  = $request->input('tipoconcepto_id');   
        $conceptos = Concepto::where('tipo', '=' , $tipoconcepto_id)
                                ->where('id','!=',1)
                                ->where('id','!=',2)
                                ->orderBy('concepto','ASC')->get();
        $html = "<option disabled selected>SELECCIONE CONCEPTO</option>";
        foreach($conceptos as $key => $value){
            $html = $html . '<option value="'. $value->id .'">'. $value->concepto .'</option>';
        }
        return $html;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $existe = Libreria::verificarExistencia($id, 'movimiento');
        if ($existe !== true) {
            return $existe;
        }
        $error = DB::transaction(function() use($id){
            $movimiento = Movimiento::find($id);
            $movimiento->estado = 0;
            $movimiento->save();
        });
        return is_null($error) ? "OK" : $error;
    }

    /**
     * Función para confirmar la eliminación de un registrlo
     * @param  integer $id          id del registro a intentar eliminar
     * @param  string $listarLuego consultar si luego de eliminar se listará
     * @return html              se retorna html, con la ventana de confirmar eliminar
     */
    public function eliminar($id, $listarLuego)
    {
        $existe = Libreria::verificarExistencia($id, 'movimiento');
        if ($existe !== true) {
            return $existe;
        }
        $listar = "NO";
        if (!is_null(Libreria::obtenerParametro($listarLuego))) {
            $listar = $listarLuego;
        }
        $modelo   = Movimiento::find($id);
        $entidad  = 'Caja';
        $formData = array('route' => array('caja.destroy', $id), 'method' => 'DELETE', 'class' => 'form-horizontal', 'id' => 'formMantenimiento'.$entidad, 'autocomplete' => 'off');
        $boton    = 'Anular';
        $mensaje  = '<blockquote><p class="text-danger">¿Está seguro de anular el registro?</p></blockquote>';
        return view('app.confirmarEliminar')->with(compact( 'mensaje' ,'modelo', 'formData', 'entidad', 'boton', 'listar'));
    }
}
