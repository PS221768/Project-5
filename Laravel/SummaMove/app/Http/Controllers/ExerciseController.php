<?php
namespace App\Http\Controllers;

use App\Traits\HttpResponses;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Exercise;
use App\Http\Requests\ExerciseRequest;

class ExerciseController extends Controller
{
    // traits
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
            return $this->error('', 'Failed to create exercise.', 500);
        }
    }

    public function show(Exercise $exercise)
    {
        try
        {
            return $this->success([
                'exercise' => $exercise
            ]);
        }
        catch (\Exception $e)
        {
            return $this->error('', 'Failed to retrieve exercise.', 500);
        }
    }

    public function update(ExerciseRequest $request, Exercise $exercise)
    {
        try
        {
            $exercise->update($request->validated());
            
            return $this->success([
                'exercise' => $exercise
            ]);
        }
        catch (\Exception $e)
        {
            return $this->error('', 'Failed to update exercise.', 500);
        }
    }

    public function destroy(Exercise $exercise)
    {
        try
        {
            $exercise->delete();
            return $this->success('', 'Exercise deleted successfully.', 204);
        }
        catch (\Exception $e) {
            return $this->error('', 'Failed to delete exercise.', 500);
        }
    }
}