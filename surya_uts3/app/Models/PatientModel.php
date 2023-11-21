<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PatientModel extends Model
{
    use HasFactory;

    protected $table = 'patients';

    protected $fillable = ['name', 'address', 'status', 'tanggal_masuk', 'tanggal_keluar'];

    // Assuming you don't want timestamps in your table
    public $timestamps = true;
}
