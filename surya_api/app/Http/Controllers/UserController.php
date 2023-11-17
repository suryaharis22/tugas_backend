<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    /**
     * Register a new user.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function register(Request $request)
    {
        $this->validate($request, [
            'name' => 'required',
            'email' => 'required|email|unique:users',
            'password' => 'required|min:6',
        ]);

        $user = User::create([
            'name' => $request->input('name'),
            'email' => $request->input('email'),
            'password' => Hash::make($request->input('password')),
        ]);

        $token = $user->createToken('AuthToken')->plainTextToken;

        $data = [
            'message' => 'User registered successfully',
            'data' => $user,
            'access_token' => $token,
        ];

        return response()->json($data, 201);
    }

    /**
     * Log in an existing user.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function login(Request $request)
    {
        $input = [
            'email' => $request->input('email'),
            'password' => $request->input('password'),
        ];

        $user = User::where('email', $input['email'])->first();

        $isLoginSuccess = $input['email'] == $user->email && Hash::check($input['password'], $user->password);
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
    }
}
