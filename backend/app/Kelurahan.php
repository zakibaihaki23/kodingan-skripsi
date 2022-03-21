<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Kelurahan extends Model
{
    protected $fillable = ['instansi_id', 'nama_kelurahan'];
    protected $hidden = ['created_at', 'updated_at'];
    protected $table = 'kelurahan';
}
