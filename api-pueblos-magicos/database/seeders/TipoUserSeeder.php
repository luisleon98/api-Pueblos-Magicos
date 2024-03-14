<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;

class TipoUserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $tipoU = ['Administrador del Sistema','Adminsitrador de Pueblos magicos','Hotelero','Restaurantero'];
        foreach ($tipoU as $user) {
            DB::table('tipo_users')->insert([
                'nombre' => $user
            ]);
    }
    }
}
