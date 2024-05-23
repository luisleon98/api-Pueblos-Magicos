<?php

namespace App\Http\Controllers;

use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Password;

class PasswordResetController extends Controller
{
    public function forgot(Request $request)
{
    $request->validate(['user_name' => 'required|email|exists:usuarios,user_name']);
    $status = Password::sendResetLink(
        $request->only('user_name')
    );
    return $status === Password::RESET_LINK_SENT
                ? response()->json(["status" => __($status)], 200)
                : response()->json(["user_name" => __($status)], 400);
}
public function reset(Request $request){
    $request->validate([
        'token' => 'required',
        'user_name' => 'required|email',
        'password' => 'required|confirmed|min:8',
    ]);

    $status = Password::reset(
        $request->only('user_name', 'password', 'password_confirmation', 'token'),
        function ($user, $password) {
            $user->forceFill([
                'password' => Hash::make($password)
            ])->setRememberToken(Str::random(60));

            $user->save();
        }
    );

    return $status == Password::PASSWORD_RESET
                ? response()->json(['data' => ['status' => __('passwords.reset')]], 200)
                : response()->json(['user_name' => [__($status)]], 500);
}
}
