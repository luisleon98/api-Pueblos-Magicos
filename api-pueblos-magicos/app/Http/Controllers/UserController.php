<?php

namespace App\Http\Controllers;

use App\Http\Requests\RegistroRequest;
use Illuminate\Http\Request;

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
*     path="/api/users",
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
*                         property="nombre",
*                         type="string"
*                     ),
*                     @OA\Property(
*                         property="apellido",
*                         type="string"
*                     ),
*                     @OA\Property(
*                         property="direccion",
*                         type="string"
*                     ),
*                     @OA\Property(
*                         property="ciudad",
*                         type="string"
*                     ),
*                     @OA\Property(
*                         property="cp",
*                         type="integer"
*                     ),
*                     @OA\Property(
*                         property="id_tipo_user",
*                         type="integer"
*                     ),
*                     @OA\Property(
*                         property="id_estado",
*                         type="integer"
*                     ),
*                     @OA\Property(
*                         property="email",
*                         type="string"
*                     ),
*                     @OA\Property(
*                         property="password",
*                         type="string"
*                     )
*                 ),
*                 example={"data": {"nombre": "Juan", "apellido": "Pérez", "direccion": "Calle Falsa 123", "ciudad": "Ciudad de Ejemplo", "cp": 12345, "id_tipo_user": 1, "id_estado": 2, "email": "juan@ejemplo.com", "password": "contraseña123"}}
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
*             @OA\Examples(example="result", value={"success": true}, summary="An result object."),
*             @OA\Examples(example="bool", value=false, summary="A boolean value."),
*         )
*     )
* )
*/
    public function create(RegistroRequest $request)
    {
        $data = $request->validated();
        return response()->json([
            'data' => ['message'=>'ok']
        ]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
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
