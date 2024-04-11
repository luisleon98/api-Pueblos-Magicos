<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Estatus extends Model
{
    use HasFactory,SoftDeletes;
    protected $table = 'estatus';
    protected $fillable = [
        'estado'
    ];
}
