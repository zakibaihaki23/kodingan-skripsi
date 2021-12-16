<?php

namespace App;


use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Passport\HasApiTokens;


class PBB extends Authenticatable
{
    use HasApiTokens, Notifiable;

    protected $fillable = ['instansi_id', 'kelurahan', 'target_pbb', 'realisasi_bln_lalu', 'realisasi_bln_ini', 'jmlh_realisasi', 'sisa_target', 'keterangan', 'periode'];
    protected $hidden = ['created_at', 'updated_at'];

    protected $table = 'db_realisasi_pbb';

    public function getUpdatedAtAttribute()
    {
        return \Carbon\Carbon::parse($this->attributes['waktu'])
            ->diffForHumans();
    }
}
