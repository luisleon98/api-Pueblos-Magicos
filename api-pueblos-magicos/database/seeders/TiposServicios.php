<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;

class TiposServicios extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $tipos = ['Hospedaje', 'Gasto', 'Tours', 'Sitios', 'Festividades', 'Cerca de ustedes'];
        foreach ($tipos as $tipo) {
            DB::table('tipos_servicios')->insert([
                'servicio' => $tipo,
                'estatus'=> true,
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }
    }
}
