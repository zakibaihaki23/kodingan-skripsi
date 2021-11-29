<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Instansi extends Model
{
    protected $fillable = ['nama_instansi','pimpinan', 'lat','lng'];
    protected $hidden = ['created_at', 'updated_at'];
    protected $table = 'instansi';

    public function kelurahan () 
    {
        return $this->hasMany('App\Kelurahan','instansi_id');
    }


    public function pbb() {
        return $this->hasMany('App\PBB','instansi_id');
    }

    public function informasi () 
    {
        return $this->hasMany('App\Informasi','instansi_id');
    }
}
