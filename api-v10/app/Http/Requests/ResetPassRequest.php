<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Http\Exceptions\HttpResponseException;

class ResetPassRequest extends FormRequest
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
            'data.token' => 'required',
            'data.user_name' => 'required|email',
            'data.password' => 'required|confirmed',
        ];
    }
    public function messages(): array
    {
        return [
            'data.token.required' => 'El campo token es obligatorio.',
            'data.user_name.required' => 'El campo nombre de usuario es obligatorio.',
            'data.user_name.email' => 'El campo nombre de usuario debe ser una dirección de correo electrónico válida.',
            'data.password.required' => 'El campo contraseña es obligatorio.',
            'data.password.confirmed' => 'La confirmación de la contraseña no coincide.',
        ];
    }
    protected function failedValidation(Validator $validator) {
        throw new HttpResponseException(response()->json([
            'data' => $validator->errors(),
        ], 422));
    }
}
