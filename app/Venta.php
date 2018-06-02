<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

use Illuminate\Auth\UserInterface;
use Illuminate\Auth\Reminders\RemindableInterface;
use App\Librerias\Libreria;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class Venta extends Model
{
   use SoftDeletes;
   protected $table = 'venta';   
   protected $date = 'delete_at';

	/**
	 * Método para listar las opciones de menu
	 * @param  [type] $query [description]
	 * @return [type]        [description]
	 */
	public function scopelistar($query, $fechainicio, $fechafin, $folio)
    {
        return $query->where(function($subquery) use($fechainicio, $fechafin, $folio)
		            {
		            	if (!is_null($fechainicio) && !is_null($fechafin)) {
							$subquery->whereBetween(DB::raw('CONVERT(fecha,date)'),[$fechainicio,$fechafin])->Where('serie_numero','LIKE','%'.$folio.'%');
		            	}
		            })
        			->orderBy('fecha', 'ASC');
	}
	
}
