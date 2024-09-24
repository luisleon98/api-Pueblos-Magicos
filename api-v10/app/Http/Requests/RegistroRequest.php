<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Http\Exceptions\HttpResponseException;

class RegistroRequest extends FormRequest
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
            'data.user_name'=>['required','email'],
            'data.nombre'=>['required','string'],
            'data.apellido_pat'=>['required','string'],
            'data.apellido_mat'=>['sometimes','required','string'],
            'data.password' => ['required', 'string', 'confirmed', 'min:8', 'regex:/^(?=.*[A-Z])(?=.*\d).+$/'],
            
        ];
    }
    public function messages()
{
    return [
        'data.user_name.required' => 'El nombre de usuario es obligatorio',
        'data.user_name.email' => 'El nombre de usuario debe ser un correo electrónico válido',
        'data.nombre.required' => 'El nombre es obligatorio',
        'data.nombre.string' => 'El nombre debe ser una cadena de texto',
        'data.apellido_pat.required' => 'El apellido paterno es obligatorio',
        'data.apellido_pat.string' => 'El apellido paterno debe ser una cadena de texto',
        'data.apellido_mat.required' => 'El apellido materno es obligatorio',
        'data.apellido_mat.string' => 'El apellido materno debe ser una cadena de texto',
        'data.password.required' => 'La contraseña es obligatoria',
        'data.password.string' => 'La contraseña debe ser una cadena de texto',
        'data.password.confirmed' => 'Debes confirmar la contraseña',
        'data.password.min' => 'La contraseña debe tener al menos 8 caracteres',
        'data.password.regex' => 'La contraseña debe contener al menos una mayúscula y un número',
    ];
}
    protected function failedValidation(Validator $validator) {
        throw new HttpResponseException(response()->json([
            'data' => $validator->errors(),
        ], 422));
    }
}
