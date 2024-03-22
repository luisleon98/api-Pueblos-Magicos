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
        Schema::create('festividades_imagenes', function (Blueprint $table) {
            $table->id();
            $table->foreignId('id_festividad')->constrained('festividades','id');
            $table->foreignId('id_imagen')->constrained('imagenes','id');
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('festividades_imagenes');
    }
};
