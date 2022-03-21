<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Laravel\Passport\HasApiTokens;

class Bencana extends Model
{
    use HasApiTokens, Notifiable;

    protected $fillable = [
        'instansi_id', 'kelurahan', 
         'periode', 'jmlh_kk', 'jmlh_jiwa',
         'rumah_rusak_berat', 'rumah_rusak_sedang',
         'rumah_rusak_ringan','kantor_rusak_berat',
         'kantor_rusak_sedang', 'kantor_rusak_ringan',
         'pendidikan_rusak_berat','pendidikan_rusak_sedang',
         'pendidikan_rusak_ringan','ibadah_rusak_berat',
         'ibadah_rusak_sedang','ibadah_rusak_ringan',
         'jembatan_rusak_berat','jembatan_rusak_sedang',
         'jembatan_rusak_ringan','lainnya_rusak_berat',
         'lainnya_rusak_sedang','lainnya_rusak_ringan',
         'korban_menderita', 'korban_luka','korban_meninggal',
         'kerugian','is_verified'];
    protected $hidden = ['created_at', 'updated_at'];

    protected $table = 'db_bencana_alam';
}
