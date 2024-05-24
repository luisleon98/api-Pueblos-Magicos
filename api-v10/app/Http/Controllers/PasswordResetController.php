<?php

namespace App\Http\Controllers;

use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Password;

class PasswordResetController extends Controller
{
/**
 * @OA\Post(
 *     path="/api/forgot-password",
 *     summary="Solicitar restablecimiento de contraseña",
 *     tags={"PasswordReset"},
 *     security={{"bearerAuth":{}}},
 *
 *     @OA\RequestBody(
 *         description="Correo electrónico del usuario",
 *         required=true,
 *         @OA\JsonContent(
 *             @OA\Property(property="data", type="object", 
 *                 @OA\Property(property="user_name", type="string", format="email", description="El correo electrónico del usuario")
 *             )
 *         )
 *     ),
 *
 *     @OA\Response(
 *         response=200,
 *         description="OK",
 *         @OA\JsonContent(
 *             @OA\Property(property="data", type="object", 
 *                 @OA\Property(property="status", type="string", description="Estado del envío del enlace de restablecimiento de contraseña")
 *             )
 *         )
 *     ),
 *
 *     @OA\Response(
 *         response=400,
 *         description="Bad Request",
 *         @OA\JsonContent(
 *             @OA\Property(property="data", type="object", 
 *                 @OA\Property(property="user_name", type="string", description="Estado del envío del enlace de restablecimiento de contraseña")
 *             )
 *         )
 *     )
 * )
 */
public function forgot(Request $request)
{
    $request->validate(['data.user_name' => 'required|email|exists:usuarios,user_name']);
    $status = Password::sendResetLink(
        $request->only('data.user_name')
    );
    return $status === Password::RESET_LINK_SENT
                ? response()->json(["data" => ["status" => __($status)]], 200)
                : response()->json(["data" => ["user_name" => __($status)]], 400);
}

/**
 * @OA\Post(
 *     path="/api/password/reset",
 *     summary="Restablecer contraseña",
 *     tags={"PasswordReset"},
 *     security={{"bearerAuth":{}}},
 *
 *     @OA\RequestBody(
 *         description="Datos para restablecer la contraseña",
 *         required=true,
 *         @OA\JsonContent(
 *             @OA\Property(property="data", type="object", 
 *                 @OA\Property(property="token", type="string", description="El token de restablecimiento de contraseña"),
 *                 @OA\Property(property="user_name", type="string", format="email", description="El correo electrónico del usuario"),
 *                 @OA\Property(property="password", type="string", format="password", description="La nueva contraseña"),
 *                 @OA\Property(property="password_confirmation", type="string", format="password", description="Confirmación de la nueva contraseña")
 *             )
 *         )
 *     ),
 *
 *     @OA\Response(
 *         response=200,
 *         description="OK",
 *         @OA\JsonContent(
 *             @OA\Property(property="data", type="object", 
 *                 @OA\Property(property="status", type="string", description="Estado del restablecimiento de contraseña")
 *             )
 *         )
 *     ),
 *
 *     @OA\Response(
 *         response=500,
 *         description="Internal Server Error",
 *         @OA\JsonContent(
 *             @OA\Property(property="data", type="object", 
 *                 @OA\Property(property="user_name", type="array", 
 *                     @OA\Items(type="string", description="Estado del restablecimiento de contraseña")
 *                 )
 *             )
 *         )
 *     )
 * )
 */
public function reset(Request $request){
    $request->validate([
        'data.token' => 'required',
        'data.user_name' => 'required|email',
        'data.password' => 'required|confirmed|min:8',
    ]);

    $status = Password::reset(
        $request->only('data.user_name', 'data.password', 'data.password_confirmation', 'data.token'),
        function ($user, $password) {
            $user->forceFill([
                'password' => Hash::make($password)
            ])->setRememberToken(Str::random(60));

            $user->save();
        }
    );

    return $status == Password::PASSWORD_RESET
                ? response()->json(['data' => ['status' => __('passwords.reset')]], 200)
                : response()->json(['data' => ['user_name' => [__($status)]]], 500);
}
}
