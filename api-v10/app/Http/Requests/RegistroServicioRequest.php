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
            'data.int' => ['sometimes'],
            'data.ext' => ['required'],
            'data.colonia' => ['required'],
            'data.dias_servicio' => ['required','min:5','max:20'],
            'data.horario_inicio' => ['required'],
            'data.horario_fin' => ['required'],
            'data.precio' => ['required'],
            'data.titulo' => ['required','max:100'],
            'data.descripcion' => ['required'],
            'data.latitud' => ['required'],
            'data.longitud' => ['required'],
            'data.imgPrincipal' => ['required', 'mimes:jpg,png', 'max:1024'],
            'data.arrayGaleria' => ['required', 'array', 'min:1', 'max:1024'],
            'data.arrayGaleria.*' => ['required', 'mimes:jpg,png'],
            'data.id_estado' => ['required','exists:estados,id'],
            'data.id_usuario' => ['required','exists:usuarios,id'],
            'data.id_pueblo' => ['required','exists:pueblos_magicos,id'],
            'data.pagina_web' => ['required','url'],
            'data.telefono' => ['required']

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
        'data.ext.required' => 'El número exterior es requerido',
        'data.colonia.required' => 'La colonia es requerida',
        'data.dias_servicio.required' => 'Los días de servicio son requeridos',
        'data.dias_servicio.min' => 'Los días de servicio deben ser al menos 5 caracteres',
        'data.dias_servicio.max' => 'Los días de servicio no deben exceder los 20 caracteres',
        'data.horario_inicio.required' => 'La hora de inicio es requerida',
        'data.horario_fin.required' => 'La hora de fin es requerida',
        'data.precio.required' => 'El precio es requerido',
        'data.titulo.required' => 'El título es requerido',
        'data.titulo.max' => 'El título no debe exceder los 100 caracteres',
        'data.descripcion.required' => 'La descripción es requerida',
        'data.latitud.required' => 'La latitud es requerida',
        'data.longitud.required' => 'La longitud es requerida',
        'data.imgPrincipal.required' => 'La imagen principal es requerida',
        'data.imgPrincipal.mimes' => 'La imagen principal debe ser un archivo JPG o PNG',
        'data.imgPrincipal.max' => 'La imagen principal no debe exceder 1024 KB',
        'data.arrayGaleria.required' => 'La galería de imágenes es requerida',
        'data.arrayGaleria.array' => 'La galería de imágenes debe ser un arreglo',
        'data.arrayGaleria.min' => 'Debe haber al menos una imagen en la galería',
        'data.arrayGaleria.max' => 'La galería de imágenes no debe exceder 1024 KB',
        'data.arrayGaleria.*.required' => 'Cada imagen de la galería es requerida',
        'data.arrayGaleria.*.mimes' => 'Cada imagen de la galería debe ser un archivo JPG o PNG',
        'data.id_estado.required' => 'El estado es requerido',
        'data.id_estado.exists' => 'El estado no existe',
        'data.id_usuario.required' => 'El usuario es requerido',
        'data.id_usuario.exists' => 'El usuario no existe',
        'data.id_pueblo.required' => 'El pueblo mágico es requerido',
        'data.id_pueblo.exists' => 'El pueblo mágico no existe',
        'data.pagina_web.required' => 'La página web es requerida',
        'data.pagina_web.url' => 'La página web debe ser una URL válida',
        'data.telefono.required' => 'El teléfono es requerido',
    ];
}
    protected function failedValidation(Validator $validator) {
        throw new HttpResponseException(response()->json([
            'data' => $validator->errors(),
        ], 422));
    }
}
