<?php

namespace App\Http\Controllers;

use Validator;
use Illuminate\Http\Request;
use App\Http\Requests;
use App\Sucursal;
use App\Serieventa;
use App\Movimiento;
use App\Librerias\Libreria;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

class SucursalController extends Controller
{

    protected $folderview      = 'app.sucursal';
    protected $tituloAdmin     = 'Sucursal';
    protected $tituloRegistrar = 'Registrar sucursal';
    protected $tituloModificar = 'Modificar sucursal';
    protected $tituloEliminar  = 'Eliminar sucursal';
    protected $tituloSerieVenta  = 'Serie venta';
    protected $rutas           = array('create' => 'sucursal.create', 
            'edit'     => 'sucursal.edit', 
            'delete'   => 'sucursal.eliminar',
            'search'   => 'sucursal.buscar',
            'index'    => 'sucursal.index',
            'serieventa' => 'sucursal.serieventa',
            'aumentarserieventa' => 'sucursal.aumentarserieventa'
        );

    public function __construct()
    {
        $this->middleware('auth');
    }

    public function buscar(Request $request)
    {
        $pagina           = $request->input('page');
        $filas            = $request->input('filas');
        $entidad          = 'Sucursal';
        $nombre           = Libreria::getParam($request->input('nombre'));
        $resultado        = Sucursal::listar($nombre);
        $lista            = $resultado->get();
        $cabecera         = array();
        $cabecera[]       = array('valor' => '#', 'numero' => '1');
        $cabecera[]       = array('valor' => 'Nombre', 'numero' => '1');
        $cabecera[]       = array('valor' => 'Direccion', 'numero' => '1');
        $cabecera[]       = array('valor' => 'Telefono', 'numero' => '1');
        $cabecera[]       = array('valor' => 'Serie venta', 'numero' => '1');
        $cabecera[]       = array('valor' => 'Operaciones', 'numero' => '3');
        
        $titulo_modificar = $this->tituloModificar;
        $titulo_eliminar  = $this->tituloEliminar;
        $titulo_serie_venta = $this->tituloSerieVenta;
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
            return view($this->folderview.'.list')->with(compact('lista', 'paginacion', 'inicio', 'fin', 'entidad', 'cabecera', 'titulo_modificar', 'titulo_eliminar', 'titulo_serie_venta', 'ruta'));
        }
        return view($this->folderview.'.list')->with(compact('lista', 'entidad'));
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $entidad          = 'Sucursal';
        $title            = $this->tituloAdmin;
        $titulo_registrar = $this->tituloRegistrar;
        $ruta             = $this->rutas;
        return view($this->folderview.'.admin')->with(compact('entidad', 'title', 'titulo_registrar', 'ruta'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request)
    {
        $listar       = Libreria::getParam($request->input('listar'), 'NO');
        $entidad      = 'Sucursal';
        $sucursal  = null;
        $formData     = array('sucursal.store');
        $formData     = array('route' => $formData, 'class' => 'form-horizontal', 'id' => 'formMantenimiento'.$entidad, 'autocomplete' => 'off');
        $boton        = 'Registrar'; 
        return view($this->folderview.'.mant')->with(compact('sucursal', 'formData', 'entidad', 'boton', 'listar'));
    }

    public function store(Request $request)
    {
        $listar     = Libreria::getParam($request->input('listar'), 'NO');
        $reglas     = array('nombre' => 'required|max:50',
                            'direccion' => 'required|max:100',
                            'telefono' => 'required|max:15');
        $mensajes   = array();
        $validacion = Validator::make($request->all(), $reglas, $mensajes);
        if ($validacion->fails()) {
            return $validacion->messages()->toJson();
        }
        $error = DB::transaction(function() use($request){
            $sucursal       = new Sucursal();
            $sucursal->nombre = strtoupper($request->input('nombre'));
            $sucursal->direccion = strtoupper($request->input('direccion'));
            $sucursal->telefono = $request->input('telefono');
            $user = Auth::user();
            $sucursal->empresa_id = $user->empresa_id;
            $sucursal->save();
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

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(Request $request, $id)
    {
        $existe = Libreria::verificarExistencia($id, 'sucursal');
        if ($existe !== true) {
            return $existe;
        }
        $listar   = Libreria::getParam($request->input('listar'), 'NO');
        $sucursal = Sucursal::find($id);
        $entidad  = 'Sucursal';
        $formData = array('sucursal.update', $id);
        $formData = array('route' => $formData, 'method' => 'PUT', 'class' => 'form-horizontal', 'id' => 'formMantenimiento'.$entidad, 'autocomplete' => 'off');
        $boton    = 'Modificar';
        return view($this->folderview.'.mant')->with(compact('sucursal', 'formData', 'entidad', 'boton', 'listar'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $existe = Libreria::verificarExistencia($id, 'sucursal');
        if ($existe !== true) {
            return $existe;
        }
        $reglas     = array('nombre' => 'required|max:50',
                            'direccion' => 'required|max:100',
                            'telefono' => 'required|max:15');
        $mensajes   = array();
        $validacion = Validator::make($request->all(), $reglas, $mensajes);
        if ($validacion->fails()) {
            return $validacion->messages()->toJson();
        } 
        $error = DB::transaction(function() use($request, $id){
            $sucursal       = Sucursal::find($id);
            $sucursal->nombre = strtoupper($request->input('nombre'));
            $sucursal->direccion = strtoupper($request->input('direccion'));
            $sucursal->telefono = $request->input('telefono');
            $sucursal->save();
        });
        return is_null($error) ? "OK" : $error;
    }

    public function serieventa(Request $request, $id)
    {
        $existe = Libreria::verificarExistencia($id, 'sucursal');
        if ($existe !== true) {
            return $existe;
        }
        $listar   = Libreria::getParam($request->input('listar'), 'NO');
        $sucursal = Sucursal::find($id);
        $entidad  = 'serieventa';
        $formData = array('sucursal.aumentarserieventa', $id);
        $formData = array('route' => $formData, 'method' => 'POST', 'class' => 'form-horizontal', 'id' => 'formMantenimiento'.$entidad, 'autocomplete' => 'off');
        $serieventa = Serieventa::where('sucursal_id','=',$id)->max('id');
        $serieventaa = Serieventa::find($serieventa);
        $cantidad = Movimiento::where('serieventa_id' , '=' , $serieventa)->count('serieventa_id');
        $cantidadserie = Serieventa::where('sucursal_id','=',$id)->count('id');
        return view($this->folderview.'.serieventa')->with(compact('serieventaa', 'cantidadserie' , 'cantidad', 'sucursal', 'formData', 'entidad', 'listar'));
    }

    public function aumentarserieventa(Request $request){

        $sucursal = Sucursal::find($request->input('sucursal_id'));

        $serieventa = Serieventa::where('sucursal_id', '=' , $sucursal->id)->count('id');
        $serieventa = $serieventa + 1;
        $serieventa = (string) $serieventa;
        $cant = strlen($serieventa);
        $ceros = 4 - $cant;
        while($ceros != 0){
            $serieventa = "0". $serieventa;
            $ceros = $ceros - 1;
        }
        
        $error = DB::transaction(function() use($request, $sucursal, $serieventa){
            $serie       = new Serieventa();
            $serie->serie = $serieventa;
            $serie->sucursal_id = $sucursal->id;
            $serie->save();
        });
        return is_null($error) ? "OK" : $error;
    }

    public function eliminarserieventa(Request $request){
        $sucursal = Sucursal::find($request->input('sucursal_id'));

        $serieventa_id = Serieventa::where('sucursal_id', '=' , $sucursal->id)->max('id');
        
        $error = DB::transaction(function() use($request, $serieventa_id){
            $serieventa = Serieventa::find($serieventa_id);
            $serieventa->delete();
        });
        return is_null($error) ? "OK" : $error;
    }

    public function actualizarserieventa(Request $request){

        $sucursal = Sucursal::find($request->input('sucursal_id'));

        $serieventa_id = Serieventa::where('sucursal_id', '=' , $sucursal->id)->max('id');
        
        $serieventa = Serieventa::find($serieventa_id);

        return $serieventa->serie;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $existe = Libreria::verificarExistencia($id, 'sucursal');
        if ($existe !== true) {
            return $existe;
        }
        $error = DB::transaction(function() use($id){
            $sucursal = Sucursal::find($id);
            $sucursal->delete();
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
        $existe = Libreria::verificarExistencia($id, 'sucursal');
        if ($existe !== true) {
            return $existe;
        }
        $listar = "NO";
        if (!is_null(Libreria::obtenerParametro($listarLuego))) {
            $listar = $listarLuego;
        }
        $modelo   = Sucursal::find($id);
        $entidad  = 'Sucursal';
        $formData = array('route' => array('sucursal.destroy', $id), 'method' => 'DELETE', 'class' => 'form-horizontal', 'id' => 'formMantenimiento'.$entidad, 'autocomplete' => 'off');
        $boton    = 'Eliminar';
        return view('app.confirmarEliminar')->with(compact('modelo', 'formData', 'entidad', 'boton', 'listar'));
    }
}
