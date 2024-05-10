<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;
/**
 * @OA\Schema(
 *     schema="FestividadesImagenes",
 *     title="FestividadesImagenes",
 *     description="Modelo para representar las Imágenes de las Festividades",
 *     @OA\Property(
 *         property="id_servicio",
 *         type="integer",
 *         example=1
 *     ),
 *     @OA\Property(
 *         property="id_imagen",
 *         type="integer",
 *         example=1
 *     ),
 * )
 */
class FestividadesImagenes extends Model
{
    use HasFactory,SoftDeletes;
    protected $table = 'festividades_imagenes';
    protected $fillable = [
        'id_servicio',
        'id_imagen'
    ];
}
