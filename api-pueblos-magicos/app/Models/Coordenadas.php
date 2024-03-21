<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
/**
 * @OA\Schema(
 *     schema="Coordenadas",
 *     title="Coordenadas",
 *     description="Modelo para representar Coordenadas",
 *     @OA\Property(
 *         property="id",
 *         type="integer",
 *         example=1
 *     ),
 *     @OA\Property(
 *         property="longitud",
 *         type="string",
 *         example="L-V"
 *     ),
 *     @OA\Property(
 *         property="latitud",
 *         type="string",
 *         example="9:00-16:00"
 *     )
 * )
 */
class Coordenadas extends Model
{
    use HasFactory;
    protected $table = 'coordenadas';
    protected $fillable = [
        'longitud',
        'latitud',
    ];
}
