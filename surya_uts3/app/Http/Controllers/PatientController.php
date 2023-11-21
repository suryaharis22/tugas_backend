<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Log;
use App\Models\PatientModel;
use Illuminate\Http\Request;
use Symfony\Component\HttpKernel\Exception\MethodNotAllowedHttpException;

class PatientController extends Controller
{
    /**  
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        try {
            $query = PatientModel::query();

            // Filter by name, status, address, tanggal_masuk, or tanggal_keluar
            if ($request->has('name')) {
                $query->where('name', 'like', '%' . $request->input('name') . '%');
            }

            if ($request->has('status')) {
                $query->where('status', $request->input('status'));
            }

            if ($request->has('address')) {
                $query->where('address', 'like', '%' . $request->input('address') . '%');
            }

            if ($request->has('tanggal_masuk')) {
                $query->where('tanggal_masuk', $request->input('tanggal_masuk'));
            }

            if ($request->has('tanggal_keluar')) {
                $query->where('tanggal_keluar', $request->input('tanggal_keluar'));
            }

            // Sort by tanggal_masuk, tanggal_keluar, name, or address
            if ($request->has('sort')) {
                $sortField = $request->input('sort');
                $sortOrder = $request->input('order', 'asc'); // Default to ascending order if not specified

                // Validate the sort field to prevent SQL injection
                $allowedSortFields = ['tanggal_masuk', 'tanggal_keluar', 'name', 'address'];
                if (in_array($sortField, $allowedSortFields)) {
                    $query->orderBy($sortField, $sortOrder);
                } else {
                    return response()->json(['error' => 'Invalid sort field'], 400);
                }
            }

            // Paginate the results
            $perPage = $request->input('rows', 10);
            $page = $request->input('page', 1);

            // Query to retrieve paginated data
            $patients = $query->paginate($perPage, ['*'], 'page', $page);

            if ($patients->isEmpty()) {
                return response()->json(['error' => 'No data found'], 404);
            } else {
                return response()->json(['message' => 'The request succeeded', 'data' => $patients], 200);
            }
        } catch (\Illuminate\Auth\AuthenticationException $e) {
            return response()->json(['error' => 'Authentication error', 'details' => $e->getMessage()], 401);
        } catch (\Symfony\Component\Routing\Exception\RouteNotFoundException $e) {
            return response()->json(['error' => 'Route not found'], 404);
        } catch (\Exception $e) {
            Log::error('Error in PatientController@index: ' . $e->getMessage());
            return response()->json(['error' => 'Internal Server Error', 'details' => $e->getMessage()], 500);
        }
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        try {
            // Validati request data
            $this->validate($request, [
                '*.name' => 'required',
                '*.address' => 'required',
                '*.status' => 'required|in:positive,negative,meninggal',
                '*.tanggal_masuk' => 'required|date',
            ]);

            $patientsData = $request->all();

            // Multiple insert
            $insertedPatients = [];
            foreach ($patientsData as $data) {
                $patient = PatientModel::create($data);
                $insertedPatients[] = $patient;
            }

            return response()->json(['message' => 'Resources created', 'data' => $insertedPatients], 201);
        } catch (\Exception $e) {
            Log::error('Error in PatientController@store: ' . $e->getMessage());

            if (strpos($e->getMessage(), 'Data truncated for column \'status\'') !== false) {
                return response()->json(['error' => 'Invalid status value. Allowed values are: positive, negative, meninggal'], 422);
            }

            return response()->json(['error' => 'Internal Server Error', 'details' => $e->getMessage()], 500);
        }
    }


    /**
     * Display the specified resource.
     *
     * @param  \App\Models\PatientModel  $patientModel
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        try {
            $patient = PatientModel::findOrFail($id);
            return response()->json(['message' => 'The request succeeded', 'data' => $patient], 200);
        } catch (\Illuminate\Database\Eloquent\ModelNotFoundException $e) {
            return response()->json(['message' => 'The request Not Found'], 404);
        } catch (\Exception $e) {
            Log::error('Error in PatientController@show: ' . $e->getMessage());
            return response()->json(['error' => 'Internal Server Error', 'details' => $e->getMessage()], 500);
        }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\PatientModel  $patientModel
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        try {
            $this->validate($request, [
                'name' => 'required',
                'address' => 'required',
                'status' => 'required|in:positive,negative,meninggal',
                'tanggal_masuk' => 'required|date',
                'tanggal_keluar' => 'date',
            ]);

            $patient = PatientModel::findOrFail($id);

            // ubah data ke dalam bentuk array
            $patientArray = $patient->toArray();

            // tambahkan data baru ke dalam array
            Log::debug('Received data:', $request->all());
            Log::debug('Found patient:', $patientArray);

            // update data dari array
            $patient->update($request->only(['name', 'address', 'status', 'tanggal_masuk', 'tanggal_keluar']));

            return response()->json(['message' => 'Resource updated', 'data' => $patient], 200);
        } catch (\Illuminate\Database\Eloquent\ModelNotFoundException $e) {
            return response()->json(['message' => 'The request Not Found'], 404);
        } catch (\Illuminate\Validation\ValidationException $e) {
            return response()->json(['error' => 'Validation failed', 'details' => $e->errors()], 422);
        } catch (\Exception $e) {
            Log::error('Error in PatientController@update: ' . $e->getMessage());

            if (strpos($e->getMessage(), 'Data truncated for column \'status\'') !== false) {
                return response()->json(['error' => 'Invalid status value. Allowed values are: positive, negative, meninggal'], 422);
            }

            return response()->json(['error' => 'Internal Server Error', 'details' => $e->getMessage()], 500);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\PatientModel  $patientModel
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        try {
            $patient = PatientModel::findOrFail($id);
            $patient->delete();
            return response()->json(['message' => 'Resource deleted'], 200);
        } catch (\Illuminate\Database\Eloquent\ModelNotFoundException $e) {
            return response()->json(['message' => 'The request Not Found'], 404);
        } catch (\Exception $e) {
            Log::error('Error in PatientController@destroy: ' . $e->getMessage());
            return response()->json(['error' => 'Internal Server Error', 'details' => $e->getMessage()], 500);
        }
    }
    public function unauthenticated()
    {
        return response()->json(['error' => 'Unauthenticated'], 401);
    }
}
