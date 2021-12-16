<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Laravel\Passport\HasApiTokens;

class Paten extends Model
{
    use HasApiTokens, Notifiable;
    protected $fillable = [
        'instansi_id','kelurahan', 'perekaman_ktp',
        'pengantar_kk', 'ket_pindah','ket_domisili',
        'pengantar_akta_lahir','pengantar_akta_mati',
        'pencatatan_perkawinan','pencatatan_perceraian',
        'skck','sktm','rekomendasi','legalisasi','ket_lain',
        'imb','situ_siup','izin_merobohkan_bangunan',
        'izin_keramaian','izin_partai','keterangan','periode'
    ];
    protected $hidden = ['created_at', 'updated_at'];

    protected $table = 'db_rekapitulasi_paten';
}
