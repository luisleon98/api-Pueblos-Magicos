<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;

class TiposImagenesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $tipos = ['back','galeria'];
        foreach ($tipos as $tipo) {
            DB::table('tipos_imagenes')->insert([
                'tipo' => $tipo,
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }
    }
}
