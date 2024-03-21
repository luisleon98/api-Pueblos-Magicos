<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
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
    use HasFactory;
    protected $table = 'servicios';
    protected $fillable = [
        'id_tipo_servicio',
        'id_direccion',
        'id_usuario',
        'id_pueblo'
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
}
