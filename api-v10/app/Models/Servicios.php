<?php

namespace App\Models;

use Database\Seeders\Status;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;
/**
 * @OA\Schema(
 *     schema="Servicios",
 *     title="Servicios",
 *     description="Modelo para representar Servicios",
 *     @OA\Property(
 *         property="id",
 *         type="integer",
 *         example=1
 *     ),
 * *     @OA\Property(
 *         property="id_tipo_servicio",
 *         type="integer",
 *         example=1
 *     ),
 * *     @OA\Property(
 *         property="id_direccion",
 *         type="integer",
 *         example=1
 *     ),
 * *     @OA\Property(
 *         property="id_usuario",
 *         type="integer",
 *         example=1
 *     ),
 * *     @OA\Property(
 *         property="id_pueblo",
 *         type="integer",
 *         example=1
 *     ),
 * )
 */
class Servicios extends Model
{
    use HasFactory,SoftDeletes;

    protected $table = 'servicios';
    protected $fillable = [
        'id_tipo_servicio',
        'id_direccion',
        'id_usuario',
        'id_pueblo',
        'id_estatus'
    ];
    public function tipoServicio()
    {
        return $this->belongsTo(TiposServicios::class, 'id_tipo_servicio');
    }

    public function direccion()
    {
        return $this->belongsTo(Direcciones::class, 'id_direccion');
    }

    public function usuario()
    {
        return $this->belongsTo(User::class, 'id_usuario');
    }

    public function pueblo()
    {
        return $this->belongsTo(PueblosMagicos::class, 'id_pueblo');
    }
    public function detalleServicio()
    {
        return $this->hasOne(ServicioDetalle::class, 'id_servicio');
    }
    public function solicitud()
    {
        return $this->hasOne(PueblosSolicitudes::class, 'id_servicio');
    }
    public function imagenes()
    {
        return $this->hasManyThrough(
            Imagen::class,
            ServiciosImagen::class,
            'id_servicio', // Llave foránea en la tabla intermedia
            'id', // Llave foránea en la tabla final
            'id', // Llave local en la tabla inicial
            'id_imagen' // Llave local en la tabla intermedia
        );
    }
    public function estatus(){
        return $this->belongsTo(Estatus::class, 'id_estatus');
    }

    public static function boot()
    {
        parent::boot();

        static::deleting(function($servicio) {
            // Eliminar detalles del servicio
            // $servicio->detalleServicio()->delete();
            $detalle = $servicio->detalleServicio()->first();
            $detalle->delete();
            // Eliminar imágenes asociadas al servicio
            
            $servicio->imagenes()->delete();
            // Eliminar la dirección asociada
            $servicio->direccion()->delete();
            $servicio->solicitud()->delete();
            
        });
    }
}
