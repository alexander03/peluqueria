<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

use Illuminate\Auth\UserInterface;
use Illuminate\Auth\Reminders\RemindableInterface;
use App\Librerias\Libreria;
use Illuminate\Support\Facades\Auth;

class Concepto extends Model
{
    use SoftDeletes;
    protected $dates = ['deleted_at'];
    
    protected $table='concepto';

    protected $primaryKey='id';

}
