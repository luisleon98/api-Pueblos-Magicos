<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\StateController;
use App\Http\Controllers\TipoUserController;
use App\Http\Controllers\ServiciosController;
use App\Http\Controllers\CatServiciosController;
use App\Http\Controllers\PueblosMagicosController;
use App\Http\Controllers\TiposServiciosController;

Route::middleware('auth:sanctum')->group(function () {
    Route::get('/user', function (Request $request) {
        return $request->user();
    });

    // Puedes agregar más rutas aquí que también usarán el middleware 'auth:sanctum'
});

Route::get('catestados',[StateController::class,'index']);
Route::get('cattiposUsers',[TipoUserController::class,'index']);
Route::get('catservicios',[CatServiciosController::class,'index']);
Route::get('tiposervicios',[TiposServiciosController::class,'index']);
Route::get('pueblosmagicos',[PueblosMagicosController::class,'index']);
Route::post('users/registrar',[UserController::class,'create']);
Route::post('users/login',[UserController::class,'login']);
Route::post('servicios/registrar',[ServiciosController::class,'store']);
// Route::post()