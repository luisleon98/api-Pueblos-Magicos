<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PueblosSolicitudes extends Model
{
    use HasFactory;
    protected $table = 'pueblos_solicitudes';
    protected $fillable = [
        'id_servicio',
        'id_pueblo_magico',
        'id_tipo_servicio'
    ];
}
