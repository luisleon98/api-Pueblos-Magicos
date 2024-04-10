<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;
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
    use HasFactory,SoftDeletes;
    protected $table = 'categoria_servicios';
    protected $fillable = [
        'nombre',
    ];
}
