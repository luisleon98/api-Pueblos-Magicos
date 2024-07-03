<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;

class GenerosSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $generos = ['Masculino','Femenino','Otro','Prefiero no decirlo'];
        foreach ($generos as $genero) {
            DB::table('generos')->insert([
                'genero' => $genero[0],
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }
    }
}
