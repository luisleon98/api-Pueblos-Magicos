<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
/**
 * @OA\Schema(
 *     schema="Horarios",
 *     title="Horarios",
 *     description="Modelo para representar Horarios",
 *     @OA\Property(
 *         property="id",
 *         type="integer",
 *         example=1
 *     ),
 *     @OA\Property(
 *         property="horario_inicio",
 *         type="string",
 *         format="time",
 *         example="15:30:00"
 *     ),
 *     @OA\Property(
 *         property="horario_fin",
 *         type="string",
 *         format="time",
 *         example="15:30:00"
 *     )
 * )
 */
class Horarios extends Model
{
    use HasFactory;
    protected $table = 'horarios';
    protected $fillable = [
        'horario_inicio',
        'horario_fin'
    ];
}
