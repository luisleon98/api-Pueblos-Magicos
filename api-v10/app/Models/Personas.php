<?php

namespace App\Models;

use App\Models\User;
use App\Models\Paises;
use App\Models\Generos;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Personas extends Model
{
    use HasFactory,SoftDeletes;
    protected $table = 'personas';
    protected $fillable = [
        'nombre',
        'apellido_pat',
        'apellido_mat',
        'edad',
        'id_usuario',
        'id_genero',
        'id_pais'
    ];
    public function usuario()
    {
        return $this->belongsTo(User::class, 'id_usuario');
    }
    // Definir atributos por defecto
    protected $attributes = [
        'edad' => null,
        'id_genero' => 1,
        'id_pais' => 132
    ];
    public function genero()
    {
        return $this->belongsTo(Generos::class,'id_genero');
    }
    public function pais()
    {
        return $this->belongsTo(Paises::class,'id_pais');
    }
}
