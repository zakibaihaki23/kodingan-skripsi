<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Akta extends Model
{
    use HasApiTokens, Notifiable;

    protected $fillable = [
        'instansi_id', 'kelurahan', 'periode', 
        'nomor_ppat','tanggal_ppat', 'nama_ppat',
        'npwp','nomor_akta','tanggal_akta','letak_tanah',
        'status_hak','nama_pengalih','nama_peroleh',
        'jenis_perolahan','luas_tanah','luas_bangunan',
        'pbb_nop','pbb_njop','harga_transaksi',
        'sbb_tanggal','sbb_rp','ssp_tanggal','ssp_rp',
        'keterangan','is_verified'];
    protected $hidden = ['created_at', 'updated_at'];

    protected $table = 'db_pembuatan_akta';
}
