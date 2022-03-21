<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class Informasi extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('db_informasi', function (Blueprint $table) {
            $table->id();
            $table->foreignId('instansi_id')->default(0);
            $table->string('informasi');
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
        // Schema::dropIfExists('db_informasi');
    }
}
