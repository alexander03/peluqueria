<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

class Personamaestro extends Model
{
    use SoftDeletes;
    protected $table = 'personamaestro';
    protected $dates = ['deleted_at'];

    /**
     * Método para listar
     * @param  model $query modelo
     * @param  string $name  nombre
     * @return sql        sql
     */
    public function scopelistar($query, $name, $type)
    {   
        $sql = "(CONCAT(apellidos,'',nombres) LIKE '%.$name.%' OR RAZONSOCIAL LIKE '%.$name.%')";
        $sql = $sql." AND TYPE = '.$type.' AND SECONDTYPE IN('N','S') OR CASE '.$type.' WHEN 'C' THEN (TYPE IN ('P','T') AND SECONDTYPE = 'S') WHEN 'P' THEN (TYPE = 'C' AND SECONDTYPE = 'S') ELSE (TYPE = 'C' AND SECONDTYPE = 'S') END";
        //echo $sql;        
        $user = Auth::user();
        $empresa_id = $user->empresa_id;
        return $query->where(function($subquery) use($name)
		            {
		            	if (!is_null($name)) {
                            $subquery->where(DB::raw('CONCAT(apellidos," ",nombres)'), 'LIKE', '%'.$name.'%')->orWhere('razonsocial','LIKE','%'.$name.'%');
		            	}
                    })
        			->where(function($subquery) use($type)
		            {
		            	if (!is_null($type)) {
                            //$subquery->where('type', '=', $type)->orWhere('secondtype','=','S');
                            //$IN = " ('P','T')";
                            if($type == 'C'){
                                $subquery->where('type', '=', $type)->orwhere('secondtype','=', $type)->orwhere('type','=', 'T');
                            }else if($type == 'P'){
                                $subquery->where('type', '=', $type)->orwhere('secondtype','=', $type)->orwhere('type','=', 'T');
                            }else if($type == 'E'){
                                $subquery->where('type', '=', $type)->orwhere('secondtype','=', $type)->orwhere('type','=', 'T');
                            }
                        }		            		
                    })
                    ->leftJoin('persona', 'personamaestro.id', '=', 'persona.personamaestro_id')
                    ->where('persona.empresa_id', '=', $empresa_id)
                    ->whereNull('personamaestro.deleted_at')
                    ->orderBy('nombres', 'ASC')->orderBy('apellidos', 'ASC')->orderBy('razonsocial', 'ASC');                   
    }

    public function distrito()
    {
        return $this->belongsTo('App\Distrito', 'usertype_id');
    }

}
