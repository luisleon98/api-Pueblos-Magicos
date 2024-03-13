<?php

namespace App\Http\Controllers;

use App\Models\State;
use Illuminate\Http\Request;
/**
 * @OA\Info(
 *      title="Pueblos magicos",
 *      version="1.0.0",
 *      description="Descripción de tu API"
 * )
 */
class StateController extends Controller
{
/**
 * @OA\PathItem(
 *      path="/api/estados",
 *      @OA\Get(
 *          summary="Obtener todos los estados",
 *          tags={"Estados"},
 *          @OA\Response(
 *              response=200,
 *              description="Operación exitosa",
 *              @OA\JsonContent(
 *                  @OA\Property(
 *                      property="data",
 *                      type="array",
 *                      @OA\Items(ref="#/components/schemas/State")
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
        
        $states = State::all();

   return response()->json([
       'data' => $states
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
    public function show(State $state)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(State $state)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, State $state)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(State $state)
    {
        //
    }
}
