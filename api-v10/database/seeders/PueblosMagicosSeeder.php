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
        ['nombre' => 'Cuetzalan', 'year' => 2002],
        ['nombre' => 'Zacatlán', 'year' => 2011],
        ['nombre' => 'Pahuatlán', 'year' => 2012],
        ['nombre' => 'Cholula', 'year' => 2012],
        ['nombre' => 'Chignahuapan', 'year' => 2012],
        ['nombre' => 'Tlatlauquitepec', 'year' => 2012],
        ['nombre' => 'Xicotepec', 'year' => 2012],
        ['nombre' => 'Atlixco', 'year' => 2015],
        ['nombre' => 'Huauchinango', 'year' => 2015],
        ['nombre' => 'Tetela de Ocampo', 'year' => 2020],
        ['nombre' => 'Huejotzingo', 'year' => 2023],
        ['nombre' => 'Teziutlán', 'year' => 2023],
    ];

    foreach ($pueblos as $index => $pueblo) {
        DB::table('pueblos_magicos')->insert([
            'nombre' => $pueblo['nombre'],
            'descripcion' => '',
            'id_direccion' => $index + 1,
            'year' => $pueblo['year'],
            'created_at' => now(),
            'updated_at' => now(),
        ]);
    }
}
}
