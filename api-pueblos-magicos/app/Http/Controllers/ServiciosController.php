<?php

namespace App\Http\Controllers;

use App\Models\Imagen;
use App\Models\Horarios;
use App\Models\Servicios;
use App\Models\Coordenadas;
use App\Models\Direcciones;
use Illuminate\Support\Str;

use App\Models\ServicioDetalle;
use App\Models\ServiciosImagen;
use App\Models\PueblosSolicitudes;
use Illuminate\Support\Facades\File;
use Intervention\Image\Facades\Image;
use App\Http\Requests\PutServicioRequest;
use App\Http\Requests\RegistroServicioRequest;

class ServiciosController extends Controller
{
    /**
     * @OA\Post(
     *     path="/api/servicios/registrar",
     *     summary="Crea un nuevo servicio",
     *          tags={"Servicios"},
     * *     security={{"bearerAuth":{}}},
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
            'id_pueblo' => $data['id_pueblo'],
            'id_estatus' => 1
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

        $puebloSolicitud = PueblosSolicitudes::create([
            'id_servicio'  => $servicio->id,
            'id_pueblo_magico' => $data['id_pueblo'],
            'id_tipo_servicio' => $data['id_tipo_servicio']
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
        $servicio = Servicios::where('id', $id)->with(['tipoServicio', 'direccion.estado', 'usuario', 'pueblo', 'detalleServicio.coordenada', 'detalleServicio.horario', 'imagenes.tipo', 'estatus'])->get();
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
    public function destroy(Servicios $servicio)
    {
        $servicio->delete();
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
    public function getAllPreview()
    {
        $servicios = Servicios::with([
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
        ])->paginate(env('PAGINATION_LIMIT', 5));
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
    public function getServiciosByEstatus($id_estatus)
    {
        $servicios = Servicios::where('id_estatus', $id_estatus)->with([
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
        ])->paginate(env('PAGINATION_LIMIT', 5));
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
    public function getServiciosByPueblo($id_pueblo)
    {
        $servicios = Servicios::where('id_pueblo', $id_pueblo)->with([
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
        ])->paginate(env('PAGINATION_LIMIT', 5));
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
    public function getServiciosByCategoria($id_categoria)
    {
        $servicios = Servicios::where('id_tipo_servicio', $id_categoria)->with([
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
        ])->paginate(env('PAGINATION_LIMIT', 5));
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
    public function getServiciosFiltradoEspecifico($id_estatus, $id_pueblo, $id_categoria)
    {
        $servicios = Servicios::where('id_estatus', $id_estatus)->where('id_pueblo', $id_pueblo)->where('id_tipo_servicio', $id_categoria)->with([
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
        ])->paginate(env('PAGINATION_LIMIT', 5));
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

        $data = $request->validated();
        $data = $data['data'];
        if (isset($data['servicio'])) {
            $servicio->update($data['servicio']);
        }
        if (isset($data['servicio_detalles'])) {
            $detalles = $servicio->detalleServicio();
            $detalles->update($data['servicio_detalles']);
        }
        if (isset($data['coordenadas'])) {
            $detalles = $servicio->detalleServicio;
            $coordenadas = $detalles->coordenada;
            $coordenadas->update($data['coordenadas']);
        }
        if (isset($data['horarios'])) {
            $detalles = $servicio->detalleServicio;
            $horarios = $detalles->horario;
            $horarios->update($data['horarios']);
        }
        if (isset($data['imagenes_eliminar'])) {

            foreach ($data['imagenes_eliminar'] as $imagen) {
                $imagenId = $imagen['id'];
                $nombreArchivo = $imagen['nombre'];

                // Eliminar la relación en la tabla intermedia
                ServiciosImagen::where('id_servicio', $servicio->id)
                    ->where('id_imagen', $imagenId)
                    ->delete();

                // Eliminar la imagen de la tabla 'imagenes'
                $imagenModel = Imagen::findOrFail($imagenId);
                $imagenModel->delete();

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
        if(isset($data['direccion'])){
            $direccion = $servicio->direccion();
            $direccion->update($data['direccion']);
        }
        return response()->json([
            "data" => ["servicio" => $servicio]
        ]);
    }
}
