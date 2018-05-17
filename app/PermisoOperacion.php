<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class PermisoOperacion extends Model
{
    use SoftDeletes;
    protected $table = 'permiso_operacion';
}
