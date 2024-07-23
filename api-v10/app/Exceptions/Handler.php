<?php

namespace App\Exceptions;

use Throwable;
use Illuminate\Database\QueryException;
use Illuminate\Auth\AuthenticationException;
use Illuminate\Validation\ValidationException;
use Laravel\Sanctum\Exceptions\MissingAbilityException;
use Illuminate\Foundation\Exceptions\Handler as ExceptionHandler;

class Handler extends ExceptionHandler
{
    /**
     * A list of exception types with their corresponding custom log levels.
     *
     * @var array<class-string<\Throwable>, \Psr\Log\LogLevel::*>
     */
    protected $levels = [
        //
    ];

    /**
     * A list of the exception types that are not reported.
     *
     * @var array<int, class-string<\Throwable>>
     */
    protected $dontReport = [
        //
    ];

    /**
     * A list of the inputs that are never flashed to the session on validation exceptions.
     *
     * @var array<int, string>
     */
    protected $dontFlash = [
        'current_password',
        'password',
        'password_confirmation',
    ];

    /**
     * Register the exception handling callbacks for the application.
     */
    public function register(): void
    {
        $this->reportable(function (Throwable $e) {
            //
        });
    }

    public function render($request, Throwable $exception)
    {
        if ($request->wantsJson()) {
            if ($exception instanceof QueryException) {
                return response()->json(["data"=>[
                    'error' => 'Error de base de datos',
                    'message' => 'Ocurrió un error al procesar la solicitud en la base de datos.'
                ]], 500);
            } elseif ($exception instanceof ValidationException) {
                return response()->json(["data"=>[
                    'error' => 'Error de validación',
                    'message' => $exception->errors()
                ]], 422);
            }elseif ($this->isTokenException($exception)) {
                return response()->json(["data"=>[
                    'error' => 'Token inválido o expirado',
                    'message' => 'La sesión ha expirado o el token es inválido. Por favor, inicie sesión nuevamente.'
                ]], 401);
            } else {
                return response()->json(
                    ["data"=>[
                    'error' => 'Error en el servidor',
                    'message' => $exception->getMessage()
                ]]
                , 500);
            }
        }

        return parent::render($request, $exception);
    }
    private function isTokenException(Throwable $exception): bool
    {
        return $exception instanceof AuthenticationException ||
               $exception instanceof MissingAbilityException ||
               ($exception instanceof \Exception && strpos($exception->getMessage(), 'Unauthenticated') !== false);
    }
}
