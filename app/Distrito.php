<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Distrito extends Model
{
	use SoftDeletes;
    protected $table = 'distrito';
    protected $dates = ['deleted_at'];
}
