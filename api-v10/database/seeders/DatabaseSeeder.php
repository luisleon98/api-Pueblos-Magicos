<?php

namespace Database\Seeders;


// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Database\Seeders\Status;
use Illuminate\Database\Seeder;
use Database\Seeders\StatesSeeder;
use Database\Seeders\TiposServicios;
use Database\Seeders\DireccionesSeeder;
use Database\Seeders\UsuarioAdminSeeder;
use Database\Seeders\TiposImagenesSeeder;
use Database\Seeders\TiposUsuariosSeeder;
use Database\Seeders\PueblosMagicosSeeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // User::factory(10)->create();

        // User::factory()->create([
        //     'name' => 'Test User',
        //     'email' => 'test@example.com',
        // ]);
        $this->call(StatesSeeder::class);
        $this->call(TiposUsuariosSeeder::class);
        $this->call(TiposServicios::class);
        $this->call(DireccionesSeeder::class);
        $this->call(PueblosMagicosSeeder::class);
        $this->call(TiposImagenesSeeder::class);
        $this->call(GenerosSeeder::class);
        $this->call(PaisesSeeder::class);
        $this->call(Status::class);
        $this->call(UsuarioAdminSeeder::class);
        
    }
}
