<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class AnimalsConteroller extends Controller
{
    public function index(){
        echo "data Animals";
    }

    public function store(Request $request){
        echo "tambah Animal ".$request->name;

    }

    public function update(Request $request){
        echo "edit Animal ".$request->name;
    }

    public function destroy($id){
        echo "Hapus Animal ".$id;
    }

    public function Detail($id){
        echo "Detail Animal ".$id;
    }
}
