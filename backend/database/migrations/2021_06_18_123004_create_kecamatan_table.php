<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateKecamatanTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        // Schema::create('instansi', function (Blueprint $table) {
        //     $table->id();
        //     $table->string('nama_instansi');
        //     $table->string('pimpinan');
        //     $table->float('lat' ,10,6);
        //     $table->float('long', 10,6);
        //     $table->enum('instansi', ['Kecamatan', 'Pemkab'])->default('Kecamatan');
        //     $table->timestamps();
        // });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        // Schema::dropIfExists('instansi');
    }
}
