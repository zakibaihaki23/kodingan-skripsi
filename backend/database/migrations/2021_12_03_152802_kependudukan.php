<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class Kependudukan extends Migration
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
            $table->foreignId('instansi_id');
            $table->string('kelurahan');
            $table->double('jmlh_penduduk_bln_lalu_l')->default(0);
            $table->double('jmlh_penduduk_bln_lalu_p')->default(0);
            $table->double('lahir_l')->default(0);
            $table->double('lahir_p')->default(0);
            $table->double('meninggal_l')->default(0);
            $table->double('meninggal_p')->default(0);
            $table->double('datang_l')->default(0);
            $table->double('datang_p')->default(0);
            $table->double('pindah_l')->default(0);
            $table->double('pindah_p')->default(0);
            $table->double('jmlh_penduduk_bln_ini_l')->default(0);
            $table->double('jmlh_pendudukn_bln_ini_p')->default(0);
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
        Schema::dropIfExists('db_kependudukan');
    }
}
