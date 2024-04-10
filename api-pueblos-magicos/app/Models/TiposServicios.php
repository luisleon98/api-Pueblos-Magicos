<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

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
 *         property="estatus",
 *         type="bool",
 *         example="true"
 *     )
 * )
 */
class TiposServicios extends Model
{
    use HasFactory,SoftDeletes;
    protected $table = 'tipos_servicios';
    protected $fillable = [
        'servicio',
        'estatus'
    ];
}
