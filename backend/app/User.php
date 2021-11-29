<?php

namespace App;

use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Passport\HasApiTokens;

use Illuminate\Database\Eloquent\Model;

class User extends Authenticatable
{
    use HasApiTokens, Notifiable;

    protected $fillable = ['instansi_id', 'name', 'username', 'email', 'password', 'role'];
    protected $hidden = ['password', 'created_at', 'updated_at','pimpinan','lat','lng','instansi'];

    protected $table = 'users';

    public function instansi()
    {
        return $this->hasMany('App\Instansi','instansi_id');
    }

}
