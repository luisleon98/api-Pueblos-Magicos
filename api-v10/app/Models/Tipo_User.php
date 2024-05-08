<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;
/**
 * @OA\Schema(
 *     schema="Tipo_User",
 *     title="Tipo_User",
 *     description="Modelo para representar Tipo_User",
 *     @OA\Property(
 *         property="id",
 *         type="integer",
 *         example=1
 *     ),
 *     @OA\Property(
 *         property="nombre",
 *         type="string",
 *         example="Administrador"
 *     )
 * )
 */
class Tipo_User extends Model
{
    use HasFactory,SoftDeletes;
    protected $table = 'tipos_usuarios';
    protected $fillable = [
        'tipo_usuario',
    ];
}
