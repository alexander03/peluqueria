<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

use Illuminate\Support\Facades\Auth;

class Servicio extends Model
{
    use SoftDeletes;
    protected $table = 'servicio';
    protected $dates = ['deleted_at'];

    /**
     * Método para listar
     * @param  model $query modelo
     * @param  string $name  nombre
     * @return sql        sql
     */
    public function scopelistar($query, $descripcion)
    {
        $user = Auth::user();
		$empresa_id = $user->empresa_id;
        return $query->where(function($subquery) use($descripcion)
		            {
		            	if (!is_null($descripcion)) {
		            		$subquery->where('descripcion', 'LIKE', '%'.$descripcion.'%');
		            	}
                    })
                    ->where('empresa_id', "=", $empresa_id)
        			->orderBy('descripcion', 'ASC');
    }

}
