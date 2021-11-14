<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateKependudukansTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('db_kependudukan', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('id_instansi');
            $table->unsignedBigInteger('id_kelurahan');
            $table->string('instansi');
            $table->string('kelurahan');
            $table->bigInteger('jmlh_penduduk_bln_lalu_l');
            $table->bigInteger('jmlh_penduduk_bln_lalu_p');
            $table->bigInteger('jmlh_penduduk_bln_lalu_l_p');
            $table->bigInteger('lahir_l');
            $table->bigInteger('lahir_p');
            $table->bigInteger('lahir_l_p');
            $table->bigInteger('meninggal_l');
            $table->bigInteger('meninggal_p');
            $table->bigInteger('meninggal_l_p');
            $table->bigInteger('datang_l');
            $table->bigInteger('datang_p');
            $table->bigInteger('datang_l_p');
            $table->bigInteger('pindah_l');
            $table->bigInteger('pindah_p');
            $table->bigInteger('pindah_l_p');
            $table->bigInteger('jmlh_penduduk_bln_ini_l');
            $table->bigInteger('jmlh_penduduk_bln_ini_p');
            $table->bigInteger('jmlh_penduduk_bln_ini_l_p');
            $table->date('waktu');
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
        Schema::dropIfExists('db_kependudukan');
    }
}
