<?php

use App\Http\Controllers\StudentController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

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

Route::prefix('students')->group(function () {
    //http://127.0.0.1:8000/api/students
    Route::get('/', [StudentController::class, 'index']);

    // http://127.0.0.1:8000/api/students
    // {
    //     "nama": "Nama Siswa",
    //     "nim": "NIM Siswa",
    //     "email": "email@siswa.com",
    //     "jurusan": "Jurusan Siswa"
    // }
    Route::post('/', [StudentController::class, 'store']);

    //http://127.0.0.1:8000/api/students/{id}
    Route::get('{id}', [StudentController::class, 'show']);

    // http://127.0.0.1:8000/api/students/{id}
    // {
    //     "nama": "Nama Siswa yang Diperbarui",
    //     "nim": "NIM Siswa yang Diperbarui",
    //     "email": "email@siswa.com",
    //     "jurusan": "Jurusan yang Diperbarui"
    // }
    Route::put('{id}', [StudentController::class, 'update']);

    //http://127.0.0.1:8000/api/students/{id}
    Route::delete('{id}', [StudentController::class, 'destroy']);
});
