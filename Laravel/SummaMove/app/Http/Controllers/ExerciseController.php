<?php
namespace App\Http\Controllers;

use App\Traits\HttpResponses;

use Illuminate\Support\Facades\Log;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Exercise;
use App\Http\Requests\ExerciseRequest;
use Illuminate\Validation\ValidationException;

class ExerciseController extends Controller
{
    // Traits
    use HttpResponses;

    public function index()
    {
        try
        {
            $exercises = Exercise::all();
            
            return $this->success([
                'exercises' => $exercises
            ]);
        }
        catch (\Exception $e)
        {
            Log::error($e->getMessage(), ['exception' => $e]);
            return $this->error('', 'Failed to retrieve exercises.', 500);
        }
    }

    public function store(ExerciseRequest $request)
    {
        try
        {
            $exercise = Exercise::create($request->validated());
            
            return $this->success([
                'exercise' => $exercise
            ], null, 201);
        }
        catch (\Exception $e)
        {
            Log::error($e->getMessage(), ['exception' => $e]);
            return $this->error('', 'Failed to create exercise.', 500);
        }
    }

    public function update(ExerciseRequest $request, string $id)
    {
        try
        {
            $exercise = Exercise::findOrFail($id)->update($request->validated());
            
            return $this->success([
                'exercise' => $exercise
            ]);
        }
        catch (\Exception $e)
        {
            Log::error($e->getMessage(), ['exception' => $e]);
            return $this->error('', 'Failed to update exercise.', 500);
        }
    }

    public function destroy(string $id)
    {
        try
        {
            Exercise::findOrFail($id)->delete();
            return $this->success('', 'Exercise deleted successfully.', 200);
        }
        catch (\Exception $e) 
        {
            Log::error($e->getMessage(), ['exception' => $e]);
            return $this->error('', 'Failed to delete exercise.', 500);
        }
    }
}