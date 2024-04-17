<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Http\Exceptions\HttpResponseException;


class PutServicioRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'data.servicio.id_tipo_servicio' => ['sometimes','required','exists:tipos_servicios,id'],
            'data.servicio.id_usuario' => ['sometimes','required','exists:usuarios,id'],
            'data.servicio.id_pueblo' => ['sometimes','required','exists:pueblos_magicos,id'],
            'data.servicio.id_estatus' => ['sometimes','required','exists:estatus,id'],
            'data.servicio_detalles.dias_servicio' => ['sometimes','required','min:5','max:20'],
            'data.servicio_detalles.precios' => ['sometimes','required'],
            'data.servicio_detalles.titulo' => ['sometimes','required','max:100'],
            'data.servicio_detalles.descripcion' => ['sometimes','required'],
            'data.coordenadas.longitud' => ['sometimes','required'],
            'data.coordenadas.latitud' => ['sometimes','required'],
            'data.horarios.horario_inicio' => ['sometimes','required'],
            'data.horarios.horario_fin' => ['sometimes','required'],
            'data.imagenes_eliminar.*.id' => ['required_with:data.imagenes_eliminar.*.nombre','exists:imagenes,id'],
            'data.imagenes_eliminar.*.nombre' => ['required_with:data.imagenes_eliminar.*.id','exists:imagenes,nombre'],
            'data.imagen_principal'=>['sometimes','required', 'mimes:jpg,png', 'max:20480'],
            'data.imagenes_nuevas.*' => ['sometimes','required', 'mimes:jpg,png', 'max:20480'],
        ];
    }
    public function messages(): array
{
    return [
        'data.servicio.id_tipo_servicio.required' => 'El campo tipo de servicio es obligatorio.',
        'data.servicio.id_tipo_servicio.exists' => 'El tipo de servicio seleccionado no es válido.',
        'data.servicio.id_usuario.required' => 'El campo usuario es obligatorio.',
        'data.servicio.id_usuario.exists' => 'El usuario seleccionado no es válido.',
        'data.servicio.id_pueblo.required' => 'El campo pueblo mágico es obligatorio.',
        'data.servicio.id_pueblo.exists' => 'El pueblo mágico seleccionado no es válido.',
        'data.servicio.id_estatus.required' => 'El campo estatus es obligatorio.',
        'data.servicio.id_estatus.exists' => 'El estatus seleccionado no es válido.',
        'data.servicio_detalles.dias_servicio.required' => 'El campo días de servicio es obligatorio.',
        'data.servicio_detalles.dias_servicio.min' => 'El número de días de servicio debe ser de al menos 5.',
        'data.servicio_detalles.dias_servicio.max' => 'El número de días de servicio no debe exceder de 20.',
        'data.servicio_detalles.precios.required' => 'El campo precio es obligatorio.',
        'data.servicio_detalles.titulo.required' => 'El campo título es obligatorio.',
        'data.servicio_detalles.titulo.max' => 'El título no debe exceder los 100 caracteres.',
        'data.servicio_detalles.descripcion.required' => 'El campo descripción es obligatorio.',
        'data.coordenadas.longitud.required' => 'El campo longitud es obligatorio.',
        'data.coordenadas.latitud.required' => 'El campo latitud es obligatorio.',
        'data.horarios.horario_inicio.required' => 'El campo horario de inicio es obligatorio.',
        'data.horarios.horario_fin.required' => 'El campo horario de fin es obligatorio.',
        'data.imagenes_eliminar.*.id.required_with' => 'El campo ID de la imagen a eliminar es obligatorio cuando se proporciona el nombre.',
        'data.imagenes_eliminar.*.id.exists' => 'El ID de la imagen a eliminar no es válido.',
        'data.imagenes_eliminar.*.nombre.required_with' => 'El campo nombre de la imagen a eliminar es obligatorio cuando se proporciona el ID.',
        'data.imagenes_eliminar.*.nombre.exists' => 'El nombre de la imagen a eliminar no es válido.',
        'data.imagen_principal.required' => 'El campo imagen principal es obligatorio.',
        'data.imagen_principal.mimes' => 'El archivo de la imagen principal debe ser de tipo JPG o PNG.',
        'data.imagen_principal.max' => 'El tamaño de la imagen principal no debe exceder los 20MB.',
        'data.imagenes_nuevas.*.required' => 'Al menos una imagen nueva es obligatoria.',
        'data.imagenes_nuevas.*.mimes' => 'Los archivos de las imágenes nuevas deben ser de tipo JPG o PNG.',
        'data.imagenes_nuevas.*.max' => 'El tamaño de las imágenes nuevas no debe exceder los 20MB.',
    ];
}
    protected function failedValidation(Validator $validator) {
        throw new HttpResponseException(response()->json([
            'data' => $validator->errors(),
        ], 422));
    }
}
