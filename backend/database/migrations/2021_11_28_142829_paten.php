<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class Paten extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('rekapitulasi_paten', function (Blueprint $table) {
            $table->id();
            $table->foreignId('instansi_id');
            $table->string('kelurahan');
            $table->double('perekaman_ktp')->default(0);
            $table->double('pengantar_kk')->default(0);
            $table->double('ket_pindah')->default(0);
            $table->double('ket_domisili')->default(0);
            $table->double('pengantar_akta_lahir')->default(0);
            $table->double('pengantar_akta_mati')->default(0);
            $table->double('pencatatan_perkawinan')->default(0);
            $table->double('pencatatan_perceraian')->default(0);
            $table->double('skck')->default(0);
            $table->double('sktm')->default(0);
            $table->double('rekomendasi')->default(0);
            $table->double('legalisasi')->default(0);
            $table->double('ket_lain')->default(0);
            $table->double('imb')->default(0);
            $table->double('situ_siup')->default(0);
            $table->double('izin_merobohkan_bangunan')->default(0);
            $table->double('izin_keramaian')->default(0);
            $table->double('izin_partai')->default(0);
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
        Schema::dropIfExists('rekapitulasi_paten');
    }
}
