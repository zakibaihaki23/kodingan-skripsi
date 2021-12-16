<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Laravel\Passport\HasApiTokens;

class Kependudukan extends Model
{
    use HasApiTokens, Notifiable;

    protected $fillable = [
        'instansi_id', 'kelurahan', 
        'jmlh_penduduk_bln_lalu_l', 'jmlh_penduduk_bln_lalu_p', 'total_penduduk_bln_lalu', 
        'lahir_l', 'lahir_p', 'total_lahir',
        'meninggal_l', 'meninggal_p',  'total_meninggal',
        'datang_l', 'datang_p', 'total_datang',
        'pindah_l', 'pindah_p', 'total_pindah',
        'jmlh_penduduk_bln_ini_l', 'jmlh_penduduk_bln_ini_p', 'total_penduduk_bln_ini', 'periode', 'is_verified'];
    protected $hidden = ['created_at', 'updated_at'];

    protected $table = 'db_kependudukan';
}
