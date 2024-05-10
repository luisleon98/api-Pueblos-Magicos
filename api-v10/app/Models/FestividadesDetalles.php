<?php

namespace App\Models;

use App\Models\Horarios;
use App\Models\Coordenadas;
use App\Models\Festividades;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;
/**
 * @OA\Schema(
 *     schema="FestividadesDetalles",
 *     title="FestividadesDetalles",
 *     description="Modelo para representar los detalles de las Festividades",
 *     @OA\Property(
 *         property="dias_servicio",
 *         type="string",
 *         example="Lunes a Viernes"
 *     ),
 *     @OA\Property(
 *         property="precios",
 *         type="string",
 *         example="100-200"
 *     ),
 *     @OA\Property(
 *         property="titulo",
 *         type="string",
 *         example="Fiesta de la Primavera"
 *     ),
 *     @OA\Property(
 *         property="descripcion",
 *         type="string",
 *         example="Una descripción detallada de la festividad"
 *     ),
 *     @OA\Property(
 *         property="id_coordenadas",
 *         type="integer",
 *         example=1
 *     ),
 *     @OA\Property(
 *         property="id_festividad",
 *         type="integer",
 *         example=1
 *     ),
 *     @OA\Property(
 *         property="id_horarios",
 *         type="integer",
 *         example=1
 *     ),
 * )
 */
class FestividadesDetalles extends Model
{
    use HasFactory,SoftDeletes;
    protected $table = 'festividades_detalles';
    protected $fillable = [
        'dias_servicio',
        'precios',
        'titulo',
        'descripcion',
        'id_coordenadas',
        'id_festividad',
        'id_horarios'
    ];
    public function festividad()
    {
        return $this->belongsTo(Festividades::class, 'id_servicio');
    }
    public function coordenada()
    {
        return $this->belongsTo(Coordenadas::class, 'id_coordenadas');
    }
    public function horario(){
        return $this->belongsTo(Horarios::class,'id_horarios');
    }
    public static function boot()
    {
        parent::boot();

        static::deleting(function($detalle) {
            // Eliminar la coordenada asociada
            $detalle->coordenada()->delete();
            // Eliminar el horario asociado
            $detalle->horario()->delete();
        });
    }
}
