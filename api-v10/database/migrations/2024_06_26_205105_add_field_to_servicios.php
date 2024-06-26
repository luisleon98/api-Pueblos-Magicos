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
            $table->string('pagina_web');
            $table->string('telefono');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('servicio_detalles', function (Blueprint $table) {
            $table->dropColumn('pagina_web');
            $table->dropColumn('telefono');
        });
    }
};
