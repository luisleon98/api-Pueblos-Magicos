<?php

namespace App\Models;

use App\Models\User;
use App\Models\Direcciones;
use App\Models\PueblosMagicos;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;
/**
 * @OA\Schema(
 *     schema="Festividades",
 *     title="Festividades",
 *     description="Modelo para representar Festividades",
 *     @OA\Property(
 *         property="id",
 *         type="integer",
 *         example=1
 *     ),
 *     @OA\Property(
 *         property="id_direccion",
 *         type="integer",
 *         example=1
 *     ),
 *     @OA\Property(
 *         property="id_usuario",
 *         type="integer",
 *         example=1
 *     ),
 *     @OA\Property(
 *         property="id_pueblo",
 *         type="integer",
 *         example=1
 *     ),
 *     @OA\Property(
 *         property="id_estatus",
 *         type="integer",
 *         example=1
 *     ),
 * )
 */
class Festividades extends Model
{
    use HasFactory,SoftDeletes;

    protected $table = 'festividades';
    protected $fillable = [
        'id_direccion',
        'id_usuario',
        'id_pueblo',
        'id_estatus'
    ];
   

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
    public function detalleFestividad()
    {
        return $this->hasOne(FestividadesDetalles::class, 'id_festividad');
    }
    public function solicitud()
    {
        return $this->hasOne(PueblosSolicitudes::class, 'id_servicio');
    }
    public function imagenes()
    {
        return $this->hasManyThrough(
            Imagen::class,
            FestividadesImagenes::class,
            'id_festividad', // Llave foránea en la tabla intermedia
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
