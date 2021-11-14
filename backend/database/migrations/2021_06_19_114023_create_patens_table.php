<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePatensTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('db_paten', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('id_instansi');
            $table->unsignedBigInteger('id_kelurahan');
            $table->string('instansi');
            $table->string('kelurahan');
            $table->bigInteger('perekaman_ktp');
            $table->bigInteger('pengantar_kk');
            $table->bigInteger('ket_pindah');
            $table->bigInteger('ket_domisili');
            $table->bigInteger('pengantar_akta_lahir');
            $table->bigInteger('pencatatan_lahir_mati');
            $table->bigInteger('pencatatan_perkawinan');
            $table->bigInteger('pencatatan_perceraian');
            $table->bigInteger('skck');
            $table->bigInteger('sktm');
            $table->bigInteger('rekomendasi');
            $table->bigInteger('legalisasi');
            $table->string('ket_lain');
            $table->bigInteger('imb');
            $table->bigInteger('situ_siup');
            $table->bigInteger('merobohkan_bangunan');
            $table->bigInteger('izin_keramaian');
            $table->bigInteger('izin_partai');
            $table->string('keterangan');
            $table->timestamps();

            $table->foreign('id_instansi')->references('id')->on('instansi')->onDelete('cascade');
            $table->foreign('id_kelurahan')->references('id')->on('kelurahan')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('db_paten');
    }
}
