<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
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
    use HasFactory;
    protected $table = 'tipo_users';
    protected $fillable = [
        'nombre',
    ];
}
