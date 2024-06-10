<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Personas;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use App\Http\Requests\RegistroRequest;
use App\Http\Requests\UpdateUsuarioRequest;
use Illuminate\Auth\AuthenticationException;

class UserController extends Controller
{
    /**
     * @OA\Get(
     *     path="/api/users",
     *     summary="Obtiene una lista de usuarios",
     *     tags={"Users"},
     *     @OA\Response(
     *         response=200,
     *         description="OK",
     *         @OA\JsonContent(
     *             type="object",
     *             @OA\Property(
     *                 property="data",
     *                 type="object",
     *                 @OA\Property(
     *                     property="usuarios",
     *                     type="array",
     *                     @OA\Items(ref="#/components/schemas/User")
     *                 )
     *             )
     *         )
     *     ),
     *     @OA\Response(
     *         response=401,
     *         description="No autorizado",
     *         @OA\JsonContent(
     *             type="object",
     *             @OA\Property(
     *                 property="data",
     *                 type="object",
     *                 @OA\Property(
     *                     property="Error",
     *                     type="string",
     *                     example="No tienes permisos para realizar esta accion"
     *                 )
     *             )
     *         )
     *     ),
     *     security={{"bearerAuth":{}}}
     * )
     */
    public function index(Request $request)
    {
        $user = $request->user();
        $query = User::with([
            'tipo' => function ($query) {
                $query->select('id', 'tipo_usuario');
            },
            'persona' => function ($query) {
                $query->select('id', 'nombre', 'apellido_pat', 'apellido_mat', 'id_usuario');
            },
            'estatus' => function($query){
                $query->select('id', 'estado');
            }
        ]);
        if (in_array($user->id_tipo_usuario, [1, 2])) {
            if ($user->id_tipo_usuario == 2) {
                $query->where('id_tipo_usuario', '<>', 1);
            }
            $usuarios = $query->orderBy('id')->paginate(env('PAGINATION_LIMIT', 5));

            return response()->json([
                "data" => ["usuarios" => $usuarios]
            ]);
        } else {
            return response()->json([
                "data" => ["Error" => 'No tienes permisos para realizar esta accion ']
            ], 401);
        }
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
        $data['password'] = Hash::make($data['password']);
        $user = User::create([
            'user_name' => $data['user_name'],
            'password' => $data['password'],
            'id_tipo_usuario' => $data['id_tipo_usuario'],
            'id_estatus' =>7
        ]);
        $persona = Personas::create([
            'nombre' => $data['nombre'],
            'apellido_pat' => $data['apellido_pat'],
            'apellido_mat' => $data['apellido_mat'],
            'id_usuario' => $user->id
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
                    'user_name' => $user->user_name,
                    'id_tipo_usuario' => $user->id_tipo_usuario
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
\
     */

    public function logout(Request $request)
    {
        try {
            // Verifica si el usuario está autenticado
            if ($request->user()) {
                // Si el usuario está autenticado, revoca todos los tokens de acceso
                $request->user()->currentAccessToken()->delete();
                return response()->json([
                    'data' => ['mensaje' => 'Cierre de sesión exitoso']
                ]);
            }
        } catch (AuthenticationException $e) {
            return response()->json(['error' => 'Unauthorized'], 401);
        }
    }
    /**
 * @OA\Get(
 *     path="/api/users/{id}",
 *     summary="Mostrar un usuario específico",
 *     tags={"Users"},
 *     security={{"bearerAuth":{}}},
 *
 *     @OA\Parameter(
 *         name="id",
 *         in="path",
 *         description="ID del usuario a mostrar",
 *         required=true,
 *         @OA\Schema(type="string")
 *     ),
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

 */
    public function show(string $id)
    {
        $usuario = User::where('id', $id)->with([
            'tipo' => function ($query) {
                $query->select('id', 'tipo_usuario');
            },
            'persona' => function ($query) {
                $query->select('id', 'nombre', 'apellido_pat', 'apellido_mat', 'id_usuario');
            }
        ])->get();
        return response()->json([
            "data" => ["servicio" => $usuario]
        ]);
    }

   /**
     * @OA\Get(
     *     path="/sanctum/csrf-cookie",
     *     summary="Obtiene los tokens CSRF y de sesión",
     *     tags={"Autenticación"},
     *     @OA\Response(
     *         response=204,
     *         description="Operación exitosa",
     *         @OA\Header(
     *             header="Set-Cookie",
     *             @OA\Schema(
     *                 type="array",
     *                 @OA\Items(
     *                     @OA\Schema(
     *                         type="string",
     *                         example="XSRF-TOKEN=eyJpdiI6IktmZkhXWVlLS1VQTW1STXE4VG1UbHc9PSIsInZhbHVlIjoiSTNSVExZRkpBMjlzdG1jNWlOUW1SVTVYeVFmQ09xQW9TVkFDREhCaGYra3VCOUxyVkM4dUE1S0h3WVBqMDVyS2F5anNqL1Y2UGNOUkxiWjZmWTdjTTYvYmJUMk00dnRIMDBucXdSSkFTR1JZTWF1TlNacHFPOEZkYmt0RWhzMUEiLCJtYWMiOiI3ZGFkODRhZTYzZjUwMzM1Mjg3MmQ0YTljZDZiZDc1ZDU4NjY3ZjVmNWI5YzBiOTA0Yzk2NTE0OTY3MGFmYTdlIiwidGFnIjoiIn0%3D; expires=Thu, 11 Apr 2024 21:43:15 GMT; Max-Age=7200; path=/; samesite=lax"
     *                     ),
     *                     @OA\Schema(
     *                         type="string",
     *                         example="laravel_session=eyJpdiI6IlNzVklsYndhOWZseDk1NnNLeWJhM1E9PSIsInZhbHVlIjoicHZsakxmOVVxdmJMY0ZVdDJNbUxnclJqejFlTzFHWXZ6Y1VZSGI4V2FxZndlUnJ0L3hSZmgwM3JGNGcrQjljdWI3VjVCWW9XaWx1Lzczc2VjbkN5ekIvQ3lvZmpxNWxxeDVUbWsrbVZPT3ZwTnJMWDRzSnVOWHNSVHAzUlg0bzAiLCJtYWMiOiIyMmUwNWFhM2I0Yjk2ZjM2OWNhNDE1ZDAyOGEzM2ZmZDhhMzAzZjI2ODExZGJkZmNhNDFjODkzMmNhZmE0ZTUzIiwidGFnIjoiIn0%3D; expires=Thu, 11 Apr 2024 21:43:15 GMT; Max-Age=7200; path=/; httponly; samesite=lax"
     *                     )
     *                 )
     *             )
     *         )
     *     )
     * )
     */
    public function edit(string $id)
    {
        //
    }

/**
 * @OA\Put(
 *     path="/api/users/{id}",
 *     summary="Actualizar un usuario específico",
 *     tags={"Users"},
 *     security={{"bearerAuth":{}}},
 *
 *     @OA\Parameter(
 *         name="id",
 *         in="path",
 *         description="ID del usuario a actualizar",
 *         required=true,
 *         @OA\Schema(type="string")
 *     ),
 *
 *     @OA\RequestBody(
 *         description="Datos del usuario a actualizar",
 *         required=true,
 *         @OA\JsonContent(
 *             type="object",
 *             required={"data"},
 *             @OA\Property(
 *                 property="data",
 *                 type="object",
 *                 required={"user", "datosP"},
 *                 @OA\Property(
 *                     property="user",
 *                     type="object",
 *                     required={"user_name", "password", "id_tipo_usuario"},
 *                     @OA\Property(
 *                         property="user_name",
 *                         type="string",
 *                         description="El correo electrónico del usuario",
 *                     ),
 *                     @OA\Property(
 *                         property="password",
 *                         type="string",
 *                         description="La contraseña del usuario",
 *                     ),
 *                     @OA\Property(
 *                         property="id_tipo_usuario",
 *                         type="integer",
 *                         description="El ID del tipo de usuario",
 *                     ),
 *                 ),
 *                 @OA\Property(
 *                     property="datosP",
 *                     type="object",
 *                     required={"nombre", "apellido_pat", "apellido_mat"},
 *                     @OA\Property(
 *                         property="nombre",
 *                         type="string",
 *                         description="El nombre del usuario",
 *                     ),
 *                     @OA\Property(
 *                         property="apellido_pat",
 *                         type="string",
 *                         description="El apellido paterno del usuario",
 *                     ),
 *                     @OA\Property(
 *                         property="apellido_mat",
 *                         type="string",
 *                         description="El apellido materno del usuario",
 *                     ),
 *                 ),
 *             ),
 *         ),
 *     ),
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
 */
    public function update(UpdateUsuarioRequest $request, User $usuario)
    {
        $data = $request->validated();

            $data = $data['data'];
        if(isset($data['user'])){
            if(isset($data['user']['password'])){
                $data['user']['password'] = Hash::make($data['user']['password']);
            }
            $usuario->update($data['user']);
        }
        if(isset($data['datosP'])){
            $persona = $usuario->persona();
            $persona->update($data['datosP']);
        }
        return response()->json([
            "data" => ["usuario" => $usuario]
        ]);
    }
/**
 * @OA\Delete(
 *     path="/api/users/{id}",
 *     summary="Eliminar un usuario específico",
 *     tags={"Users"},
 *     security={{"bearerAuth":{}}},
 *
 *     @OA\Parameter(
 *         name="id",
 *         in="path",
 *         description="ID del usuario a eliminar",
 *         required=true,
 *         @OA\Schema(type="string")
 *     ),
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

 */
    
    public function destroy(User $usuario)
    {
        $usuario->persona->delete();
        $usuario->delete();
        return response()->json([
            "data" => ["usuario" => $usuario]
        ]);
    }
}
