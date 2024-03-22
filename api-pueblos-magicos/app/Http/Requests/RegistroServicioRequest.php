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
            'data.id_tipo_servicio' => ['required'],
            'data.calle' => ['required'],
            'data.municipio' => ['required'],
            'data.CP' => ['required'],
            'data.int' => ['required'],
            'data.ext' => ['nullable'],
            'data.colonia' => ['required'],
            'data.dias_servicio' => ['required'],
            'data.horarios' => ['required'],
            'data.precios' => ['required'],
            'data.titulo' => ['required'],
            'data.descripcion' => ['required'],
            'data.latitud' => ['required'],
            'data.longitud' => ['required'],
            'data.imgPrincipal' => ['required', 'mimes:jpg,png', 'max:20480'],
            'data.arrayGaleria' => ['required', 'array', 'min:1'],
            'data.arrayGaleria.*' => ['required', 'mimes:jpg,png', 'max:20480'],
            'data.id_estado' => ['required'],
            'data.id_usuario' => ['required'],
            'data.id_pueblo' => ['required'],

        ];
    }
    public function messages()
    {
        return [
            'data.id_tipo_servicio.required' => 'El tipo de servicio es requerido',
            'data.calle.required' => 'La calle es requerida',
            'data.municipio.required' => 'El municipio es requerido',
            'data.CP.required' => 'El código postal es requerido',
            'data.int.required' => 'El número interior es requerido',
            'data.ext.nullable' => 'El número exterior puede estar vacío',
            'data.colonia.required' => 'La colonia es requerida',
            'data.dias_servicio.required' => 'Los días de servicio son requeridos',
            'data.horarios.required' => 'Los horarios son requeridos',
            'data.precios.required' => 'Los precios son requeridos',
            'data.titulo.required' => 'El título es requerido',
            'data.descripcion.required' => 'La descripción es requerida',
            'data.latitud.required' => 'La latitud es requerida',
            'data.longitud.required' => 'La longitud es requerida',
            'data.imgPrincipal.required' => 'La imagen principal es requerida',
            'data.imgPrincipal.max' => 'La imagen principal no debe superar los 20MB',
            'data.arrayGaleria.required' => 'La galería de imágenes es requerida',
            'data.arrayGaleria.array' => 'La galería debe ser un arreglo',
            'data.arrayGaleria.min' => 'La galería debe contener al menos una imagen',
            'data.arrayGaleria.*.image' => 'Los elementos de la galería deben ser imágenes',
            'data.arrayGaleria.*.mimes' => 'Las imágenes de la galería deben ser de tipo JPG',
            'data.arrayGaleria.*.max' => 'Las imágenes de la galería no deben superar los 20MB',
            'data.id_estado.required' => 'El estado es requerido',
            'data.id_usuario.required' => 'El usuario es requerido',
            'data.id_pueblo.required' => 'El pueblo es requerido',
        ];
    }
    protected function failedValidation(Validator $validator) {
        throw new HttpResponseException(response()->json([
            'data' => $validator->errors(),
        ], 422));
    }
}
