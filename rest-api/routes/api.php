<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AnimalsConteroller;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});


Route::get('/animals', [AnimalsConteroller::class, 'index']);

Route::get('/animalbyid/{id}', [AnimalsConteroller::class, 'Detail']);

Route::post('/addanimal', [AnimalsConteroller::class, 'store']);

Route::put('/editanimal/{id}', [AnimalsConteroller::class, 'update']);

Route::delete('/deleteanimal/{id}', [AnimalsConteroller::class, 'destroy']);
