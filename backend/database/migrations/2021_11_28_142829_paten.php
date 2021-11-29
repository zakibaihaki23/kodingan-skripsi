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
            $table->foreignId('kecamatan_id');
            $table->string('kelurahan');
            $table->double('perekaman_ktp');
            $table->double('pengantar_kk');
            $table->double('ket_pindah');
            $table->double('ket_domisili');
            $table->double('pengantar_akta_lahir');
            $table->double('pengantar_akta_mati');
            $table->double('pencatatan_perkawinan');
            $table->double('pencatatan_perceraian');
            $table->double('skck');
            $table->double('sktm');
            $table->double('rekomendasi');
            $table->double('legalisasi');
            $table->double('ket_lain');
            $table->double('imb');
            $table->double('situ_siup');
            $table->double('izin_merobohkan_bangunan');
            $table->double('izin_keramaian');
            $table->double('izin_partai');
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
        // Schema::dropIfExists('rekapitulasi_paten');
    }
}
