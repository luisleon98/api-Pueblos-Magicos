<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Bitacora extends Model
{
    use HasFactory,SoftDeletes;
    protected $table = 'bitacora';
    protected $fillable = [
        'movimiento',
        'tabla_afectada',
        'id_registro_afectado',
        'id_usuario'
    ];
    
}
