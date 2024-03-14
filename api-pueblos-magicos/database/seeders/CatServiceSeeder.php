<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;

class CatServiceSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $tipoS = ['Hospedaje','Gastronomia','Tours','Sitios Interes','Festividades','Cerca de Usded'];
        foreach ($tipoS as $service) {
            DB::table('categoria_servicios')->insert([
                'nombre' => $service
            ]);
    }
    }
}
