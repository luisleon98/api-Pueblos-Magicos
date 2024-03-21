<?php

namespace App\Http\Controllers;

use App\Models\PueblosMagicos;
use Illuminate\Http\Request;
/**
     * Display a listing of the resource.
     */
    /**
     * @OA\PathItem(
     *      path="/api/pueblosmagicos",
     *      @OA\Get(
     *          summary="Obtiene todos los pueblosmagicos",
     *          tags={"pueblosmagicos"},
     *          @OA\Response(
     *              response=200,
     *              description="Operación exitosa",
     *              @OA\JsonContent(
     *                  @OA\Property(
     *                      property="data",
     *                      type="array",
     *                      @OA\Items(ref="#/components/schemas/PueblosMagicos")
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
class PueblosMagicosController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $pueblosMagicos = PueblosMagicos::with('direccion')->get();

        return response()->json(['data' => $pueblosMagicos]);
    }
}
