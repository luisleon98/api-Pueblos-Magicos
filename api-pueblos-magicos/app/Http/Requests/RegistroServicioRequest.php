<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Http\Exceptions\HttpResponseException;


class RegistroServicioRequest extends FormRequest
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
            'data.id_tipo_servicio' => ['required','exists:tipos_servicios,id'],
            'data.calle' => ['required'],
            'data.municipio' => ['required'],
            'data.CP' => ['required'],
            'data.int' => ['required'],
            'data.ext' => ['nullable'],
            'data.colonia' => ['required'],
            'data.dias_servicio' => ['required','min:5','max:20'],
            'data.horario_inicio' => ['required'],
            'data.horario_fin' => ['required'],
            'data.precios' => ['required'],
            'data.titulo' => ['required','max:100'],
            'data.descripcion' => ['required'],
            'data.latitud' => ['required'],
            'data.longitud' => ['required'],
            'data.imgPrincipal' => ['required', 'mimes:jpg,png', 'max:20480'],
            'data.arrayGaleria' => ['required', 'array', 'min:1'],
            'data.arrayGaleria.*' => ['required', 'mimes:jpg,png', 'max:20480'],
            'data.id_estado' => ['required','exists:estados,id'],
            'data.id_usuario' => ['required','exists:usuarios,id'],
            'data.id_pueblo' => ['required','exists:pueblos_magicos,id'],

        ];
    }
    public function messages(): array
{
    return [
        'data.id_tipo_servicio.required' => 'El tipo de servicio es requerido',
        'data.id_tipo_servicio.exists' => 'El tipo de servicio no existe',
        'data.calle.required' => 'La calle es requerida',
        'data.municipio.required' => 'El municipio es requerido',
        'data.CP.required' => 'El código postal es requerido',
        'data.int.required' => 'El número interior es requerido',
        'data.ext.nullable' => 'El número exterior debe ser un valor válido',
        'data.colonia.required' => 'La colonia es requerida',
        'data.dias_servicio.required' => 'Los días de servicio son requeridos',
        'data.dias_servicio.min' => 'Los días de servicio deben tener al menos 5 caracteres',
        'data.dias_servicio.max' => 'Los días de servicio no deben exceder los 20 caracteres',
        'data.horario_inicio.required' => 'El horario de inicio es requerido',
        'data.horario_fin.required' => 'El horario de fin es requerido',
        'data.precios.required' => 'Los precios son requeridos',
        'data.titulo.required' => 'El título es requerido',
        'data.titulo.max' => 'El título no debe exceder los 100 caracteres',
        'data.descripcion.required' => 'La descripción es requerida',
        'data.latitud.required' => 'La latitud es requerida',
        'data.longitud.required' => 'La longitud es requerida',
        'data.imgPrincipal.required' => 'La imagen principal es requerida',
        'data.imgPrincipal.mimes' => 'La imagen principal debe ser un archivo JPG o PNG',
        'data.imgPrincipal.max' => 'La imagen principal no debe exceder los 20MB',
        'data.arrayGaleria.required' => 'La galería de imágenes es requerida',
        'data.arrayGaleria.array' => 'La galería de imágenes debe ser un array',
        'data.arrayGaleria.min' => 'La galería de imágenes debe tener al menos 1 imagen',
        'data.arrayGaleria.*.required' => 'Las imágenes de la galería son requeridas',
        'data.arrayGaleria.*.mimes' => 'Las imágenes de la galería deben ser archivos JPG o PNG',
        'data.arrayGaleria.*.max' => 'Las imágenes de la galería no deben exceder los 20MB',
        'data.id_estado.required' => 'El estado es requerido',
        'data.id_estado.exists' => 'El estado no existe',
        'data.id_usuario.required' => 'El usuario es requerido',
        'data.id_usuario.exists' => 'El usuario no existe',
        'data.pueblo.required' => 'El pueblo mágico es requerido',
        'data.pueblo.exists' => 'El pueblo mágico no existe',
    ];
}
    protected function failedValidation(Validator $validator) {
        throw new HttpResponseException(response()->json([
            'data' => $validator->errors(),
        ], 422));
    }
}
