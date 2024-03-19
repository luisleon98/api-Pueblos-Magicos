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
        Schema::create('servicios', function (Blueprint $table) {
            $table->id();
            $table->foreignId("id_tipo_servicio")->constrained('tipos_servicios','id');
            $table->foreignId('id_direccion')->constrained('direcciones','id');
            $table->foreignId('id_usuario')->constrained('usuarios','id');
            $table->foreignId('id_pueblo')->constrained('pueblos_magicos','id');
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('servicios');
    }
};
