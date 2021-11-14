<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Paten extends Model
{
    protected $fillable = [
        'id_instansi', 'id_kelurahan',
        'instansi', 'kelurahan',
        'perekaman_ktp', 'pengantar_kk',
        'ket_pindah', 'ket_domisili',
        'pengantar_akta_lahir', 'pencatatan_lahir_mati',
        'pencatatan_perkawinan', 'pencatatan_perceraian',
        'skck', 'sktm',
        'rekomendasi', 'legalisasi',
        'ket_lain', 'imb',
        'situ_siup', 'merobohkan_bangunan',
        'izin_keramaian', 'izin_partai',
        'keterangan'
    ];
    protected $hidden = ['created_at', 'updated_at'];

    protected $table = 'db_paten';
}
