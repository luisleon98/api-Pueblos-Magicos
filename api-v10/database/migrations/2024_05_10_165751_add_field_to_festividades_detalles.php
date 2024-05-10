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
        Schema::table('festividades', function (Blueprint $table) {
            $table->foreignId('id_estatus')->constrained('estatus','id');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('festividades', function (Blueprint $table) {
            $table->dropForeign('servicios_id_estatus_foreign');
        });
    }
};
