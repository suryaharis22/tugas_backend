<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Tymon\JWTAuth\Facades\JWTAuth;
use Tymon\JWTAuth\Exceptions\JWTException;

class AuthController extends Controller
{
    public function register(Request $request)
    {
        $input = [
            'name' => $request->name,
            'email' => $request->email,
            'password' => bcrypt($request->password),
        ];

        $user = User::create($input);

        $data = [
            'message' => 'User is Created Successfully',

        ];

        return response()->json($data, 200);
    }

    public function login(Request $request)
    {
        $input = [
            'email' => $request->email,
            'password' => $request->password
        ];
        $user = User::where('email', $input['email'])->first();

        $isLoginSuccess = (
            $user && $input['email'] == $user->email && Hash::check($input['password'], $user->password)
        );

        if ($isLoginSuccess) {
            $token = $user->createToken('token_surya')->accessToken;
            $data = [
                'message' => 'Login Success',
                'token' => $token
            ];

            return response()->json($data, 200);
        } else {
            $data = [
                'message' => 'Login Failed'
            ];
            return response()->json($data, 401);
        }
    }
}
