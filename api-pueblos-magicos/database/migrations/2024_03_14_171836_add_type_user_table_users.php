<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('users',function(Blueprint $table){
            // $table->unsignedBigInteger('tipo_user');
            // $table->foreignId('tipo_user')->references('id')->on('tipo_users');
            // $table->unsignedBigInteger('id_estado');
            // $table->foreign('id_estado')->references('id')->on('states');
            $table->foreignId("id_tipo_user")->constrained('tipo_users','id');
            $table->foreignId("id_estado")->constrained('states','id');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('users',function(Blueprint $table){
            $table->dropForeign(['id_tipo_user','id_estado']);
        });
    }
};
