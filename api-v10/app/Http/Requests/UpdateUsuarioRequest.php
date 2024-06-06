<?php

namespace App\Http\Requests;

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Http\Exceptions\HttpResponseException;

class UpdateUsuarioRequest extends FormRequest
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
            'data.user.user_name'=>['sometimes','required','email'],
            'data.datosP.nombre'=>['sometimes','required','string'],
            'data.datosP.apellido_pat'=>['sometimes','required','string'],
            'data.datosP.apellido_mat'=>['sometimes','required','string'],
            'data.user.password'=>['sometimes','required','string','confirmed'],
            'data.user.id_tipo_usuario'=>['sometimes','required','numeric','exists:tipos_usuarios,id'],
            'data.user.id_estatus'=>['sometimes','required','numeric','exists:estatus,id'],
        ];
    }
    public function messages()
    {
        return[
            'data.user.user_name.required' => 'El nombre de usuario es obligatorio',
            'data.user.user_name.email' => 'El nombre de usuario debe ser un correo electrónico válido',
            'data.datosP.nombre.required' => 'El nombre es obligatorio',
            'data.datosP.nombre.string' => 'El nombre debe ser una cadena de texto',
            'data.datosP.apellido_pat.required' => 'El apellido paterno es obligatorio',
            'data.datosP.apellido_pat.string' => 'El apellido paterno debe ser una cadena de texto',
            'data.datosP.apellido_mat.required' => 'El apellido materno es obligatorio',
            'data.datosP.apellido_mat.string' => 'El apellido materno debe ser una cadena de texto',
            'data.user.password.required' => 'La contraseña es obligatoria',
            'data.user.password.string' => 'La contraseña debe ser una cadena de texto',
            'data.user.password.confirmed' => 'Debes confirmar la contraseña',
            'data.user.id_tipo_usuario.required' => 'El tipo de usuario es obligatorio',
            'data.user.id_tipo_usuario.numeric' => 'El tipo de usuario debe ser un número',
        ];
    }
    protected function failedValidation(Validator $validator) {
        throw new HttpResponseException(response()->json([
            'data' => $validator->errors(),
        ], 422));
    }
}
