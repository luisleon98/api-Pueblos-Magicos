<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
/**
 * @OA\Schema(
 *     schema="TipoImagen",
 *     title="TipoImagen",
 *     description="Modelo para representar TipoImagen",
 *     @OA\Property(
 *         property="id",
 *         type="integer",
 *         example=1
 *     ),
 *     @OA\Property(
 *         property="tipo",
 *         type="string",
 *         example="Administrador"
 *     )
 * )
 */
class TipoImagen extends Model
{
    use HasFactory;
    protected $table = 'tipos_imagenes';
    protected $fillable = [
        'tipo',
    ];
}
