<?php

namespace App\Http\Controllers;

use App\Http\Requests\RegistroServicioRequest;
use Illuminate\Http\Request;

class ServiciosController extends Controller
{
      /**
* @OA\Post(
*     path="/api/servicios/registrar",
*     summary="Crea un nuevo servicio",
*          tags={"servicios"},
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
    public function store(RegistroServicioRequest $request){
        $data = $request->validated();
        $data = $data['data'];
        return response()->json([
            "data"=>$data
        ]);
    }
}
