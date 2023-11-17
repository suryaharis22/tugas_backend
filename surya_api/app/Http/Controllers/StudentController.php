<?php

namespace App\Http\Controllers;

use App\Models\StudentModel;
use Illuminate\Http\Request;

class StudentController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        // Get search parameters from the request
        $name = $request->query('name');
        $nim = $request->query('nim');
        $email = $request->query('email');
        $jurusan = $request->query('jurusan');

        // Get sort and order parameters from the request
        $sort = $request->query('sort', 'nama');
        $order = $request->query('order', 'asc');

        // Validate the order parameter
        if (!in_array($order, ['asc', 'desc'])) {
            return response()->json(['message' => 'Invalid order value. Use "asc" or "desc"'], 400);
        }

        // Build the query based on the provided search parameters
        $query = StudentModel::query();

        if ($name) {
            $query->where('nama', 'like', '%' . $name . '%');
        }

        if ($nim) {
            $query->orWhere('nim', 'like', '%' . $nim . '%');
        }

        if ($email) {
            $query->orWhere('email', 'like', '%' . $email . '%');
        }

        if ($jurusan) {
            $query->orWhere('jurusan', 'like', '%' . $jurusan . '%');
        }

        // Add sorting to the query
        $query->orderBy($sort, $order);

        // Get the result of the query
        $students = $query->get();

        $data = [
            'message' => 'success',
            'data' => $students
        ];

        return response()->json($data, 200);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request, [
            'nama' => 'required',
            'nim' => 'required',
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

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\StudentModel  $studentModel
     * @return \Illuminate\Http\Response
     */
    public function show(StudentModel $studentModel)
    {
        $student = StudentModel::find($studentModel);

        if (!$student) {
            return response()->json(['message' => 'Student not found'], 404);
        }

        $data = [
            'message' => 'success',
            'data' => $student
        ];

        return response()->json($data, 200);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\StudentModel  $studentModel
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $this->validate($request, [
            'nama' => 'required',
            'nim' => 'required',
            'email' => 'required|email',
            'jurusan' => 'required',
        ]);

        $student = StudentModel::find($id);

        if (!$student) {
            return response()->json(['message' => 'Student not found'], 404);
        }

        $student->update($request->all());

        if ($student->wasChanged()) {
            $data = [
                'message' => 'Student updated successfully',
                'data' => $student
            ];

            return response()->json($data, 200);
        } else {
            return response()->json(['message' => 'No changes made'], 200);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\StudentModel  $studentModel
     * @return \Illuminate\Http\Response
     */
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
