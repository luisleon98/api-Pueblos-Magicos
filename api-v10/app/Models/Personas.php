<?php

namespace App\Models;

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
        'id_usuario'
    ];
}
