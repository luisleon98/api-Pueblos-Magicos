<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
/**
 * @OA\Schema(
 *     schema="PueblosMagicos",
 *     title="PueblosMagicos",
 *     description="Modelo para representar PueblosMagicos",
 *     @OA\Property(
 *         property="id",
 *         type="integer",
 *         example=1
 *     ),
 *     @OA\Property(
 *         property="nombre",
 *         type="string",
 *         example="Zacatlan"
 *     ),
 *     @OA\Property(
 *         property="descripcion",
 *         type="string",
 *         example="El pueblo de Zacatlan"
 *     ) ,
 *     @OA\Property(
 *         property="id_direccion",
 *         type="integer",
 *         example=1
 *     )
 * )
 */
class PueblosMagicos extends Model
{
    use HasFactory;
    protected $table = 'pueblos';
    protected $fillable = [
        'nombre',
        'descripcion',
        'id_direccion'
    ];
}
