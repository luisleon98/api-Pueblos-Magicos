<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;

class DireccionesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $direcciones = [
            ['Av. 4 Ote. 1', 'Residencial el Refugio de San Miguel', 72764, 'SN', 'SN', 21, 'Cholula de Rivadavia'],
            ['Libertad 416', 'Centro', 74200, 'SN', 'SN', 21, 'Atlixco'],
            ['Calle 3 Ote. 2', 'Centro', 73640, 'SN', 'SN', 21, 'Cdad. de Tetela de Ocampo'],
            ['J. Ma. Morelos 12', 'Centro', 73310, 'SN', 'SN', 21, 'Zacatlán'],
            ['Allende 102', 'Col Centro', 73080, 'SN', 'SN', 21, 'Xicotepec de Juárez'],
            ['Av. Revolución 43', 'Centro', 73900, 'SN', 'SN', 21, 'Cdad. de Tlatlauquitepec'],
            ['Pahuatlán', 'Pahuatlán', 73100, 'SN', 'SN', 21, 'Pahuatlán'],
            ['Centro', 'Centro', 73170, 'SN', 'SN', 21, 'Huauchinango'],
            ['Chignahuapan', 'Chignahuapan', 73300, 'SN', 'SN', 21, 'Chignahuapan'],
            ['Centenario 3-9', 'Centro', 73560, 'SN', 'SN', 21, 'Cdad. de Cuetzalan']
        ];

        foreach ($direcciones as $direccion) {
            DB::table('direcciones')->insert([
                'calle' => $direccion[0],
                'municipio' => $direccion[1],
                'CP' => $direccion[2],
                'int' => $direccion[3],
                'ext' => $direccion[4],
                'id_estado' => $direccion[5],
                'colonia' => $direccion[6],
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }
    }
}
