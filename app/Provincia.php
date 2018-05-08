<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Provincia extends Model
{
    use SoftDeletes;
    protected $table = 'provincia';
    protected $dates = ['deleted_at'];

     /**
     * método para obtener las distritos hijas
     * @return [type] [description]
     */
    public function distritos()
	{
		return $this->hasMany('App\Distrito');
	}
}
