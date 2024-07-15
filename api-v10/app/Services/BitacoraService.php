<?php

namespace App\Services;

use App\Models\Bitacora;

class BitacoraService
{
    public function registrar(array $datos)
    {
        return Bitacora::create([
            'movimiento' => $datos['movimiento'],
            'tabla_afectada' => $datos['tabla_afectada'],
            'id_registro_afectado' => $datos['id_registro_afectado'],
            'id_usuario' => $datos['id_usuario']
        ]);
    }
}