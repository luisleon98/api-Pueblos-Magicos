<?php

namespace App\Models;

use App\Models\Horarios;
use App\Models\Coordenadas;
use App\Models\Festividades;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class FestividadesDetalles extends Model
{
    use HasFactory,SoftDeletes;
    protected $table = 'servicio_detalles';
    protected $fillable = [
        'dias_servicio',
        'precios',
        'titulo',
        'descripcion',
        'id_coordenadas',
        'id_festividad',
        'id_horarios'
    ];
    public function festividad()
    {
        return $this->belongsTo(Festividades::class, 'id_servicio');
    }
    public function coordenada()
    {
        return $this->belongsTo(Coordenadas::class, 'id_coordenadas');
    }
    public function horario(){
        return $this->belongsTo(Horarios::class,'id_horarios');
    }
    public static function boot()
    {
        parent::boot();

        static::deleting(function($detalle) {
            // Eliminar la coordenada asociada
            $detalle->coordenada()->delete();
            // Eliminar el horario asociado
            $detalle->horario()->delete();
        });
    }
}
