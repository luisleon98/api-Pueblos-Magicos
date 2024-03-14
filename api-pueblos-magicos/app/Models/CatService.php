<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
/**
 * @OA\Schema(
 *     schema="CatService",
 *     title="CatService",
 *     description="Modelo para representar CatService",
 *     @OA\Property(
 *         property="id",
 *         type="integer",
 *         example=1
 *     ),
 *     @OA\Property(
 *         property="nombre",
 *         type="string",
 *         example="Hotelero"
 *     )
 * )
 */
class CatService extends Model
{
    use HasFactory;
    protected $table = 'categoria_servicios';
    protected $fillable = [
        'nombre',
    ];
}
