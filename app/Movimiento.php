<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

use Illuminate\Auth\UserInterface;
use Illuminate\Auth\Reminders\RemindableInterface;
use App\Librerias\Libreria;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class Movimiento extends Model
{
   use SoftDeletes;
   protected $table = 'movimiento';   
   protected $date = 'delete_at';

	/**
	 * Método para listar las opciones de menu
	 * @param  [type] $query [description]
	 * @return [type]        [description]
	 */
	public function scopelistar($query, $fechainicio, $fechafin, $folio, $sucursal_id, $aperturaycierre, $maxapertura, $maxcierre)
    {
		$user = Auth::user();
		$empresa_id = $user->empresa_id;

		return $query->where(function($subquery) use($fechainicio, $fechafin, $folio, $empresa_id, $aperturaycierre, $maxapertura, $maxcierre)
		            {
						if (!is_null($maxapertura) && !is_null($maxcierre)) {
							if($aperturaycierre == 0){ //apertura y cierre iguales ---- no mostrar nada
								$subquery->Where('serie_numero','>=', $maxapertura)->Where('serie_numero','<=', $maxcierre);
							}else if($aperturaycierre == 1){ //apertura y cierre diferentes ------- mostrar desde apertura
								$subquery->Where('serie_numero','>=', $maxapertura);
							}
						}
						
		            	if (!is_null($fechainicio) && !is_null($fechafin)) {
							$subquery->whereBetween(DB::raw('CONVERT(fecha,date)'),[$fechainicio,$fechafin])->Where('serie_numero','LIKE','%'.$folio.'%');
		            	}else{
							$subquery->Where('serie_numero','LIKE','%'.$folio.'%');
						}
					})
					->where('empresa_id', "=", $empresa_id)
					->where('sucursal_id', "=", $sucursal_id)
        			->orderBy('serie_numero','DESC')->orderBy('fecha', 'DESC');
	}
	
}
