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
            'data.servicio_detalles.pagina_web' => ['sometimes','required','url:https'],
            'data.servicio_detalles.telefono' => ['sometimes','required'],
            'data.coordenadas.longitud' => ['sometimes','required'],
            'data.coordenadas.latitud' => ['sometimes','required'],
            'data.horarios.horario_inicio' => ['sometimes','required'],
            'data.horarios.horario_fin' => ['sometimes','required'],
            'data.imagenes_eliminar.*.id' => ['required_with:data.imagenes_eliminar.*.nombre','exists:imagenes,id'],
            'data.imagenes_eliminar.*.nombre' => ['required_with:data.imagenes_eliminar.*.id','exists:imagenes,nombre'],
            'data.imagen_principal'=>['sometimes','required', 'mimes:jpg,png', 'max:20480'],
            'data.imagenes_nuevas.*' => ['sometimes','required', 'mimes:jpg,png', 'max:20480'],
            'data.direccion.calle' => ['sometimes','required'],
            'data.direccion.municipio' => ['sometimes','required'],
            'data.direccion.CP' => ['sometimes','required'],
            'data.direccion.int' => ['sometimes','required'],
            'data.direccion.ext' => ['sometimes','nullable'],
            'data.direccion.colonia' => ['sometimes','required'],
            'data.direccion.id_estado' => ['sometimes','required','exists:estados,id'],
            'data.observaciones.observacion' => ['sometimes','boolean']
        ];
    }
    public function messages(): array
    {
        return [
            'data.servicio.id_tipo_servicio.required' => 'El tipo de servicio es requerido.',
            'data.servicio.id_tipo_servicio.exists' => 'El tipo de servicio no existe.',
            'data.servicio.id_usuario.required' => 'El usuario es requerido.',
            'data.servicio.id_usuario.exists' => 'El usuario no existe.',
            'data.servicio.id_pueblo.required' => 'El pueblo mágico es requerido.',
            'data.servicio.id_pueblo.exists' => 'El pueblo mágico no existe.',
            'data.servicio.id_estatus.required' => 'El estatus es requerido.',
            'data.servicio.id_estatus.exists' => 'El estatus no existe.',
            'data.servicio_detalles.dias_servicio.required' => 'Los días de servicio son requeridos.',
            'data.servicio_detalles.dias_servicio.min' => 'Los días de servicio deben tener al menos 5 caracteres.',
            'data.servicio_detalles.dias_servicio.max' => 'Los días de servicio no deben exceder los 20 caracteres.',
            'data.servicio_detalles.precios.required' => 'Los precios son requeridos.',
            'data.servicio_detalles.titulo.required' => 'El título es requerido.',
            'data.servicio_detalles.titulo.max' => 'El título no debe exceder los 100 caracteres.',
            'data.servicio_detalles.descripcion.required' => 'La descripción es requerida.',
            'data.servicio_detalles.pagina_web.required' => 'La página web es requerida.',
            'data.servicio_detalles.pagina_web.url' => 'La página web debe ser una URL válida que comience con "https".',
            'data.servicio_detalles.telefono.required' => 'El teléfono es requerido.',
            'data.coordenadas.longitud.required' => 'La longitud es requerida.',
            'data.coordenadas.latitud.required' => 'La latitud es requerida.',
            'data.horarios.horario_inicio.required' => 'El horario de inicio es requerido.',
            'data.horarios.horario_fin.required' => 'El horario de fin es requerido.',
            'data.imagenes_eliminar.*.id.required_with' => 'El ID de la imagen a eliminar es requerido.',
            'data.imagenes_eliminar.*.id.exists' => 'La imagen a eliminar no existe.',
            'data.imagenes_eliminar.*.nombre.required_with' => 'El nombre de la imagen a eliminar es requerido.',
            'data.imagenes_eliminar.*.nombre.exists' => 'La imagen a eliminar no existe.',
            'data.imagen_principal.required' => 'La imagen principal es requerida.',
            'data.imagen_principal.mimes' => 'La imagen principal debe ser un archivo JPG o PNG.',
            'data.imagen_principal.max' => 'La imagen principal no debe exceder los 20MB.',
            'data.imagenes_nuevas.*.required' => 'Las imágenes nuevas son requeridas.',
            'data.imagenes_nuevas.*.mimes' => 'Las imágenes nuevas deben ser archivos JPG o PNG.',
            'data.imagenes_nuevas.*.max' => 'Las imágenes nuevas no deben exceder los 20MB.',
            'data.direccion.calle.required' => 'La calle es requerida.',
            'data.direccion.municipio.required' => 'El municipio es requerido.',
            'data.direccion.CP.required' => 'El código postal es requerido.',
            'data.direccion.ext.required' => 'El número exterior  es requerido.',
            'data.direccion.int.nullable' => 'El número interior debe ser un valor válido.',
            'data.direccion.colonia.required' => 'La colonia es requerida.',
            'data.direccion.id_estado.required' => 'El estado es requerido.',
            'data.direccion.id_estado.exists' => 'El estado no existe.',
        ];
    }
    protected function failedValidation(Validator $validator) {
        throw new HttpResponseException(response()->json([
            'data' => $validator->errors(),
        ], 422));
    }
}
