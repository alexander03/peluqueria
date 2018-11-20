<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

use Illuminate\Auth\UserInterface;
use Illuminate\Auth\Reminders\RemindableInterface;
use App\Librerias\Libreria;

class Detallecomision extends Model
{
   use SoftDeletes;
   protected $table = 'detalle_comision';   
   protected $date = 'delete_at';
	
}
