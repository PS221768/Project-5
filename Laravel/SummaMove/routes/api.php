<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\AchievementController;
use App\Http\Controllers\ExerciseController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

// already existed so aint going to touch it for now :p
Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});


// public routes
Route::post('/login', [AuthController::class, 'login']);
Route::post('/register', [AuthController::class, 'register']);

Route::apiResource('exercise', ExerciseController::class) ->parameters(['exercises' => 'exercise'])->only([
    'index', 'show'
]);


// protected routes
Route::group(['middleware' => ['auth:sanctum']], function () {

    Route::apiResource('exercise', ExerciseController::class) ->parameters(['exercises' => 'exercise'])->except([
        'index', 'show'
    ]);

    Route::post('/exercise', [ExerciseController::class, 'store']);
    Route::delete('/exercise', [ExerciseController::class, 'store']);
    Route::put('/exercise', [ExerciseController::class, 'store']);
    

    Route::post('/logout', [AuthController::class, 'logout']);

});