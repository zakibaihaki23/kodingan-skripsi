<?php

namespace App;

use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Passport\HasApiTokens;

use Illuminate\Database\Eloquent\Model;

class User extends Authenticatable
{
    use HasApiTokens, Notifiable;

    protected $fillable = ['id_instansi', 'name', 'username', 'email', 'password', 'instansi', 'role'];
    protected $hidden = ['password', 'created_at', 'updated_at'];

    protected $table = 'users';

    function persons()
    {
        return $this->hasMany('App\Person', 'creator_id');
    }
}
