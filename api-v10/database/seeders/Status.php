<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;

class Status extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $estados = ['En Validación','Aceptado','Con Observaciones','Inactivo','En Revisión','Atendidas','Activo'];
        foreach ($estados as  $estado) {
            DB::table('estatus')->insert([
                'estado' => $estado,
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }
    }
}
