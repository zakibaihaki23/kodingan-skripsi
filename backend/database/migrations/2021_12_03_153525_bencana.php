<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class Bencana extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('db_bencana_alam', function (Blueprint $table) {
            $table->id();
            $table->foreignId('instansi_id');
            $table->string('kelurahan');
            $table->double('jmlh_kk')->default(0);
            $table->double('jmlh_jiwa')->default(0);
            $table->double('rumah_rusak_berat')->default(0);
            $table->double('rumah_rusak_sedang')->default(0);
            $table->double('rumah_rusak_ringan')->default(0);
            $table->double('kantor_rusak_berat')->default(0);
            $table->double('kantor_rusak_sedang')->default(0);
            $table->double('kantor_rusak_ringan')->default(0);
            $table->double('pendidikan_rusak_berat')->default(0);
            $table->double('pendidikan_rusak_sedang')->default(0);
            $table->double('pendidikan_rusak_ringan')->default(0);
            $table->double('ibadah_rusak_berat')->default(0);
            $table->double('ibadah_rusak_sedang')->default(0);
            $table->double('ibadah_rusak_ringan')->default(0);
            $table->double('jembatan_rusak_berat')->default(0);
            $table->double('jembatan_rusak_sedang')->default(0);
            $table->double('jembatan_rusak_ringan')->default(0);
            $table->double('lainnya_rusak_berat')->default(0);
            $table->double('lainnya_rusak_sedang')->default(0);
            $table->double('lainnya_rusak_ringan')->default(0);
            $table->double('korban_menderita')->default(0);
            $table->double('korban_luka')->default(0);
            $table->double('korban_meninggal')->default(0);
            $table->string('kerugian')->default(0);
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
        // Schema::dropIfExists('db_bencana_alam');
    }
}
