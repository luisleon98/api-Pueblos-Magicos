<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;
/**
 * @OA\Schema(
 *     schema="Observaciones",
 *     title="Observaciones",
 *     description="Modelo para representar observaciones realizadas a un servicio",
 *     @OA\Property(
 *         property="id",
 *         type="integer",
 *         example=1
 *     ),
 *     @OA\Property(
 *         property="id_servicio",
 *         type="integer",
 *         example=5
 *     ),
 *     @OA\Property(
 *         property="id_estatus",
 *         type="integer",
 *         example=3
 *     ),
 *     @OA\Property(
 *         property="observacion",
 *         type="string",
 *         example="Esta es una observación de ejemplo."
 *     ),
 *     @OA\Property(
 *         property="id_usuario",
 *         type="integer",
 *         example=10
 *     )
 * )
 */
class Observaciones extends Model
{
    use HasFactory,SoftDeletes;
    protected $table = 'observaciones';
    protected $fillable = [
        'id_servicio',
        'id_estatus',
        'observacion',
        'id_usuario'
    ];
}
