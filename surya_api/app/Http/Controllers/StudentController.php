<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\StudentModel;

class StudentController extends Controller
{
    public function index()
    {
        $students = StudentModel::all();

        $data = [
            'message' => 'success',
            'data' => $students
        ];

        return response()->json($data, 200);
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'nama' => 'required',
            'nim' => 'numeric|required',
            'email' => 'required|email',
            'jurusan' => 'required'
        ]);

        $student = StudentModel::create($request->all());

        $data = [
            'message' => 'Student created successfully',
            'data' => $student
        ];

        return response()->json($data, 201);
    }

    public function show($id)
    {
        $student = StudentModel::find($id);

        if (!$student) {
            return response()->json(['message' => 'Student not found'], 404);
        }

        $data = [
            'message' => 'success',
            'data' => $student
        ];

        return response()->json($data, 200);
    }

    public function update(Request $request, $id)
    {
        $this->validate($request, [
            'nama' => 'required',
            'nim' => 'required',
            'email' => 'required|email',
            'jurusan' => 'required'
        ]);

        $student = StudentModel::find($id);

        if (!$student) {
            return response()->json(['message' => 'Student not found'], 404);
        }

        $student->update($request->all());

        $data = [
            'message' => 'Student updated successfully',
            'data' => $student
        ];

        return response()->json($data, 200);
    }

    public function destroy($id)
    {
        $student = StudentModel::find($id);

        if (!$student) {
            return response()->json(['message' => 'Student not found'], 404);
        }

        $student->delete();

        $data = [
            'message' => 'Student deleted successfully',
        ];

        return response()->json($data, 200);
    }
}
