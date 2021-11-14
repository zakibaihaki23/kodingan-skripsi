<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAdminsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('admin', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('id_instansi');
            $table->string('name');
            $table->string('username');
            $table->string('email');
            $table->string('password');
            $table->string('instansi');
            $table->enum('role', ['Admin', 'User'])->default('Admin');
            $table->timestamps();

            $table->foreign('id_instansi')->references('id')->on('instansi')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('admin');
    }
}
