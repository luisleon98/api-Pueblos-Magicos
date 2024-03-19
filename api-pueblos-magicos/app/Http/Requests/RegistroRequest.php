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
            'data.nombre'=>['required','string'],
            'data.apellido'=>['required','string'],
            'data.email'=>['required','email'],
            'data.direccion'=>['required','string'],
            'data.ciudad'=>['required','string'],
            'data.cp'=>['required','number'],
            'data.password'=>['required','string'],
        ];
    }
    public function messages()
    {
        return[
            'data.nombre.required' => 'El nombre es obligatorio',
            'data.nombre.string' => 'El nombre debe ser un string',
        ];
    }
    protected function failedValidation(Validator $validator) {
        throw new HttpResponseException(response()->json([
            'data' => $validator->errors(),
        ], 422));
    }
}
