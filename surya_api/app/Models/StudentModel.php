<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class StudentModel extends Model
{
    protected $table = 'students';

    protected $fillable = ['nama', 'nim', 'email', 'jurusan'];
}