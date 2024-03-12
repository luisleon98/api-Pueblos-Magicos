<?php
use Illuminate\Http\Request;
use Illuminate\Routing\Route;

Route::get('documentation', 'L5SwaggerController@render')->name('l5-swagger.render');

