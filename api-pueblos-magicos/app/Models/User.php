<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Laravel\Sanctum\HasApiTokens;
use Illuminate\Notifications\Notifiable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
/**
 * @OA\Schema(
 *     schema="User",
 *     title="User",
 *     description="Modelo para representar un usuario",
 *     @OA\Property(
 *         property="nombre",
 *         type="string",
 *         example="Juan"
 *     ),
 *     @OA\Property(
 *         property="apellido",
 *         type="string",
 *         example="Pérez"
 *     ),
 *     @OA\Property(
 *         property="direccion",
 *         type="string",
 *         example="Calle 123"
 *     ),
 *     @OA\Property(
 *         property="ciudad",
 *         type="string",
 *         example="Ciudad de México"
 *     ),
 *     @OA\Property(
 *         property="cp",
 *         type="integer",
 *         example=12345
 *     ),
 *     @OA\Property(
 *         property="id_tipo_user",
 *         type="integer",
 *         example=1
 *     ),
 *     @OA\Property(
 *         property="id_estado",
 *         type="integer",
 *         example=1
 *     ),
 *     @OA\Property(
 *         property="email",
 *         type="string",
 *         example="juan.perez@example.com"
 *     ),
 *     @OA\Property(
 *         property="password",
 *         type="string",
 *         example="password_seguro"
 *     ),
 *     @OA\Property(
 *         property="created_at",
 *         type="string",
 *         format="date-time",
 *         example="2023-04-01T12:00:00Z"
 *     ),
 *     @OA\Property(
 *         property="updated_at",
 *         type="string",
 *         format="date-time",
 *         example="2023-04-01T12:00:00Z"
 *     )
 * )
 */

class User extends Authenticatable
{
    use HasFactory, Notifiable,HasApiTokens;

    protected $table = 'usuarios';
    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'user_name',
        'password',
        'id_tipo_usuario'
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * Get the attributes that should be cast.
     *
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return [
            'password' => 'hashed',
        ];
    }
    public function tipo(){
        return $this->belongsTo(Tipo_User::class);
    }
}
