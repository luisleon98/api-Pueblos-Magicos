<?php

namespace App\Http\Controllers;

use App\Models\Imagen;
use App\Models\Horarios;
use App\Models\Servicios;
use App\Models\Coordenadas;
use App\Models\Direcciones;
use Illuminate\Support\Str;

use Illuminate\Http\Request;
use App\Models\ServicioDetalle;
use App\Models\ServiciosImagen;
use Intervention\Image\Facades\Image;
use App\Http\Requests\RegistroServicioRequest;

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
    public function store(RegistroServicioRequest $request)
    {
        $data = $request->validated();
        $data = $data['data'];
        $coordenadas = Coordenadas::create([
            'longitud' => $data['longitud'],
            'latitud' => $data['latitud']
        ]);
        $horarios = Horarios::create([
            'horario_inicio' => $data['horario_inicio'],
            'horario_fin' => $data['horario_fin']
        ]);
        $direccion = Direcciones::create([
            'calle' => $data['calle'],
            'municipio' => $data['municipio'],
            'CP' => $data['CP'],
            'int' => $data['int'],
            'ext' => $data['ext'],
            'colonia' => $data['colonia'],
            'id_estado' => $data['id_estado'],
        ]);
        $servicio = Servicios::create([
            'id_tipo_servicio' => $data['id_tipo_servicio'],
            'id_direccion' => $direccion->id,
            'id_usuario' => $data['id_usuario'],
            'id_pueblo' => $data['id_pueblo']
        ]);
        $servicioDetalle = ServicioDetalle::create([
            'dias_servicio' => $data['dias_servicio'],
            'precios' => $data['precio'],
            'titulo' => $data['titulo'],
            'descripcion' => $data['descripcion'],
            'id_coordenadas' => $coordenadas->id,
            'id_servicio' => $servicio->id,
            'id_horarios' => $horarios->id

        ]);

        $imagenPrincipal = $this->procesarImagen($data['imgPrincipal']);
        $this->guardarImagenesBD($imagenPrincipal, 1, $servicio->id);

        $nombresImagenes = $this->procesarImagenes($data['arrayGaleria']);
        foreach ($nombresImagenes as $imagen) {
            $this->guardarImagenesBD($imagen, 2, $servicio->id);
        }


        return response()->json([
            "data" => ["success" => "ok"]
        ]);
    }
    public function procesarImagen($imagen)
    {
        // Generar un nombre único para el archivo
        $nombreImagen = Str::uuid() . "." . $imagen->extension();

        // Guardar el archivo en la carpeta uploads
        $imagenServidor = Image::make($imagen);
        $imagenPath = public_path('uploads') . '/' . $nombreImagen;
        $imagenServidor->save($imagenPath);

        return $nombreImagen;
    }

    public function procesarImagenes($imagenes)
    {
        $imagenesServidor = [];

        foreach ($imagenes as $imagen) {
            $imagenesServidor[] = $this->procesarImagen($imagen);
        }

        return $imagenesServidor;
    }
    public function guardarImagenesBD($nombreImagen, $idTipoImagen, $idServicio)
    {
        $imagen = Imagen::create([
            'nombre' => $nombreImagen,
            'id_tipo_imagen' => $idTipoImagen
        ]);

        ServiciosImagen::create([
            'id_servicio' => $idServicio,
            'id_imagen' => $imagen->id
        ]);
    }
}
