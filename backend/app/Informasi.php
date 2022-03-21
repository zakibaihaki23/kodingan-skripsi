<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Laravel\Passport\HasApiTokens;

class Informasi extends Model
{
    use HasApiTokens, Notifiable;

    protected $fillable = ['instansi_id','informasi','waktu'];
    protected $hidden = ['created_at', 'updated_at'];

    protected $table = 'db_informasi';
}
