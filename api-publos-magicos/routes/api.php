<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\StateController;

Route::get('documentation', 'L5SwaggerController@render')->name('l5-swagger.render');
Route::get('estados',[StateController::class,'index']);