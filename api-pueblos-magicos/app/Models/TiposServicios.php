<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
/**
 * @OA\Schema(
 *     schema="Tipo_Servicios",
 *     title="Tipo_Servicios",
 *     description="Modelo para representar Tipo_Servicios",
 *     @OA\Property(
 *         property="id",
 *         type="integer",
 *         example=1
 *     ),
 *     @OA\Property(
 *         property="servicio",
 *         type="string",
 *         example="Administrador"
 *     )
 * ,
 *     @OA\Property(
 *         property="esttatus",
 *         type="bool",
 *         example="true"
 *     )
 * )
 */
class TiposServicios extends Model
{
    use HasFactory;
    protected $table = 'tipos_servicios';
    protected $fillable = [
        'servicio',
        'estatus'
    ];
}
