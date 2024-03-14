<?php

use App\Http\Controllers\CatServiciosController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\StateController;
use App\Http\Controllers\TipoUserController;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

Route::get('catestados',[StateController::class,'index']);
Route::get('cattiposUsers',[TipoUserController::class,'index']);
Route::get('catservicios',[CatServiciosController::class,'index']);