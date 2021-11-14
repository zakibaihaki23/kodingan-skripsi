<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Instansi extends Model
{
    protected $fillable = ['instansi'];
    protected $hidden = ['created_at', 'updated_at', 'role'];
    protected $table = 'instansi';
}
