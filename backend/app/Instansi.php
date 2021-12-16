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
    public function paten() {
        return $this->hasMany('App\Paten','instansi_id');
    }
    public function kependudukan() {
        return $this->hasMany('App\Kependudukan','instansi_id');
    }
    public function akta() {
        return $this->hasMany('App\Akta','instansi_id');
    }
    public function bencana() {
        return $this->hasMany('App\Bencana','instansi_id');
    }

    public function informasi () 
    {
        return $this->hasMany('App\Informasi','instansi_id');
    }
}
