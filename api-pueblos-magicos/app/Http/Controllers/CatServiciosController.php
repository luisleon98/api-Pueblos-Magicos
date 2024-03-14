<?php

namespace App\Http\Controllers;

use App\Models\CatService;
use Illuminate\Http\Request;

class CatServiciosController extends Controller
{
    /**
     * Display a listing of the resource.
     */
       /**
 * @OA\PathItem(
 *      path="/api/catservicios",
 *      @OA\Get(
 *          summary="Obtiene todas las categorias de servicios",
 *          tags={"CatServicios"},
 *          @OA\Response(
 *              response=200,
 *              description="Operación exitosa",
 *              @OA\JsonContent(
 *                  @OA\Property(
 *                      property="data",
 *                      type="array",
 *                      @OA\Items(ref="#/components/schemas/CatService")
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
        $servicios = CatService::all();

   return response()->json([
       'data' => $servicios
   ]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
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
