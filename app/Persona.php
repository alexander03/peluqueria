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

}
