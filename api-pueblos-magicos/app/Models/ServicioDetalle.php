<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
/**
 * @OA\Schema(
 *     schema="ServicioDetalle",
 *     title="ServicioDetalle",
 *     description="Modelo para representar ServicioDetalle",
 *     @OA\Property(
 *         property="id",
 *         type="integer",
 *         example=1
 *     ),
 *     @OA\Property(
 *         property="dias_servicio",
 *         type="string",
 *         example="L-V"
 *     ),
 *     @OA\Property(
 *         property="horarios",
 *         type="string",
 *         example="9:00-16:00"
 *     ),
 *     @OA\Property(
 *         property="titulo",
 *         type="string",
 *         example="9:00-16:00"
 *     ),
 *     @OA\Property(
 *         property="descripcion",
 *         type="string",
 *         example="9:00-16:00"
 *     ),
 *     @OA\Property(
 *         property="id_coordenadas",
 *         type="integer",
 *         example=1
 *     ),
 * *     @OA\Property(
 *         property="id_servicio",
 *         type="integer",
 *         example=1
 *     ),
 * )
 */
class ServicioDetalle extends Model
{
    use HasFactory;
    protected $table = 'servicio_detalles';
    protected $fillable = [
        'dias_servicio',
        'horarios',
        'precios',
        'titulo',
        'descripcion',
        'id_coordenadas',
        'id_servicio'
    ];
    public function servicio()
    {
        return $this->belongsTo(Servicios::class, 'id_servicio');
    }
    public function coordenada()
    {
        return $this->belongsTo(Coordenadas::class, 'id_servicio');
    }
}
