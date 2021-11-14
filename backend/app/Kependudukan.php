<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Laravel\Passport\HasApiTokens;

class Kependudukan extends Model
{
    use HasApiTokens, Notifiable;

    protected $fillable = ['id_instansi', 'id_kelurahan', 'instansi', 'kelurahan', 'jmlh_penduduk_bln_lalu_l', 'kelurahan', 'jmlh_penduduk_bln_lalu_p', 'kelurahan', 'jmlh_penduduk_bln_lalu_l_p', 'lahir_l', 'lahir_p', 'lahir_l_p', 'meninggal_l', 'meninggal_p', 'meninggal_l_p', 'datang_l', 'datang_p', 'datang_l_p', 'pindah_l', 'pindah_p', 'pindah_l_p', 'jmlh_penduduk_bln_ini_l', 'jmlh_penduduk_bln_ini_p', 'jmlh_penduduk_bln_ini_l_p', 'waktu'];
    protected $hidden = ['created_at', 'updated_at'];

    protected $table = 'db_kependudukan';
}
