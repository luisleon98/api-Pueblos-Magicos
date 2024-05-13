<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;
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
    use HasFactory,SoftDeletes;
    protected $table = 'imagenes';
    protected $fillable = [
        'nombre',
        'id_tipo_imagen'
    ];
    public function tipo(){
        return $this->belongsTo(TipoImagen::class,'id_tipo_imagen');
    }
    public function servicio()
    {
        return $this->hasOneThrough(
            Servicios::class,
            ServiciosImagen::class,
            'id_imagen', // Llave foránea en la tabla intermedia
            'id', // Llave foránea en la tabla final
            'id', // Llave local en la tabla inicial
            'id_servicio' // Llave local en la tabla intermedia
        );
    }
}
