<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Persona extends Model
{
    use SoftDeletes;
    protected $table = 'persona';
    protected $dates = ['deleted_at'];
    
    public function personamaestro(){
        return $this->belongsTo('App\Personamaestro', 'personamaestro_id');
    }
    
    public function empresa(){
        return $this->belongsTo('App\Empresa', 'empresa_id');
    }

    /**
     * Método para listar
     * @param  model $query modelo
     * @param  string $name  nombre
     * @return sql        sql
     *//*
    public function scopelistar($query, $name, $type)
    {
        return $query->where(function($subquery) use($name)
		            {
		            	if (!is_null($name)) {
		            		$subquery->where(DB::raw('CONCAT(apellidos," ",nombres)'), 'LIKE', '%'.$name.'%')->orWhere('razonsocial','LIKE','%'.$name.'%');
		            	}
		            })
        			->where(function($subquery) use($type)
		            {
		            	if (!is_null($type)) {
		            		$subquery->where('type', '=', $type);
		            	}
		            })
        			->orderBy('nombres', 'ASC')->orderBy('apellidos', 'ASC')->orderBy('razonsocial', 'ASC');
    }*/
}
