<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Personas;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use App\Http\Requests\RegistroRequest;
use Illuminate\Auth\AuthenticationException;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
    }

  /**
* @OA\Post(
*     path="/api/users/registrar",
*     summary="Crea un nuevo usuario",
*          tags={"Users"},
*     @OA\RequestBody(
*         @OA\MediaType(
*             mediaType="application/json",
*             @OA\Schema(
*                 @OA\Property(
*                     property="data",
*                     type="object",
*                     @OA\Property(
*                         property="user_name",
*                         type="string"
*                     ),
*                     @OA\Property(
*                         property="password",
*                         type="string"
*                     ),
*                     @OA\Property(
*                         property="nombre",
*                         type="string"
*                     ),
*                     @OA\Property(
*                         property="apellido_pat",
*                         type="string"
*                     ),
*                     @OA\Property(
*                         property="apellido_mat",
*                         type="string"
*                     ),
*                     @OA\Property(
*                         property="id_tipo_user",
*                         type="integer"
*                     )
*                 ),
*                 example={"data": {"user_name":"lleon@ipn.mx","password":"pruebas1","nombre":"Luis","apellido_pat":"Leon","apellido_mat":"HDZ","id_tipo_usuario":2}}
*             )
*         )
*     ),
*     @OA\Response(
*         response=200,
*         description="OK",
*         @OA\JsonContent(
*             oneOf={
*                 @OA\Schema(ref="#/components/schemas/User"),
*                 @OA\Schema(type="boolean")
*             },
*             
*         )
*     )
* )
*/
    public function create(RegistroRequest $request)
    {
        $data = $request->validated();
        $data = $data['data'];
        $data['passward'] = Hash::make($data['password']);
        $user = User::create([
            'user_name'=>$data['user_name'],
            'password'=>$data['password'],
            'id_tipo_usuario'=>$data['id_tipo_usuario']
        ]);
        $persona = Personas::create([
            'nombre'=>$data['nombre'],
            'apellido_pat'=>$data['apellido_pat'],
            'apellido_mat'=>$data['apellido_mat'],
            'id_usuario'=>$user->id
        ]);

          // Generar el token de acceso
    $token = $user->createToken('authToken')->plainTextToken;

    return response()->json([
        'data' => [
            'success' => true,
            'access_token' => $token,
            'token_type' => 'bearer',
            'user' => [
                'id' => $user->id,
                'user_name' => $user->user_name,
                'id_tipo_usuario' => $user->id_tipo_usuario
            ],
            'persona' => [
                'id' => $persona->id,
                'nombre' => $persona->nombre,
                'apellido_pat' => $persona->apellido_pat,
                'apellido_mat' => $persona->apellido_mat
            ]
        ]
    ]);
    }

  /**
* @OA\Post(
*     path="/api/users/login",
*     summary="Inicio de session de un usuario",
*          tags={"Users"},
*     @OA\RequestBody(
*         @OA\MediaType(
*             mediaType="application/json",
*             @OA\Schema(
*                 @OA\Property(
*                     property="data",
*                     type="object",
*                     @OA\Property(
*                         property="user_name",
*                         type="string"
*                     ),
*                     @OA\Property(
*                         property="password",
*                         type="string"
*                     )
*                 ),
*                 example={"data": {"user_name":"bajimeneza@ipn.mx","password":"Pruebas1"}}
*             )
*         )
*     ),
*     @OA\Response(
*         response=200,
*         description="OK",
*         @OA\JsonContent(
*             oneOf={
*                 @OA\Schema(ref="#/components/schemas/User"),
*                 @OA\Schema(type="boolean")
*             },
*             
*         )
*     )
* )
*/
    public function Login(Request $request)
    {
        $data = $request->data;
    if (Auth::attempt($data)) {
        $user = Auth::user();
        $token = $user->createToken('authToken')->plainTextToken;

        return response()->json([
            'access_token' => $token,
            'token_type' => 'bearer',
            'user' => [
                'id' => $user->id,
                'user_name' => $user->user_name
            ]
        ]);
    } else {
        return response()->json(['error' => 'Credenciales incorrectas'], 401);
    }
    }
      /**
 * @OA\Post(
 *     path="/api/users/logout",
 *     summary="Cerrar sesión de un usuario",
 *     tags={"Users"},
 *     security={{"bearerAuth":{}}},
 *
 *     @OA\Response(
 *         response=200,
 *         description="OK",
 *         @OA\JsonContent(
 *             oneOf={
 *                 @OA\Schema(ref="#/components/schemas/User"),
 *                 @OA\Schema(type="boolean")
 *             },
 *         )
 *     )
 * )
 *
 * @OA\SecurityScheme(
 *     securityScheme="bearerAuth",
 *     type="http",
 *     scheme="bearer"
 * )
 */

    public function logout(Request $request)
{
    try{
    // Verifica si el usuario está autenticado
    if ($request->user()) {
        // Si el usuario está autenticado, revoca todos los tokens de acceso
        $request->user()->currentAccessToken()->delete();
        return response()->json([
            'data' => ['mensaje'=>'Cierre de sesión exitoso']
        ]);
    } 
}catch(AuthenticationException $e) {
    return response()->json(['error' => 'Unauthorized'], 401);
}
}
    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
