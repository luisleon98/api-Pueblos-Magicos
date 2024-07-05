<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;

class PueblosMagicosSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $pueblos = [
            ['nombre' => 'Cuetzalan', 'year' => 2002, 'nombre_clima' => 'Cuetzalan'],
            ['nombre' => 'Zacatlán', 'year' => 2011, 'nombre_clima' => 'Zacatlan'],
            ['nombre' => 'Pahuatlán', 'year' => 2012, 'nombre_clima' => 'Pahuatlan de Valle'],
            ['nombre' => 'Cholula', 'year' => 2012, 'nombre_clima' => 'Cholula'],
            ['nombre' => 'Chignahuapan', 'year' => 2012, 'nombre_clima' => 'Chignahuapan'],
            ['nombre' => 'Tlatlauquitepec', 'year' => 2012, 'nombre_clima' => 'Tlatlauquitepec'],
            ['nombre' => 'Xicotepec', 'year' => 2012, 'nombre_clima' => 'Xicotepec de juarez'],
            ['nombre' => 'Atlixco', 'year' => 2015, 'nombre_clima' => 'Atlixco'],
            ['nombre' => 'Huauchinango', 'year' => 2015, 'nombre_clima' => 'Huauchinango'],
            ['nombre' => 'Tetela de Ocampo', 'year' => 2020, 'nombre_clima' => 'Tetela de Ocampo'],
            ['nombre' => 'Huejotzingo', 'year' => 2023, 'nombre_clima' => 'Huejotzingo'],
            ['nombre' => 'Teziutlán', 'year' => 2023, 'nombre_clima' => 'Teziutlan'],
        ];

        foreach ($pueblos as $index => $pueblo) {
            DB::table('pueblos_magicos')->insert([
                'nombre' => $pueblo['nombre'],
                'descripcion' => '',
                'nombre_clima' => $pueblo['nombre_clima'],
                'id_direccion' => $index + 1,
                'year' => $pueblo['year'],
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }
    }
}
