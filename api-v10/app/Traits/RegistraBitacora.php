<?php

namespace App\Traits;

use App\Services\BitacoraService;

trait RegistraBitacora
{
    public function registrarEnBitacora(array $datos)
    {
        app(BitacoraService::class)->registrar($datos);
    }
}