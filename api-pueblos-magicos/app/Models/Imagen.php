<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
/**
 * @OA\Schema(
 *     schema="Imagen",
 *     title="Imagen",
 *     description="Modelo para representar Imagenes",
 *     @OA\Property(
 *         property="id",
 *         type="integer",
 *         example=1
 *     ),
 *     @OA\Property(
 *         property="nombre",
 *         type="string",
 *         example="02b09106-4c68-426a-b8aa-d459ef1df8ed.png"
 *     ),
 *     @OA\Property(
 *         property="tipo",
 *         type="integer",
 *         example=1
 *     )
 * )
 */
class Imagen extends Model
{
    use HasFactory;
    protected $table = 'imagenes';
    protected $fillable = [
        'nombre',
        'id_tipo_imagen'
    ];
    public function tipo(){
        return $this->belongsTo(TipoImagen::class,'id_tipo_imagen');
    }
}
