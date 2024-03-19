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
        Schema::create('festividades_detalles', function (Blueprint $table) {
            $table->id();
            $table->string("dias_servicio");
            $table->string('horarios');
            $table->string('precios');
            $table->string('nombre');
            $table->string("descripcion");
            $table->foreignId("id_coordenadas")->constrained('coordenadas','id');
            $table->foreignId("id_servicio")->constrained('servicios','id');
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('festividades_detalles');
    }
};
