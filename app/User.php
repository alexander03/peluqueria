<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Database\Eloquent\SoftDeletes;

class User extends Authenticatable
{
    use Notifiable;
    use SoftDeletes;
    protected $table = 'user';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'empresa_id','login', 'password', 'state',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    public function scopelistar($query, $login)
    {
        return $query->where(function($subquery) use($login)
                    {
                        if (!is_null($login)) {
                            $subquery->where('login', 'LIKE', '%'.$login.'%');
                        }
                    })
                    ->orderBy('login', 'ASC');
    }

    public function usertype()
    {
        return $this->belongsTo('App\Usertype', 'usertype_id');
    }

    public function persona(){
        return $this->belongsTo('App\Persona', 'persona_id');
    }
}
