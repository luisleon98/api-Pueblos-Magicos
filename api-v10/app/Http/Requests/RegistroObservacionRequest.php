<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Http\Exceptions\HttpResponseException;

class RegistroObservacionRequest extends FormRequest
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
            'data.id_servicio' =>['required','exists:servicios,id'],
            'data.id_usuario' =>['required','exists:usuarios,id'],
            'data.observacion' =>['required','min:5','max:500']
        ];
    }
    public function messages()
{
    return [
        'data.id_servicio.required' => 'El campo id servicio es requerido.',
        'data.id_servicio.exists' => 'El id servicio proporcionado no existe.',
        'mensaje_id_servicio' => 'El servicio seleccionado no es válido.',
        'data.id_usuario.required' => 'El campo id usuario es requerido.',
        'data.id_usuario.exists' => 'El id usuario proporcionado no existe.',
        'mensaje_id_usuario' => 'El usuario seleccionado no es válido.',
        'data.observacion.required' => 'El campo observacion es requerido.',
        'data.observacion.min' => 'La observacion debe tener al menos :min caracteres.',
        'data.observacion.max' => 'La observacion no debe tener más de :max caracteres.',
        'mensaje_observacion' => 'La observación no cumple con los requisitos.',
    ];
}
    protected function failedValidation(Validator $validator) {
        throw new HttpResponseException(response()->json([
            'data' => $validator->errors(),
        ], 422));
    }
}
