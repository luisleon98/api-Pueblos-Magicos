<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
/**
 * @OA\Schema(
 *     schema="Direcciones",
 *     title="Direcciones",
 *     description="Modelo para representar Direcciones",
 *     @OA\Property(
 *         property="id",
 *         type="integer",
 *         example=1
 *     ),
 *     @OA\Property(
 *         property="calle",
 *         type="string",
 *         example="Zacatlan"
 *     ),
 *     @OA\Property(
 *         property="municipio",
 *         type="string",
 *         example="El pueblo de Zacatlan"
 *     ) ,
 *     @OA\Property(
 *         property="CP",
 *         type="integer",
 *         example=07330
 *     ),
 *     @OA\Property(
 *         property="int",
 *         type="integer",
 *         example=1
 *     ),
 *     @OA\Property(
 *         property="ext",
 *         type="integer",
 *         example=1
 *     ),
 *     @OA\Property(
 *         property="id_estado",
 *         type="integer",
 *         example=21
 *     )
 * )
 */
class Direcciones extends Model
{
    use HasFactory;
    protected $table = 'direcciones';
    protected $fillable = [
        'calle',
        'municipio',
        'CP',
        'int',
        'ext',
        'id_estado'
    ];
}
