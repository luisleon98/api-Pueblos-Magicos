<?php

namespace App\Http\Controllers;

use App\Models\Servicios;
use Illuminate\Http\Request;
use App\Models\Observaciones;
use App\Traits\RegistraBitacora;
use Illuminate\Support\Facades\DB;
use App\Http\Requests\RegistroObservacionRequest;

class ObservacionesController extends Controller
{
    use RegistraBitacora;
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

   /**
* @OA\Post(
*     path="/api/observaciones",
*     summary="Crear una nueva observación para un servicio",
*     tags={"Observaciones"},
*     security={{"bearerAuth":{}}},
*     @OA\RequestBody(
*         required=true,
*         @OA\JsonContent(
*             @OA\Property(
*                 property="data",
*                 type="object",
*                 @OA\Property(
*                     property="id_servicio",
*                     type="integer",
*                     example=5
*                 ),
*                 @OA\Property(
*                     property="id_usuario",
*                     type="integer",
*                     example=10
*                 ),
*                 @OA\Property(
*                     property="observacion",
*                     type="string",
*                     example="Esta es una observación de ejemplo."
*                 )
*             )
*         )
*     ),
*     @OA\Response(
*         response=200,
*         description="Operación exitosa",
*         @OA\JsonContent(
*             @OA\Property(
*                 property="data",
*                 type="object",
*                 @OA\Property(
*                     property="observacion",
*                     ref="#/components/schemas/Observaciones"
*                 )
*             )
*         )
*     ),
*     @OA\Response(
*         response=401,
*         description="No autenticado"
*     ),
*     @OA\Response(
*         response=422,
*         description="Datos de entrada no válidos"
*     )
* )
*/
    public function store(RegistroObservacionRequest $request)
    {
        $data = $request->validated();
        $data = $data['data'];
        DB::beginTransaction();
        $servicio = Servicios::findOrFail($data['id_servicio']);
        $servicio->id_estatus = 3;
        $servicio->save();
        $this->registrarEnBitacora([
            'movimiento' => 'UPDATE',
            'tabla_afectada' => 'Servicios',
            'id_registro_afectado' => $servicio->id,
            'id_usuario' => $request->user()->id
        ]);
        $observacion=Observaciones::create([
            'id_servicio' => $data['id_servicio'],
            'id_usuario' => $data['id_usuario'],
            'id_estatus' => 5,
            'observacion' => $data['observacion']
        ]);
        $this->registrarEnBitacora([
            'movimiento' => 'CREATE',
            'tabla_afectada' => 'Observaciones',
            'id_registro_afectado' => $observacion->id,
            'id_usuario' => $request->user()->id
        ]);
        DB::commit();
        return response()->json([
            "data" => ["observacion" => $observacion]
        ]);
    }

    /**
     * Display the specified resource.
     */
    public function show(Observaciones $observaciones)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Observaciones $observaciones)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Observaciones $observaciones)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Observaciones $observaciones)
    {
        //
    }
}
