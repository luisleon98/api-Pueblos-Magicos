<?php

namespace App\Http\Controllers;

use App\Models\Imagen;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;

class ImagenController extends Controller
{
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
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show($id)
    {
        $imagen = Imagen::find($id);

        if (!$imagen) {
            return response()->json([
                'data'=>["error" => "Imagen no encontrada"]
            ], 404);
        }
        $path = storage_path(env('STORAGE_PATH', '../public/uploads/') . $imagen->nombre);
        if (File::exists($path)) {
            $contenido = file_get_contents($path);
            $imagenb64 = base64_encode($contenido);
        } else {
            $imagenb64 = null;
        }
        return response()->json([
            "data" => ["imagen" => $imagenb64]
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Imagen $imagen)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Imagen $imagen)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Imagen $imagen)
    {
        //
    }
}
