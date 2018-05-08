<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Personamaestro extends Model
{
    use SoftDeletes;
    protected $table = 'personamaestro';
    protected $dates = ['deleted_at'];

}
