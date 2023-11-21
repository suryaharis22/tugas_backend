<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Auth;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Log;

class AuthController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function register(Request $request)
    {
        try {
            // Validate incoming request
            $validator = Validator::make($request->all(), [
                'name' => 'required',
                'email' => 'required|email|unique:users',
                'password' => 'required|min:6',
            ]);

            if ($validator->fails()) {
                return response()->json(['error' => $validator->errors()], 422);
            }


            // Create a new user
            $user = User::create([
                'name' => $request->input('name'),
                'email' => $request->input('email'),
                'password' => Hash::make($request->input('password')),
            ]);
            $token = $user->createToken('AuthToken')->plainTextToken;

            // You can generate a token for the user here if you're implementing authentication
            $data = [
                'message' => 'User registered successfully',
                'data' => $user,
                'token' => $token
            ];

            return response()->json($data, 201);
        } catch (\Exception $e) {
            // Log any errors
            Log::error('Error in register: ' . $e->getMessage());

            return response()->json(['error' => 'Internal Server Error', 'details' => $e->getMessage()], 500);
        }
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function login(Request $request)
    {
        try {
            // Validate incoming request
            $input = [
                'email' => $request->input('email'),
                'password' => $request->input('password'),
            ];

            $user = User::where('email', $input['email'])->first();

            $isLoginSuccess = $input['email'] == $user->email && Hash::check($input['password'], $user->password);
            // Attempt to authenticate the user
            if ($isLoginSuccess) {
                $token = $user->createToken('auth_token')->plainTextToken;
                $data = [
                    'message' => 'User logged in successfully',
                    'token' => $token
                ];
                return response()->json($data, 200);
            } else {
                $data = [
                    'message' => 'Invalid email or password'
                ];
                return response()->json($data, 401);
            }
        } catch (\Exception $e) {
            // Log any errors
            Log::error('Error in login: ' . $e->getMessage());

            return response()->json(['error' => 'Internal Server Error', 'details' => $e->getMessage()], 500);
        }
    }
}
