<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class PueblosSolicitudes extends Model
{
    use HasFactory,SoftDeletes;
    protected $table = 'pueblos_solicitudes';
    protected $fillable = [
        'id_servicio',
        'id_pueblo_magico',
        'id_tipo_servicio'
    ];
    public function servicio()
    {
        return $this->belongsTo(Servicios::class, 'id_servicio');
    }
}
