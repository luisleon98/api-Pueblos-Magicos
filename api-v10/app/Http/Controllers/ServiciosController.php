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
use App\Traits\RegistraBitacora;
use App\Models\PueblosSolicitudes;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\File;
use Intervention\Image\Facades\Image;
use App\Http\Requests\PutServicioRequest;
use App\Http\Requests\RegistroServicioRequest;

class ServiciosController extends Controller
{
    use RegistraBitacora;
    /**
     * @OA\Post(
     *     path="/api/servicios/registrar",
     *     summary="Crea un nuevo servicio",
     *          tags={"Servicios"},
     * *     security={{"bearerAuth":{}}},
     *     @OA\RequestBody(
     *         description="Datos necesarios para crear una nueva festividad",
     *         required=true,
     *         @OA\JsonContent(
     *             type="object",
     *             @OA\Property(
     *                 property="data",
     *                 type="object",
     *                 @OA\Property(property="id_tipo_servicio", type="integer", example=1),
     *                 @OA\Property(property="calle", type="string", example="Calle 123"),
     *                 @OA\Property(property="municipio", type="string", example="Ciudad de México"),
     *                 @OA\Property(property="CP", type="string", example="06720"),
     *                 @OA\Property(property="int", type="string", example="1"),
     *                 @OA\Property(property="ext", type="string", example="2"),
     *                 @OA\Property(property="colonia", type="string", example="Roma Norte"),
     *                 @OA\Property(property="dias_servicio", type="string", example="Lunes a Viernes"),
     *                 @OA\Property(property="horario_inicio", type="string", example="09:00"),
     *                 @OA\Property(property="horario_fin", type="string", example="18:00"),
     *                 @OA\Property(property="precio", type="string", example="100-200"),
     *                 @OA\Property(property="titulo", type="string", example="Fiesta de la Primavera"),
     *                 @OA\Property(property="descripcion", type="string", example="Una descripción detallada de la festividad"),
     *                 @OA\Property(property="latitud", type="string", example="19.4326"),
     *                 @OA\Property(property="longitud", type="string", example="99.1332"),
     *                 @OA\Property(property="imgPrincipal", type="string", format="binary"),
     *                 @OA\Property(property="arrayGaleria", type="array", @OA\Items(type="string", format="binary")),
     *                 @OA\Property(property="id_estado", type="integer", example=1),
     *                 @OA\Property(property="id_usuario", type="integer", example=1),
     *                 @OA\Property(property="id_pueblo", type="integer", example=1),
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
        DB::beginTransaction();
        $coordenadas = Coordenadas::create([
            'longitud' => $data['longitud'],
            'latitud' => $data['latitud']
        ]);
        $this->registrarEnBitacora([
            'movimiento' => 'CREATE',
            'tabla_afectada' => 'Coordenadas',
            'id_registro_afectado' => $coordenadas->id,
            'id_usuario' => $request->user()->id
        ]);
        $horarios = Horarios::create([
            'horario_inicio' => $data['horario_inicio'],
            'horario_fin' => $data['horario_fin']
        ]);
        $this->registrarEnBitacora([
            'movimiento' => 'CREATE',
            'tabla_afectada' => 'Horarios',
            'id_registro_afectado' => $horarios->id,
            'id_usuario' => $request->user()->id
        ]);
        $direccion = Direcciones::create([
            'calle' => $data['calle'],
            'municipio' => $data['municipio'],
            'CP' => $data['CP'],
            'int' => isset($data['int']) ? $data['int'] : null,
            'ext' => $data['ext'],
            'colonia' => $data['colonia'],
            'id_estado' => $data['id_estado'],
        ]);
        $this->registrarEnBitacora([
            'movimiento' => 'CREATE',
            'tabla_afectada' => 'Direcciones',
            'id_registro_afectado' => $direccion->id,
            'id_usuario' => $request->user()->id
        ]);
        $servicio = Servicios::create([
            'id_tipo_servicio' => $data['id_tipo_servicio'],
            'id_direccion' => $direccion->id,
            'id_usuario' => $data['id_usuario'],
            'id_pueblo' => $data['id_pueblo'],
            'id_estatus' => 1
        ]);
        $this->registrarEnBitacora([
            'movimiento' => 'CREATE',
            'tabla_afectada' => 'Servicios',
            'id_registro_afectado' => $servicio->id,
            'id_usuario' => $request->user()->id
        ]);
        $servicioDetalle = ServicioDetalle::create([
            'dias_servicio' => isset($data['dias_servicio']) ? $data['dias_servicio'] : null,
            'precios' => $data['precio'],
            'titulo' => $data['titulo'],
            'descripcion' => $data['descripcion'],
            'telefono' => $data['telefono'],
            'pagina_web' => isset($data['pagina_web']) ? $data['pagina_web'] : null,
            'id_coordenadas' => $coordenadas->id,
            'id_servicio' => $servicio->id,
            'id_horarios' => $horarios->id,
            'fecha_inicio' => isset($data['fecha_inicio']) ? $data['fecha_inicio'] : null,
            'fecha_fin' => isset($data['fecha_fin']) ? $data['fecha_fin'] : null,
        ]);
        $this->registrarEnBitacora([
            'movimiento' => 'CREATE',
            'tabla_afectada' => 'Servicio_Detalles',
            'id_registro_afectado' => $servicioDetalle->id,
            'id_usuario' => $request->user()->id
        ]);

        $puebloSolicitud = PueblosSolicitudes::create([
            'id_servicio'  => $servicio->id,
            'id_pueblo_magico' => $data['id_pueblo'],
            'id_tipo_servicio' => $data['id_tipo_servicio']
        ]);
        $this->registrarEnBitacora([
            'movimiento' => 'CREATE',
            'tabla_afectada' => 'Pueblos_Solicitudes',
            'id_registro_afectado' => $puebloSolicitud->id,
            'id_usuario' => $request->user()->id
        ]);

        $imagenPrincipal = $this->procesarImagen($data['imgPrincipal']);
        $this->guardarImagenesBD($imagenPrincipal, 1, $servicio->id);

        $nombresImagenes = $this->procesarImagenes($data['arrayGaleria']);
        foreach ($nombresImagenes as $imagen) {
            $this->guardarImagenesBD($imagen, 2, $servicio->id);
        }

        DB::commit();
        return response()->json([
            "data" => ["success" => "ok"]
        ]);
    }
    public function procesarImagen($imagen)
    {
        // Generar un nombre único para el archivo
        $nombreImagen = Str::uuid() . ".webp";

        // Guardar el archivo en la carpeta uploads
        $imagenServidor = Image::make($imagen);
        $imagenPath = public_path('uploads') . '/' . $nombreImagen;
        $calidad = 60;
        $imagenServidor->save($imagenPath, $calidad, 'webp');

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
        $this->registrarEnBitacora([
            'movimiento' => 'CREATE',
            'tabla_afectada' => 'Imagenes',
            'id_registro_afectado' => $imagen->id,
            'id_usuario' => auth()->id()
        ]);

        $servicioImagen = ServiciosImagen::create([
            'id_servicio' => $idServicio,
            'id_imagen' => $imagen->id
        ]);
        $this->registrarEnBitacora([
            'movimiento' => 'CREATE',
            'tabla_afectada' => 'Servicios_Imagenes',
            'id_registro_afectado' => $servicioImagen->id,
            'id_usuario' => auth()->id()
        ]);
    }
    /**
     * Display the specified resource.
     */
    /**
     * @OA\Get(
     *     path="/api/servicios/{id}",
     *     summary="Muestra un servicio específico",
     *     tags={"Servicios"},
     * *     security={{"bearerAuth":{}}},
     *     @OA\Parameter(
     *         name="id",
     *         in="path",
     *         required=true,
     *         description="ID del servicio a buscar",
     *         @OA\Schema(
     *             type="string"
     *         )
     *     ),
     *     @OA\Response(
     *         response=200,
     *         description="Operación exitosa, servicio encontrado",
     *         @OA\JsonContent(
     *             type="object",
     *             @OA\Property(
     *                 property="data",
     *                 type="object",
     *                 @OA\Property(
     *                     property="servicio",
     *                     type="array",
     *                     @OA\Items(ref="#/components/schemas/Servicios")
     *                 )
     *             )
     *         )
     *     ),
     *     @OA\Response(
     *         response=404,
     *         description="Servicio no encontrado"
     *     )
     * )
     */

    public function show(string $id)
    {
        $servicio = Servicios::where('id', $id)->with(['tipoServicio', 'direccion.estado', 'usuario', 'pueblo', 'detalleServicio.coordenada', 'detalleServicio.horario', 'imagenes.tipo', 'estatus', 'observaciones'])->get();
        $servicio->transform(function ($servicio) {
            return $this->addFileToImages([$servicio])[0];
        });
        return response()->json([
            "data" => ["servicio" => $servicio]
        ]);
    }
    /**
     * Remove the specified resource from storage.
     */
    /**
     * @OA\Delete(
     *     path="/api/servicios/{id}",
     *     summary="Elimina un servicio específico",
     *     tags={"Servicios"},
     *     security={{"bearerAuth":{}}},
     *     @OA\Parameter(
     *         name="id",
     *         in="path",
     *         required=true,
     *         description="ID del servicio a eliminar",
     *         @OA\Schema(
     *             type="string"
     *         )
     *     ),
     *     @OA\Response(
     *         response=200,
     *         description="Operación exitosa, servicio eliminado",
     *         @OA\JsonContent(
     *             type="object",
     *             @OA\Property(
     *                 property="data",
     *                 type="object",
     *                 @OA\Property(
     *                     property="servicio",
     *                     type="object",
     *                     ref="#/components/schemas/Servicios"
     *                 )
     *             )
     *         )
     *     ),
     *     @OA\Response(
     *         response=404,
     *         description="Servicio no encontrado"
     *     )
     * )
     */
    public function destroy(Request $request, Servicios $servicio)
    {
        if ($request->user()->id !== $servicio->id_usuario && !in_array($request->user()->id_tipo_usuario, [1, 2])) {

            return response()->json([
                "data" => ["error" => 'No tienes permisos para realizar esta accion ']
            ], 403);
        }
        DB::beginTransaction();
        // Eliminar y registrar detalles del servicio
        if ($detalle = $servicio->detalleServicio) {
            // Eliminar y registrar coordenadas
            if ($coordenada = $detalle->coordenada) {
                $coordenada->delete();
                $this->registrarEnBitacora([
                    'movimiento' => 'DELETE',
                    'tabla_afectada' => 'Coordenadas',
                    'id_registro_afectado' => $coordenada->id,
                    'id_usuario' => auth('sanctum')->user()->id
                ]);
            }

            // Eliminar y registrar horarios
            if ($horario = $detalle->horario) {
                $horario->delete();
                $this->registrarEnBitacora([
                    'movimiento' => 'DELETE',
                    'tabla_afectada' => 'Horarios',
                    'id_registro_afectado' => $horario->id,
                    'id_usuario' => auth('sanctum')->user()->id
                ]);
            }

            $detalle->delete();
            $this->registrarEnBitacora([
                'movimiento' => 'DELETE',
                'tabla_afectada' => 'Servicio_Detalles',
                'id_registro_afectado' => $detalle->id,
                'id_usuario' => auth('sanctum')->user()->id
            ]);
        }

        $imagenesIds = $servicio->imagenes->pluck('id')->toArray();
        foreach ($imagenesIds as $imagenId) {
            // Eliminar el registro de la tabla intermedia
            $servicioImagen = ServiciosImagen::where('id_servicio', $servicio->id)
                ->where('id_imagen', $imagenId)
                ->first();
            if ($servicioImagen) {
                $servicioImagenId = $servicioImagen->id;
                $servicioImagen->delete();
                $this->registrarEnBitacora([
                    'movimiento' => 'DELETE',
                    'tabla_afectada' => 'ServiciosImagen',
                    'id_registro_afectado' => $servicioImagenId,
                    'id_usuario' => auth('sanctum')->user()->id
                ]);
            }

            // Eliminar la imagen
            $imagen = Imagen::find($imagenId);
            if ($imagen) {
                $imagen->delete();
                $this->registrarEnBitacora([
                    'movimiento' => 'DELETE',
                    'tabla_afectada' => 'Imagen',
                    'id_registro_afectado' => $imagenId,
                    'id_usuario' => auth('sanctum')->user()->id
                ]);
            }
        }

        // Eliminar y registrar dirección
        if ($direccion = $servicio->direccion) {
            $direccion->delete();
            $this->registrarEnBitacora([
                'movimiento' => 'DELETE',
                'tabla_afectada' => 'Direcciones',
                'id_registro_afectado' => $direccion->id,
                'id_usuario' => auth('sanctum')->user()->id
            ]);
        }

        // Eliminar y registrar solicitud
        if ($solicitud = $servicio->solicitud) {
            $solicitud->delete();
            $this->registrarEnBitacora([
                'movimiento' => 'DELETE',
                'tabla_afectada' => 'Pueblos_Solicitudes',
                'id_registro_afectado' => $solicitud->id,
                'id_usuario' => auth('sanctum')->user()->id
            ]);
        }

        // Eliminar y registrar observaciones
        if ($observacion = $servicio->observaciones) {
            $observacion->delete();
            $this->registrarEnBitacora([
                'movimiento' => 'DELETE',
                'tabla_afectada' => 'Observaciones',
                'id_registro_afectado' => $observacion->id,
                'id_usuario' => auth('sanctum')->user()->id
            ]);
        }

        // Finalmente, eliminar y registrar el servicio
        $servicio->delete();
        $this->registrarEnBitacora([
            'movimiento' => 'DELETE',
            'tabla_afectada' => 'Servicios',
            'id_registro_afectado' => $servicio->id,
            'id_usuario' => auth('sanctum')->user()->id
        ]);
        DB::commit();
        return response()->json([
            "data" => ["servicio" => $servicio]
        ]);
    }
    /**
     * @OA\Get(
     *     path="/api/servicios",
     *     summary="Obtiene una vista previa de los servicios",
     *     tags={"Servicios"},
     *     security={{"bearerAuth":{}}},
     *     @OA\Parameter(
     *         name="page",
     *         in="query",
     *         description="Número de página para la paginación",
     *         @OA\Schema(
     *             type="integer"
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
     *                     property="servicios",
     *                     type="array",
     *                     @OA\Items(ref="#/components/schemas/Servicios")
     *                 )
     *             )
     *         )
     *     ),
     *     @OA\Response(
     *         response=401,
     *         description="No autenticado"
     *     )
     * )
     */
    public function getAllPreview(Request $request)
    {
        $user = $request->user();
        $query = Servicios::with([
            'pueblo' => function ($query) {
                $query->select('pueblos_magicos.id', 'pueblos_magicos.nombre');
            },
            'detalleServicio' => function ($query) {
                $query->select('servicio_detalles.id', 'servicio_detalles.titulo', 'servicio_detalles.descripcion', 'servicio_detalles.id_servicio');
            },
            'imagenes' => function ($query) {
                $query->select('imagenes.id', 'imagenes.nombre');
            },
            'estatus' => function ($query) {
                $query->select('id', 'estado');
            },
            'tipoServicio' => function ($query) {
                $query->select('id', 'servicio');
            }
        ]);
        if (in_array($user->id_tipo_usuario, [3,])) {
            $query->where('id_usuario', $user->id);
        }
        $servicios = $query->orderBy('id')->paginate(env('PAGINATION_LIMIT', 5));
        $servicios->getCollection()->transform(function ($servicio) {
            return $this->addFileToImages([$servicio])[0];
        });
        return response()->json([
            "data" => ["servicios" => $servicios]
        ]);
    }
    public function addFileToImages($servicios)
    {
        foreach ($servicios as $servicio) {
            if (isset($servicio->imagenes)) {
                foreach ($servicio->imagenes as $imagen) {
                    $path = storage_path(env('STORAGE_PATH', '../public/uploads/') . $imagen->nombre);
                    if (File::exists($path)) {
                        $contenido = file_get_contents($path);
                        $imagen->archivo = base64_encode($contenido);
                    } else {
                        $imagen->archivo = null;
                    }
                }
            }
        }
        return $servicios;
    }
    /**
     * @OA\Get(
     *     path="/api/servicios/filtrar/estatus/{id_estatus}",
     *     summary="Obtiene una vista previa de los servicios filtrada por el estado solicitado",
     *     tags={"Servicios"},
     *     security={{"bearerAuth":{}}},
     * @OA\Parameter(
     *         name="id_estatus",
     *         in="path",
     *         required=true,
     *         description="ID del estado de los servicios a buscar",
     *         @OA\Schema(
     *             type="string"
     *         )
     *     ),
     *     @OA\Parameter(
     *         name="page",
     *         in="query",
     *         description="Número de página para la paginación",
     *         @OA\Schema(
     *             type="integer"
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
     *                     property="servicios",
     *                     type="array",
     *                     @OA\Items(ref="#/components/schemas/Servicios")
     *                 )
     *             )
     *         )
     *     ),
     *     @OA\Response(
     *         response=401,
     *         description="No autenticado"
     *     )
     * )
     */
    public function getServiciosByEstatus(Request $request, $id_estatus)
    {
        $user = $request->user();
        $query = Servicios::where('id_estatus', $id_estatus)->with([
            'pueblo' => function ($query) {
                $query->select('pueblos_magicos.id', 'pueblos_magicos.nombre');
            },
            'detalleServicio' => function ($query) {
                $query->select('servicio_detalles.id', 'servicio_detalles.titulo', 'servicio_detalles.descripcion', 'servicio_detalles.id_servicio');
            },
            'imagenes' => function ($query) {
                $query->select('imagenes.id', 'imagenes.nombre');
            },
            'estatus' => function ($query) {
                $query->select('id', 'estado');
            },
            'tipoServicio' => function ($query) {
                $query->select('id', 'servicio');
            }
        ]);
        if (in_array($user->id_tipo_usuario, [3,])) {
            $query->where('id_usuario', $user->id);
        }
        $servicios = $query->orderBy('id')->paginate(env('PAGINATION_LIMIT', 5));
        $servicios->getCollection()->transform(function ($servicio) {
            return $this->addFileToImages([$servicio])[0];
        });
        return response()->json([
            "data" => ["servicios" => $servicios]
        ]);
    }
    /**
     * @OA\Get(
     *     path="/api/servicios/filtrar/pueblo/magico/{id_pueblo}",
     *     summary="Obtiene una vista previa de los servicios filtrada por el pueblo magico al que pertenece",
     *     tags={"Servicios"},
     *     security={{"bearerAuth":{}}},
     * @OA\Parameter(
     *         name="id_pueblo",
     *         in="path",
     *         required=true,
     *         description="ID del pueblo de los servicios a buscar",
     *         @OA\Schema(
     *             type="string"
     *         )
     *     ),
     *     @OA\Parameter(
     *         name="page",
     *         in="query",
     *         description="Número de página para la paginación",
     *         @OA\Schema(
     *             type="integer"
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
     *                     property="servicios",
     *                     type="array",
     *                     @OA\Items(ref="#/components/schemas/Servicios")
     *                 )
     *             )
     *         )
     *     ),
     *     @OA\Response(
     *         response=401,
     *         description="No autenticado"
     *     )
     * )
     */
    public function getServiciosByPueblo(Request $request, $id_pueblo)
    {
        $user = $request->user();
        $query = Servicios::where('id_pueblo', $id_pueblo)->with([
            'pueblo' => function ($query) {
                $query->select('pueblos_magicos.id', 'pueblos_magicos.nombre');
            },
            'detalleServicio' => function ($query) {
                $query->select('servicio_detalles.id', 'servicio_detalles.titulo', 'servicio_detalles.descripcion', 'servicio_detalles.id_servicio');
            },
            'imagenes' => function ($query) {
                $query->select('imagenes.id', 'imagenes.nombre');
            },
            'estatus' => function ($query) {
                $query->select('id', 'estado');
            },
            'tipoServicio' => function ($query) {
                $query->select('id', 'servicio');
            }
        ]);
        if (in_array($user->id_tipo_usuario, [3,])) {
            $query->where('id_usuario', $user->id);
        }
        $servicios = $query->orderBy('id')->paginate(env('PAGINATION_LIMIT', 5));
        $servicios->getCollection()->transform(function ($servicio) {
            return $this->addFileToImages([$servicio])[0];
        });
        return response()->json([
            "data" => ["servicios" => $servicios]
        ]);
    }
    /**
     * @OA\Get(
     *     path="/api/servicios/filtrar/categoria/{id_categoria}",
     *     summary="Obtiene una vista previa de los servicios filtrada por el tipo de servicio",
     *     tags={"Servicios"},
     *     security={{"bearerAuth":{}}},
     * @OA\Parameter(
     *         name="id_categoria",
     *         in="path",
     *         required=true,
     *         description="ID del tipo deservicio a buscar",
     *         @OA\Schema(
     *             type="string"
     *         )
     *     ),
     *     @OA\Parameter(
     *         name="page",
     *         in="query",
     *         description="Número de página para la paginación",
     *         @OA\Schema(
     *             type="integer"
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
     *                     property="servicios",
     *                     type="array",
     *                     @OA\Items(ref="#/components/schemas/Servicios")
     *                 )
     *             )
     *         )
     *     ),
     *     @OA\Response(
     *         response=401,
     *         description="No autenticado"
     *     )
     * )
     */
    public function getServiciosByCategoria(Request $request, $id_categoria)
    {
        $user = $request->user();
        $query = Servicios::where('id_tipo_servicio', $id_categoria)->with([
            'pueblo' => function ($query) {
                $query->select('pueblos_magicos.id', 'pueblos_magicos.nombre');
            },
            'detalleServicio' => function ($query) {
                $query->select('servicio_detalles.id', 'servicio_detalles.titulo', 'servicio_detalles.descripcion', 'servicio_detalles.id_servicio');
            },
            'imagenes' => function ($query) {
                $query->select('imagenes.id', 'imagenes.nombre');
            },
            'estatus' => function ($query) {
                $query->select('id', 'estado');
            },
            'tipoServicio' => function ($query) {
                $query->select('id', 'servicio');
            }
        ]);
        if (in_array($user->id_tipo_usuario, [3,])) {
            $query->where('id_usuario', $user->id);
        }
        $servicios = $query->orderBy('id')->paginate(env('PAGINATION_LIMIT', 5));
        $servicios->getCollection()->transform(function ($servicio) {
            return $this->addFileToImages([$servicio])[0];
        });
        return response()->json([
            "data" => ["servicios" => $servicios]
        ]);
    }
    /**
     * @OA\Get(
     *     path="/api/servicios/filtrar/{id_estatus}/{id_pueblo}/{id_categoria}",
     *     summary="Obtiene una vista previa de los servicios filtrada por el pueblo magico, el estado y la categoria",
     *     tags={"Servicios"},
     *     security={{"bearerAuth":{}}},
     * @OA\Parameter(
     *         name="id_estatus",
     *         in="path",
     *         required=true,
     *         description="ID del estado de los servicios a buscar",
     *         @OA\Schema(
     *             type="string"
     *         )
     *     ),
     * @OA\Parameter(
     *         name="id_pueblo",
     *         in="path",
     *         required=true,
     *         description="ID del pueblo de los servicios a buscar",
     *         @OA\Schema(
     *             type="string"
     *         )
     *     ),
     * @OA\Parameter(
     *         name="id_categoria",
     *         in="path",
     *         required=true,
     *         description="ID del tipo deservicio a buscar",
     *         @OA\Schema(
     *             type="string"
     *         )
     *     ),
     *     @OA\Parameter(
     *         name="page",
     *         in="query",
     *         description="Número de página para la paginación",
     *         @OA\Schema(
     *             type="integer"
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
     *                     property="servicios",
     *                     type="array",
     *                     @OA\Items(ref="#/components/schemas/Servicios")
     *                 )
     *             )
     *         )
     *     ),
     *     @OA\Response(
     *         response=401,
     *         description="No autenticado"
     *     )
     * )
     */
    public function getServiciosFiltradoEspecifico(Request $request, $id_estatus, $id_pueblo, $id_categoria)
    {
        $user = $request->user();
        $query = Servicios::where('id_estatus', $id_estatus)->where('id_pueblo', $id_pueblo)->where('id_tipo_servicio', $id_categoria)->with([
            'pueblo' => function ($query) {
                $query->select('pueblos_magicos.id', 'pueblos_magicos.nombre');
            },
            'detalleServicio' => function ($query) {
                $query->select('servicio_detalles.id', 'servicio_detalles.titulo', 'servicio_detalles.descripcion', 'servicio_detalles.id_servicio');
            },
            'imagenes' => function ($query) {
                $query->select('imagenes.id', 'imagenes.nombre');
            },
            'estatus' => function ($query) {
                $query->select('id', 'estado');
            },
            'tipoServicio' => function ($query) {
                $query->select('id', 'servicio');
            }
        ]);
        if (in_array($user->id_tipo_usuario, [3,])) {
            $query->where('id_usuario', $user->id);
        }
        $servicios = $query->orderBy('id')->paginate(env('PAGINATION_LIMIT', 5));
        $servicios->getCollection()->transform(function ($servicio) {
            return $this->addFileToImages([$servicio])[0];
        });
        return response()->json([
            "data" => ["servicios" => $servicios]
        ]);
    }
    /**
     * @OA\Put(
     *     path="/api/servicios/{servicio}",
     *     summary="Actualiza un servicio específico",
     *     tags={"Servicios"},
     *     security={{"bearerAuth":{}}},
     *     @OA\Parameter(
     *         name="servicio",
     *         in="path",
     *         required=true,
     *         description="ID del servicio a actualizar",
     *         @OA\Schema(
     *             type="string"
     *         )
     *     ),
     *     @OA\RequestBody(
     *         required=true,
     *         @OA\JsonContent(
     *             required={"data"},
     *             @OA\Property(
     *                 property="data",
     *                 type="object",
     *                 @OA\Property(
     *                     property="servicio",
     *                     type="object",
     *                     @OA\Property(
     *                         property="id_tipo_servicio",
     *                         type="string"
     *                     ),
     *                     @OA\Property(
     *                         property="id_usuario",
     *                         type="string"
     *                     ),
     *                     @OA\Property(
     *                         property="id_pueblo",
     *                         type="string"
     *                     ),
     *                     @OA\Property(
     *                         property="id_estatus",
     *                         type="string"
     *                     )
     *                 ),
     *                 @OA\Property(
     *                     property="servicio_detalles",
     *                     type="object",
     *                     @OA\Property(
     *                         property="dias_servicio",
     *                         type="string"
     *                     ),
     *                     @OA\Property(
     *                         property="precio",
     *                         type="string"
     *                     ),
     *                     @OA\Property(
     *                         property="titulo",
     *                         type="string"
     *                     ),
     *                     @OA\Property(
     *                         property="descripcion",
     *                         type="string"
     *                     )
     *                 ),
     *                 @OA\Property(
     *                     property="coordenadas",
     *                     type="object",
     *                     @OA\Property(
     *                         property="longitud",
     *                         type="string"
     *                     ),
     *                     @OA\Property(
     *                         property="latitud",
     *                         type="string"
     *                     )
     *                 ),
     *                 @OA\Property(
     *                     property="horarios",
     *                     type="object",
     *                     @OA\Property(
     *                         property="horario_inicio",
     *                         type="string"
     *                     ),
     *                     @OA\Property(
     *                         property="horario_fin",
     *                         type="string"
     *                     )
     *                 ),
     *                 @OA\Property(
     *                     property="imagenes_eliminar",
     *                     type="array",
     *                     @OA\Items(
     *                         type="object",
     *                         required={"id", "nombre"},
     *                         @OA\Property(
     *                             property="id",
     *                             type="string"
     *                         ),
     *                         @OA\Property(
     *                             property="nombre",
     *                             type="string"
     *                         )
     *                     )
     *                 ),
     *                 @OA\Property(
     *                     property="imagen_principal",
     *                     type="string",
     *                     format="binary"
     *                 ),
     *                 @OA\Property(
     *                     property="imagenes_nuevas",
     *                     type="array",
     *                     @OA\Items(
     *                         type="string",
     *                         format="binary"
     *                     )
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
     *                     property="servicio",
     *                     type="object",
     *                     ref="#/components/schemas/Servicios"
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
    public function updateServicio(PutServicioRequest $request, Servicios $servicio)
    {
        if ($request->user()->id !== $servicio->id_usuario && !in_array($request->user()->id_tipo_usuario, [1, 2])) {

            return response()->json([
                "data" => ["error" => 'No tienes permisos para realizar esta accion ']
            ], 403);
        }
        $data = $request->validated();

        $data = $data['data'];
        DB::beginTransaction();
        if (isset($data['servicio'])) {
            $servicio->update($data['servicio']);
            $this->registrarEnBitacora([
                'movimiento' => 'UPDATE',
                'tabla_afectada' => 'Servicios',
                'id_registro_afectado' => $servicio->id,
                'id_usuario' => $request->user()->id
            ]);
        }
        if (isset($data['servicio_detalles'])) {
            $detalles = $servicio->detalleServicio;
            $detalles->update($data['servicio_detalles']);
            $this->registrarEnBitacora([
                'movimiento' => 'UPDATE',
                'tabla_afectada' => 'Servicios_detalles',
                'id_registro_afectado' => $detalles->id,
                'id_usuario' => $request->user()->id
            ]);
        }
        if (isset($data['coordenadas'])) {
            $detalles = $servicio->detalleServicio;
            $coordenadas = $detalles->coordenada;
            $coordenadas->update($data['coordenadas']);
            $this->registrarEnBitacora([
                'movimiento' => 'UPDATE',
                'tabla_afectada' => 'Coordenadas',
                'id_registro_afectado' => $coordenadas->id,
                'id_usuario' => $request->user()->id
            ]);
        }
        if (isset($data['horarios'])) {
            $detalles = $servicio->detalleServicio;
            $horarios = $detalles->horario;
            $horarios->update($data['horarios']);
            $this->registrarEnBitacora([
                'movimiento' => 'UPDATE',
                'tabla_afectada' => 'Horarios',
                'id_registro_afectado' => $horarios->id,
                'id_usuario' => $request->user()->id
            ]);
        }
        if (isset($data['imagenes_eliminar'])) {

            foreach ($data['imagenes_eliminar'] as $imagen) {
                $imagenId = $imagen['id'];
                $nombreArchivo = $imagen['nombre'];

                // Eliminar la relación en la tabla intermedia
                $serviciosImagen = ServiciosImagen::where('id_servicio', $servicio->id)
                    ->where('id_imagen', $imagenId)->first();

                $serviciosImagen->delete();
                $this->registrarEnBitacora([
                    'movimiento' => 'DELETE',
                    'tabla_afectada' => 'Servicios_Imagenes',
                    'id_registro_afectado' => $serviciosImagen->id,
                    'id_usuario' => $request->user()->id
                ]);

                // Eliminar la imagen de la tabla 'imagenes'
                $imagenModel = Imagen::findOrFail($imagenId);
                $imagenModel->delete();
                $this->registrarEnBitacora([
                    'movimiento' => 'DELETE',
                    'tabla_afectada' => 'Imagen',
                    'id_registro_afectado' => $imagenModel->id,
                    'id_usuario' => $request->user()->id
                ]);

                $path = storage_path(env('STORAGE_PATH', '../public/uploads/') . $nombreArchivo);
                if (file_exists($path)) {
                    unlink($path);
                }
            }
        }
        if (isset($data['imagen_principal'])) {
            $imagenPrincipal = $this->procesarImagen($data['imagen_principal']);
            $this->guardarImagenesBD($imagenPrincipal, 1, $servicio->id);
        }
        if (isset($data['imagenes_nuevas'])) {
            $nombresImagenes = $this->procesarImagenes($data['imagenes_nuevas']);
            foreach ($nombresImagenes as $imagen) {
                $this->guardarImagenesBD($imagen, 2, $servicio->id);
            }
        }
        if (isset($data['direccion'])) {
            $direccion = $servicio->direccion;
            $direccion->update($data['direccion']);
            $this->registrarEnBitacora([
                'movimiento' => 'UPDATE',
                'tabla_afectada' => 'Direcciones',
                'id_registro_afectado' => $direccion->id,
                'id_usuario' => $request->user()->id
            ]);
        }
        if (isset($data['observaciones'])) {
            $observacion = $servicio->observaciones;
            $observacion->update(['id_estatus' => '6']);
            $observacion->delete();
            $this->registrarEnBitacora([
                'movimiento' => 'DELETE',
                'tabla_afectada' => 'Observaciones',
                'id_registro_afectado' => $observacion->id,
                'id_usuario' => $request->user()->id
            ]);
            $servicio->update(['id_estatus' => '1']);
            $this->registrarEnBitacora([
                'movimiento' => 'UPDATE',
                'tabla_afectada' => 'Servicios',
                'id_registro_afectado' => $servicio->id,
                'id_usuario' => $request->user()->id
            ]);
        }

        DB::commit();
        return response()->json([
            "data" => ["servicio" => $servicio]
        ]);
    }

    /**
     * Obtiene el conteo de servicios según su estado.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\JsonResponse
     *
     * @OA\Get(
     *     path="/api/servicios/conteo/all",
     *     summary="Obtiene el conteo de servicios según su estado",
     *     tags={"Servicios"},
     *     security={{"bearerAuth":{}}},
     *     @OA\Response(
     *         response=200,
     *         description="Operación exitosa",
     *         @OA\JsonContent(
     *             @OA\Property(
     *                 property="data",
     *                 type="object",
     *                 @OA\Property(
     *                     property="en_validacion",
     *                     type="integer",
     *                     description="Cantidad de servicios en validación"
     *                 ),
     *                 @OA\Property(
     *                     property="aceptado",
     *                     type="integer",
     *                     description="Cantidad de servicios aceptados"
     *                 ),
     *                 @OA\Property(
     *                     property="con_observaciones",
     *                     type="integer",
     *                     description="Cantidad de servicios con observaciones"
     *                 )
     *             )
     *         )
     *     ),
     *     @OA\Response(
     *         response=401,
     *         description="No autenticado"
     *     )
     * )
     */
    public function getConteoServicios(Request $request)
    {
        $user = $request->user();

        $baseQuery = Servicios::query();

        if ($user->id_tipo_usuario == 3) {
            $baseQuery->where('id_usuario', $user->id);
        }

        $conteo = [
            'en_validacion' => (clone $baseQuery)->where('id_estatus', 1)->count(),
            'aceptado' => (clone $baseQuery)->where('id_estatus', 2)->count(),
            'con_observaciones' => (clone $baseQuery)->where('id_estatus', 3)->count(),
        ];


        return response()->json(['data' => $conteo]);
    }
}
