<?php

use App\Http\Controllers\StudentController;
use App\Http\Controllers\AuthController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::prefix('students')->group(function () {
    // http://127.0.0.1:8000/api/students
    Route::get('/', [StudentController::class, 'index'])->middleware('auth:sanctum');

    // http://127.0.0.1:8000/api/students
    // {
    //     "nama": "Nama Siswa",
    //     "nim": "NIM Siswa",
    //     "email": "email@siswa.com",
    //     "jurusan": "Jurusan Siswa"
    // }
    Route::post('/', [StudentController::class, 'store']);

    // http://127.0.0.1:8000/api/students/{id}
    Route::get('{id}', [StudentController::class, 'show']);

    // http://127.0.0.1:8000/api/students/{id}
    // {
    //     "nama": "Nama Siswa yang Diperbarui",
    //     "nim": "NIM Siswa yang Diperbarui",
    //     "email": "email@siswa.com",
    //     "jurusan": "Jurusan yang Diperbarui"
    // }
    Route::put('{id}', [StudentController::class, 'update']);

    // http://127.0.0.1:8000/api/students/{id}
    Route::delete('{id}', [StudentController::class, 'destroy']);
});

Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);
