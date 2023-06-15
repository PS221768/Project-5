<?php

namespace App\Http\Controllers;

use App\Traits\HttpResponses;

use App\Http\Requests\StoreUserRequest;
use App\Http\Requests\LoginUserRequest;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;

use App\Models\User;


class AuthController extends Controller
{
    use HttpResponses;

    public function login(LoginUserRequest $request)
    {
        $request->validated($request->all());

        $credentials = $request->only('email', 'password');

        if (!Auth::attempt( $credentials )) // makes wrong sql statements!!!
        {
            return $this->error('', 'Credentials do not match!', 401);
        }

        $user = User::where('email', $request->email)->first();

        return $this->success([
            'user' => $user,
            'token' => $user->createToken('API Token of ' . $user->name)->plainTextToken
        ]);
    }

    public function register(StoreUserRequest $request)
    {
        $request->validated($request->all());

        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password)
        ]);

        return $this->success([
            'user' => $user,
            'token' => $user->createToken('API Token of ' . $user->name)->plainTextToken
        ]);
    }

    public function logout()
    {
        return response()->json('this is the logout function');
    }
}
