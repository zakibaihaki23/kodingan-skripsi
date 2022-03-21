<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Laravel\Passport\HasApiTokens;


class Imunisasi extends Model
{
    use HasApiTokens, Notifiable;

    protected $fillable = [
        'instansi_id', 'kelurahan', 
         'periode', 'bcg',
         'dpt_1','dpt_2','dpt_3',
         'polio_1','polio_2','polio_3','polio_4',
         'cmp','ibu_hamil_1','ibu_hamil_2',
         'anak_sd_1','anak_sd_2',
         'cp_1','cp_2',
         'keterangan', 'is_verified'];
    protected $hidden = ['created_at', 'updated_at'];

    protected $table = 'db_imunisasi';
}
