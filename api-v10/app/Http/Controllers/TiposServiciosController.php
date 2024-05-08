<?php

namespace App\Http\Controllers;

use App\Models\TiposServicios;
use Illuminate\Http\Request;

class TiposServiciosController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    /**
     * @OA\PathItem(
     *      path="/api/tiposervicios",
     *      @OA\Get(
     *          summary="Obtiene todos los tipos de servicios",
     *          tags={"tiposServicios"},
     *          @OA\Response(
     *              response=200,
     *              description="Operación exitosa",
     *              @OA\JsonContent(
     *                  @OA\Property(
     *                      property="data",
     *                      type="array",
     *                      @OA\Items(ref="#/components/schemas/Tipo_Servicios")
     *                  )
     *              )
     *          ),
     *          @OA\Response(
     *              response=401,
     *              description="No autorizado"
     *          )
     *      )
     * )
     */
    public function index()
    {
        $tipos = TiposServicios::all();

        return response()->json([
            'data' => $tipos
        ]);
    }
}
