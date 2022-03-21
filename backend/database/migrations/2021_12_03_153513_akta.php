<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class Akta extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('db_pembuatan_akta', function (Blueprint $table) {
            $table->id();
            $table->foreignId('instansi_id');
            $table->string('nomor_ppat');
            $table->date('tanggal_ppat');
            $table->string('nama_ppat');
            $table->string('npwp');
            $table->string('nomor_akta');
            $table->string('tanggal_akta');
            $table->string('letak_tanah');
            $table->string('status_hak');
            $table->string('nama_pengalih');
            $table->string('nama_peroleh');
            $table->string('jenis_perolahan');
            $table->string('luas_tanah');
            $table->string('luas_bangunan');
            $table->string('pbb_nop');
            $table->string('pbb_njop');
            $table->string('harga_transaksi');
            $table->string('sbb_tanggal');
            $table->string('sbb_rp');
            $table->string('ssp_tanggal');
            $table->string('ssp_rp');
            $table->string('keterangan');
            $table->date('periode');
            $table->double('is_verified')->default(0);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        // Schema::dropIfExists('db_pembuatan_akta');
    }
}
