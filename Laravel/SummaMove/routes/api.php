<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\AchievementController;
use App\Http\Controllers\ExerciseController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

// public routes
Route::post('/login', [AuthController::class, 'login']);
Route::post('/register', [AuthController::class, 'register']);

Route::apiResource('exercise', ExerciseController::class)->parameters(['exercises' => 'exercise'])->only([
    'index'
]);

// protected routes
Route::group(['middleware' => ['auth:sanctum', 'api']], function () {
    Route::apiResource('exercise', ExerciseController::class) ->parameters(['exercises' => 'exercise'])->except([
        'index'
    ]);

    Route::post('/exercise', [ExerciseController::class, 'store']);
    Route::put('/exercise/{id}', [ExerciseController::class, 'update']);
    Route::delete('/exercise/delete/{id}', [ExerciseController::class, 'destroy']);

    Route::get('/achievement', [AchievementController::class, 'index']);
    Route::get('/achievement/user/{user_id}', [AchievementController::class, 'indexByUserId']);
    Route::post('/achievement', [AchievementController::class, 'store']);
    Route::put('/achievement/{id}', [AchievementController::class, 'update']);
    Route::delete('/achievement/{id}', [AchievementController::class, 'destroy']);

    Route::post('/logout', [AuthController::class, 'logout']);
});