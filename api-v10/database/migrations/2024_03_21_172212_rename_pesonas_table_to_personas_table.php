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
        Schema::table('pesonas', function (Blueprint $table) {
            Schema::rename('pesonas', 'personas');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('pesonas', function (Blueprint $table) {
            Schema::rename('personas', 'pesonas');
        });
    }
};
