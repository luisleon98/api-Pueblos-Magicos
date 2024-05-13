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
        $pueblos = ['Cholula','Atlixco','Tetela de Ocampo','Zacatlán','Xicotepec','Tlatlauquitepec','Pahuatlán','Huachinango','Chignahuapan','Cuetzalan'];
        foreach ($pueblos as $index => $pueblo) {
            DB::table('pueblos_magicos')->insert([
                'nombre' => $pueblo,
                'descripcion' => '',
                'id_direccion' => $index + 1,
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }
    }
}
