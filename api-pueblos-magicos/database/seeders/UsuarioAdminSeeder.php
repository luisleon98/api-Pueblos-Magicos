<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Support\Facades\Hash;

class UsuarioAdminSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('usuarios')->insert([
            'user_name' => 'bajimeneza@ipn.mx',
            'password'=> Hash::make('Pruebas1'),
            'id_tipo_usuario' => 1,
            'created_at' => now(),
            'updated_at' => now(),
        ]);
        DB::table('personas')->insert([
            'nombre' => 'Brayan Angelo',
            'apellido_pat'=> 'Jimenez',
            'apellido_mat'=> 'Amores',
            'id_usuario' => 1,
            'created_at' => now(),
            'updated_at' => now(),
        ]);
    }
}
