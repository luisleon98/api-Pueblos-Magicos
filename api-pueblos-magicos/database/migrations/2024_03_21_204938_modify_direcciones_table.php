<?php

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('direcciones', function (Blueprint $table) {
            Schema::table('direcciones', function (Blueprint $table) {
                $table->string('int')->change(); // Cambia 'int' de integer a string
                $table->string('ext')->default('SN')->change(); // Cambia 'ext' de integer a string
                $table->string('colonia'); // Agrega el nuevo campo 'colonia'
            });
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        DB::statement('ALTER TABLE direcciones ALTER COLUMN int TYPE integer USING (int::integer)');
    DB::statement('ALTER TABLE direcciones ALTER COLUMN ext DROP DEFAULT');
    DB::statement('ALTER TABLE direcciones ALTER COLUMN ext TYPE integer USING (ext::integer)');
    DB::statement('ALTER TABLE direcciones ALTER COLUMN ext SET DEFAULT 0');
    Schema::table('direcciones', function (Blueprint $table) {
        $table->dropColumn('colonia'); // Elimina el campo 'colonia'
    });
    }
};
