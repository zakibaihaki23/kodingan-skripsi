<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Kelurahan extends Model
{
    protected $fillable = ['id_instansi', 'kelurahan'];
    protected $hidden = ['created_at', 'updated_at'];
    protected $table = 'kelurahan';
}
