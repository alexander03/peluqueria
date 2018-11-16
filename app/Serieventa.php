<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

use Illuminate\Support\Facades\Auth;

class Serieventa extends Model
{
    use SoftDeletes;
    protected $table = 'serieventa';
    protected $dates = ['deleted_at'];

    /**
     * Método para listar
     * @param  model $query modelo
     * @param  string $name  nombre
     * @return sql        sql
     */
    public function scopelistar($query, $sucursal_id)
    {
        return $query->where(function($subquery) use($sucursal_id)
		            {
		            	if (!is_null($sucursal_id)) {
		            		$subquery->where('sucursal_id', '=', sucursal_id);
		            	}
                    })
        			->orderBy('descripcion', 'ASC');
    }

}
