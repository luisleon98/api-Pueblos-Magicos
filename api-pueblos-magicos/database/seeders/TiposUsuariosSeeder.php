<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;

class TiposUsuariosSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $tipos = ['Admin_Systema', 'Director_Pueblos_Magicos', 'Hotelero', 'Restaurantero', 'Pueblo_Magico', 'Turista'];
        foreach ($tipos as $tipo) {
            DB::table('tipos_usuarios')->insert([
                'tipo_usuario' => $tipo,
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }
    }
}
