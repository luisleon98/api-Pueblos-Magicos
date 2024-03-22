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
        Schema::table('servicio_detalles', function (Blueprint $table) {
            $table->foreignId('id_horarios')->constrained('horarios','id');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('servicio_detalles', function (Blueprint $table) {
            $table->dropForeign('servicio_detalles_id_horarios_foreign');
        });
    }
};
