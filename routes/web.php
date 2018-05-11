<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Authentication routes...
// Route::get('auth/login', 'Auth\AuthController@getLogin');
// Route::post('auth/login', ['as' =>'auth/login', 'uses' => 'Auth\AuthController@postLogin']);
// Route::get('auth/logout', ['as' => 'auth/logout', 'uses' => 'Auth\AuthController@getLogout']);
 
// Registration routes...
// Route::get('auth/register', 'Auth\AuthController@getRegister');
// Route::post('auth/register', ['as' => 'auth/register', 'uses' => 'Auth\AuthController@postRegister']);

Auth::routes();
Route::get('logout', 'Auth\LoginController@logout');

Route::get('/', function(){
    return redirect('/dashboard');
});

Route::group(['middleware' => 'auth'], function () {
    Route::get('/dashboard', function(){
        return View::make('dashboard.home');
    });

    Route::post('categoria/buscar','CategoriaController@buscar')->name('categoria.buscar');
    Route::get('categoria/eliminar/{id}/{listarluego}','CategoriaController@eliminar')->name('categoria.eliminar');
    Route::resource('categoria', 'CategoriaController', array('except' => array('show')));

    Route::post('unidad/buscar','UnidadController@buscar')->name('unidad.buscar');
    Route::get('unidad/eliminar/{id}/{listarluego}','UnidadController@eliminar')->name('unidad.eliminar');
    Route::resource('unidad', 'UnidadController', array('except' => array('show')));

    Route::post('producto/buscar','ProductoController@buscar')->name('producto.buscar');
    Route::get('producto/eliminar/{id}/{listarluego}','ProductoController@eliminar')->name('producto.eliminar');
    Route::resource('producto', 'ProductoController', array('except' => array('show')));

    Route::post('marca/buscar','MarcaController@buscar')->name('marca.buscar');
    Route::get('marca/eliminar/{id}/{listarluego}','MarcaController@eliminar')->name('marca.eliminar');
    Route::resource('marca', 'MarcaController', array('except' => array('show')));

    Route::post('categoriaopcionmenu/buscar', 'CategoriaopcionmenuController@buscar')->name('categoriaopcionmenu.buscar');
    Route::get('categoriaopcionmenu/eliminar/{id}/{listarluego}', 'CategoriaopcionmenuController@eliminar')->name('categoriaopcionmenu.eliminar');
    Route::resource('categoriaopcionmenu', 'CategoriaopcionmenuController', array('except' => array('show')));

    Route::post('opcionmenu/buscar', 'OpcionmenuController@buscar')->name('opcionmenu.buscar');
    Route::get('opcionmenu/eliminar/{id}/{listarluego}', 'OpcionmenuController@eliminar')->name('opcionmenu.eliminar');
    Route::resource('opcionmenu', 'OpcionmenuController', array('except' => array('show')));

    Route::post('tipousuario/buscar', 'TipousuarioController@buscar')->name('tipousuario.buscar');
    Route::get('tipousuario/obtenerpermisos/{listar}/{id}', 'TipousuarioController@obtenerpermisos')->name('tipousuario.obtenerpermisos');
    Route::post('tipousuario/guardarpermisos/{id}', 'TipousuarioController@guardarpermisos')->name('tipousuario.guardarpermisos');
    Route::get('tipousuario/eliminar/{id}/{listarluego}', 'TipousuarioController@eliminar')->name('tipousuario.eliminar');
    Route::resource('tipousuario', 'TipousuarioController', array('except' => array('show')));
    Route::get('tipousuario/pdf', 'TipousuarioController@pdf')->name('tipousuario.pdf');

    Route::post('workertype/buscar', 'WorkertypeController@buscar')->name('workertype.buscar');
    Route::get('workertype/eliminar/{id}/{listarluego}', 'WorkertypeController@eliminar')->name('workertype.eliminar');
    Route::resource('workertype', 'WorkertypeController', array('except' => array('show')));

    Route::post('employee/buscar', 'EmployeeController@buscar')->name('employee.buscar');
    Route::get('employee/eliminar/{id}/{listarluego}', 'EmployeeController@eliminar')->name('employee.eliminar');
    Route::resource('employee', 'EmployeeController', array('except' => array('show')));

    /* CUSTOMERS */
    Route::post('customer/search', 'CustomerController@search')->name('customer.search');
    Route::get('customer/eliminar/{id}/{listarluego}', 'CustomerController@eliminar')->name('customer.eliminar');
    Route::resource('customer', 'CustomerController', array('except' => array('show'))); 

    /* PROVIDERS */
    Route::post('provider/search', 'ProviderController@search')->name('provider.search');
    Route::get('provider/eliminar/{id}/{listarluego}', 'ProviderController@eliminar')->name('provider.eliminar');
    Route::resource('provider', 'ProviderController', array('except' => array('show')));

    /* COMPANY */
    Route::post('company/search', 'CompanyController@search')->name('company.search');
    Route::get('company/eliminar/{id}/{listarluego}', 'CompanyController@eliminar')->name('company.eliminar');
    Route::resource('company', 'CompanyController', array('except' => array('show')));

    Route::post('usuario/buscar', 'UsuarioController@buscar')->name('usuario.buscar');
    Route::get('usuario/eliminar/{id}/{listarluego}', 'UsuarioController@eliminar')->name('usuario.eliminar');
    Route::resource('usuario', 'UsuarioController', array('except' => array('show')));

    /*PERSON*/
    Route::post('person/search', 'PersonController@search')->name('person.search');
    Route::get('person/employeesautocompleting/{searching}', 'PersonController@employeesautocompleting')->name('person.employeesautocompleting');
    Route::get('person/providersautocompleting/{searching}', 'PersonController@providersautocompleting')->name('person.providersautocompleting');
    Route::get('person/customersautocompleting/{searching}', 'PersonController@customersautocompleting')->name('person.customersautocompleting');
});

Route::get('provincia/cboprovincia/{id?}', array('as' => 'provincia.cboprovincia', 'uses' => 'ProvinciaController@cboprovincia'));
Route::get('distrito/cbodistrito/{id?}', array('as' => 'distrito.cbodistrito', 'uses' => 'DistritoController@cbodistrito'));