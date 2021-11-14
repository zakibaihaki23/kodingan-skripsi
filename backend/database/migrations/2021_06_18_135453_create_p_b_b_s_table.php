<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePBBSTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('db_realisasi_pbb', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('id_instansi');
            $table->unsignedBigInteger('id_kelurahan');
            $table->string('kecamatan');
            $table->string('kelurahan');
            $table->double('target_pbb');
            $table->double('realisasi_bln_lalu');
            $table->double('realisasi_bln_ini');
            $table->double('jmlh_realisasi');
            $table->double('sisa_target');
            $table->string('keterangan');
            $table->date('waktu');
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
        Schema::dropIfExists('db_realisasi_pbb');
    }
}
