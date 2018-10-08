<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use Hash;
use Validator;
use App\Http\Requests;
use App\Distrito;
use App\Persona;
use App\Personamaestro;
use App\Librerias\Libreria;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

class TrabajadorController extends Controller
{
    protected $folderview      = 'app.trabajador';
    protected $tituloAdmin     = 'Trabajadores';
    protected $tituloRegistrar = 'Registrar Trabajador';
    protected $tituloModificar = 'Modificar Trabajador';
    protected $tituloEliminar  = 'Eliminar Trabajador';
    protected $rutas           = array('create' => 'trabajador.create', 
            'edit'   => 'trabajador.edit', 
            'delete' => 'trabajador.eliminar',
            'search' => 'trabajador.buscar',
            'index'  => 'trabajador.index',
        );

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Mostrar el resultado de búsquedas
     * 
     * @return Response 
     */
    public function buscar(Request $request)
    {
        $pagina           = $request->input('page');
        $filas            = $request->input('filas');
        $entidad          = 'Trabajador';
        $name             = Libreria::getParam($request->input('name'));
        $type             = 'E';
        $resultado        = Personamaestro::listar($name,$type);
        $lista            = $resultado->get();
        $cabecera         = array();
        $cabecera[]       = array('valor' => '#', 'numero' => '1');
        $cabecera[]       = array('valor' => 'DNI', 'numero' => '1');
        $cabecera[]       = array('valor' => 'Nombre Completo', 'numero' => '1');
        $cabecera[]       = array('valor' => 'Celular', 'numero' => '1');
        $cabecera[]       = array('valor' => 'Telefono', 'numero' => '1');
        $cabecera[]       = array('valor' => 'Direccion', 'numero' => '1');
        $cabecera[]       = array('valor' => 'Operaciones', 'numero' => '2');
        
        $titulo_modificar = $this->tituloModificar;
        $titulo_eliminar  = $this->tituloEliminar;
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
            return view($this->folderview.'.list')->with(compact('lista', 'paginacion', 'inicio', 'fin', 'entidad', 'cabecera', 'titulo_modificar', 'titulo_eliminar', 'ruta'));
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
        $entidad          = 'Trabajador';
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
        $listar         = Libreria::getParam($request->input('listar'), 'NO');
        $entidad        = 'Trabajador'; //es personamaestro
        $cliente        = null;
        $cboDistrito = array('' => 'Seleccione') + Distrito::pluck('nombre', 'id')->all();
        $formData       = array('trabajador.store');
        $formData       = array('route' => $formData, 'class' => 'form-horizontal', 'id' => 'formMantenimiento'.$entidad, 'autocomplete' => 'off');
        $boton          = 'Registrar'; 
        return view($this->folderview.'.mant')->with(compact('cliente', 'formData', 'entidad', 'boton', 'cboDistrito', 'listar'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $listar     = Libreria::getParam($request->input('listar'), 'NO');
        $documento = $request->input('documento');
        $tamCadena = strlen($documento);
        if($tamCadena == 8){
            $reglas = array(
                'documento'       => 'required|max:8|unique:personamaestro,dni,NULL,id,deleted_at,NULL',
                'nombres'    => 'required|max:100',
                'apellidos'    => 'required|max:100',
                'distrito_id' => 'required|integer|exists:distrito,id,deleted_at,NULL',
                );
        }else{
            $reglas = array(
            'documento'       => 'required|max:11|unique:personamaestro,ruc,NULL,id,deleted_at,NULL',
            'razonsocial'    => 'required|max:100',
            'celular'    => 'required|max:15',
            'distrito_id' => 'required|integer|exists:distrito,id,deleted_at,NULL',
            );
        }
        $validacion = Validator::make($request->all(),$reglas);
        if ($validacion->fails()) {
            return $validacion->messages()->toJson();
        }
        $error = DB::transaction(function() use($request,$tamCadena){
            $cliente               = new Personamaestro();
            if($tamCadena == 8){
                $cliente->dni        = $request->input('documento');
            }else{
                $cliente->ruc        = $request->input('documento');
            }
            $cliente->nombres    = $request->input('nombres');
            $cliente->apellidos  = $request->input('apellidos');
            $cliente->razonsocial = $request->input('razonsocial'); 
            $cliente->direccion   = $request->input('direccion');
            $cliente->telefono    = $request->input('telefono');
            $cliente->celular     = $request->input('celular');
            $cliente->email       = $request->input('email');
            $value =Libreria::getParam($request->input('fechanacimiento'));
            $cliente->fechanacimiento        = $value;
            $cliente->distrito_id  = $request->input('distrito_id');
            //$cliente->observation        = $request->input('observacion');
            $cliente->type        = 'E';

            if(!is_null($request->input('proveedor')) && is_null($request->input('cliente'))){
                $cliente->secondtype  = $request->input('proveedor');
            }else if(!is_null($request->input('cliente')) && is_null($request->input('proveedor'))){
                $cliente->secondtype  = $request->input('cliente');
            }else if(!is_null($request->input('proveedor')) && !is_null($request->input('clientee'))){
                $cliente->secondtype  = 'T';
            }

            //$cliente->secondtype  = $request->input('cbo_esproveedor');//ES CLIENTE NO CAMBIE EL NOMBRE XD
            if($request->input('cbocomision') != "-1"){
                $cliente->comision = $request->input('cbocomision');
            }
            $cliente->save();
            /*REGISTRAMOS LA PERSONA EN LA EMPRESA */
            $persona = new Persona();
            $persona->empresa_id = Auth::user()->empresa_id;
            $persona->personamaestro_id = $cliente->id;
            $persona->save();
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
    public function edit($id, Request $request)
    {
        $existe = Libreria::verificarExistencia($id, 'personamaestro');
        if ($existe !== true) {
            return $existe;
        }
        $listar         = Libreria::getParam($request->input('listar'), 'NO');
        $cboDistrito = array('' => 'Seleccione') + Distrito::pluck('nombre', 'id')->all();
        $cliente        = personamaestro::find($id);
        $entidad        = 'Trabajador';
        $formData       = array('trabajador.update', $id);
        $formData       = array('route' => $formData, 'method' => 'PUT', 'class' => 'form-horizontal', 'id' => 'formMantenimiento'.$entidad, 'autocomplete' => 'off');
        $boton          = 'Modificar';
        return view($this->folderview.'.mant')->with(compact('cliente', 'formData', 'entidad', 'boton', 'listar', 'cboDistrito'));
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
        $existe = Libreria::verificarExistencia($id, 'personamaestro');
        if ($existe !== true) {
            return $existe;
        }
        $documento = $request->input('documento');
        $tamCadena = strlen($documento);
        if($tamCadena == 8){
            $reglas = array(
                'documento'       => 'required|max:8|unique:personamaestro,dni,'.$id.',id,deleted_at,NULL',
                'nombres'    => 'required|max:100',
                'apellidos'    => 'required|max:100',
                'distrito_id' => 'required|integer|exists:distrito,id,deleted_at,NULL',
                );
        }else{
            $reglas = array(
            'documento'       => 'required|max:11|unique:personamaestro,ruc,'.$id.',id,deleted_at,NULL',
            'razonsocial'    => 'required|max:100',
            'distrito_id' => 'required|integer|exists:distrito,id,deleted_at,NULL',
            );
        }
        $validacion = Validator::make($request->all(),$reglas);
        if ($validacion->fails()) {
            return $validacion->messages()->toJson();
        } 
        $error = DB::transaction(function() use($request, $id, $tamCadena){
            $cliente               = Personamaestro::find($id);
            if($tamCadena == 8){
                $cliente->dni        = $request->input('documento');
            }else{
                $cliente->ruc        = $request->input('documento');
            }
            $cliente->nombres    = $request->input('nombres');
            $cliente->apellidos  = $request->input('apellidos');
            $cliente->razonsocial = $request->input('razonsocial'); 
            $cliente->direccion   = $request->input('direccion');
            $cliente->telefono    = $request->input('telefono');
            $cliente->celular     = $request->input('celular');
            $cliente->email       = $request->input('email');
            $value =Libreria::getParam($request->input('fechanacimiento'));
            $cliente->fechanacimiento        = $value;
            $cliente->distrito_id  = $request->input('distrito_id');
            //$cliente->observation        = $request->input('observacion');
            //$cliente->type        = 'T';
            
            if(!is_null($request->input('proveedor')) && is_null($request->input('cliente'))){
                $cliente->secondtype  = $request->input('proveedor');
            }else if(!is_null($request->input('cliente')) && is_null($request->input('proveedor'))){
                $cliente->secondtype  = $request->input('cliente');
            }else if(!is_null($request->input('proveedor')) && !is_null($request->input('clientee'))){
                $cliente->secondtype  = 'T';
            }
            //$cliente->secondtype  = $request->input('cbo_esproveedor');//ES CLIENTE NO CAMBIE EL NOMBRE XD

            if($request->input('cbocomision') != "-1"){
                $cliente->comision = $request->input('cbocomision');
            }
            $cliente->save();
        });
        return is_null($error) ? "OK" : $error;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $existe = Libreria::verificarExistencia($id, 'personamaestro');
        if ($existe !== true) {
            return $existe;
        }
        $error = DB::transaction(function() use($id){
            $cliente = Personamaestro::find($id);
            $persona = Persona::where('personamaestro_id','=',$id)->get()->first();
            if(!is_null($persona)){
                $persona->delete();
            }
            $cliente->delete();
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
        $existe = Libreria::verificarExistencia($id, 'personamaestro');
        if ($existe !== true) {
            return $existe;
        }
        $listar = "NO";
        if (!is_null(Libreria::obtenerParametro($listarLuego))) {
            $listar = $listarLuego;
        }
        $modelo   = Personamaestro::find($id);
        $entidad  = 'Trabajador';
        $formData = array('route' => array('trabajador.destroy', $id), 'method' => 'DELETE', 'class' => 'form-horizontal', 'id' => 'formMantenimiento'.$entidad, 'autocomplete' => 'off');
        $boton    = 'Eliminar';
        return view('app.confirmarEliminar')->with(compact('modelo', 'formData', 'entidad', 'boton', 'listar'));
    }
}
