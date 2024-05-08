<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\StateController;
use App\Http\Controllers\TipoUserController;
use App\Http\Controllers\ServiciosController;
use App\Http\Controllers\CatServiciosController;
use App\Http\Controllers\FestividadesController;
use App\Http\Controllers\ObservacionesController;
use App\Http\Controllers\PueblosMagicosController;
use App\Http\Controllers\TiposServiciosController;


Route::middleware('auth:sanctum')->group(function () {
    Route::get('/user', function (Request $request) {
        return $request->user();
    });
    Route::get('servicios', [ServiciosController::class, 'getAllPreview']);
    Route::get('/servicios/{id}', [ServiciosController::class, 'show']);
    Route::get('servicios/filtrar/estatus/{id_estatus}', [ServiciosController::class, 'getServiciosByEstatus']);
    Route::get('servicios/filtrar/pueblo/magico/{id_pueblo}', [ServiciosController::class, 'getServiciosByPueblo']);
    Route::get('servicios/filtrar/categoria/{id_categoria}', [ServiciosController::class, 'getServiciosByCategoria']);
    Route::get('servicios/filtrar/{id_estatus}/{id_pueblo}/{id_categoria}', [ServiciosController::class, 'getServiciosFiltradoEspecifico']);
    Route::post('users/logout', [UserController::class, 'logout']);
    Route::post('servicios/registrar', [ServiciosController::class, 'store']);
    Route::post('observaciones', [ObservacionesController::class, 'store']);
    Route::delete('/servicios/{servicio}', [ServiciosController::class, 'destroy']);
    Route::put('servicios/{servicio}', [ServiciosController::class, 'updateServicio']);
});

Route::get('catestados', [StateController::class, 'index']);
Route::get('cattiposUsers', [TipoUserController::class, 'index']);
// Route::get('catservicios', [CatServiciosController::class, 'index']);
Route::get('tiposervicios', [TiposServiciosController::class, 'index']);
Route::get('pueblosmagicos', [PueblosMagicosController::class, 'index']);
// Route::post('festividades', [FestividadesController::class, 'store']);
// Route::put('observaciones', [ObservacionesController::class, 'edit']);
// Route::get('festividades', [FestividadesController::class, 'showAll']);
// Route::get('festividades/{id}', [ServiciosController::class, 'show']);
// Route::get('festividades/filtrar/estatus/{id_estatus}', [ServiciosController::class, 'getFestividadesByEstatus']);
// Route::get('festividades/filtrar/pueblo/magico/{id_pueblo}', [ServiciosController::class, 'getFestividadesByPueblo']);
// Route::get('festividades/filtrar/{id_estatus}/{id_pueblo}/{id_categoria}', [ServiciosController::class, 'getFestividadesFiltradoEspecifico']);
// Route::get('festividades/filtrar/categoria/{id_categoria}', [ServiciosController::class, 'getFestividadesByCategoria']);
Route::post('users/registrar', [UserController::class, 'create']);
Route::post('users/login', [UserController::class, 'login']);