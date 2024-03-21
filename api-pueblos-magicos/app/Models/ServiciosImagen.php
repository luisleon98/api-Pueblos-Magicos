<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

/**
 * @OA\Schema(
 *     schema="ServiciosImagen",
 *     title="ServiciosImagen",
 *     description="Modelo para representar ServiciosImagen",
 *     @OA\Property(
 *         property="id_servicio",
 *         type="integer",
 *         example=1
 *     ),
 *      @OA\Property(
 *         property="id_imagen",
 *         type="integer",
 *         example=1
 *     ),
 * )
 */
class ServiciosImagen extends Model
{
    use HasFactory;
    protected $table = 'servicios_imagenes';
    protected $fillable = [
        'id_servicio',
        'id_imagen'
    ];
}
