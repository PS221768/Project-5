<?php
namespace App\Http\Controllers;

use App\Traits\HttpResponses;

use Illuminate\Support\Facades\Log;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Achievement;
use App\Http\Requests\AchievementRequest;
use Illuminate\Validation\ValidationException;

class AchievementController extends Controller
{
    // Traits
    use HttpResponses;

    public function index(Request $request)
    {
        try
        {
            $achievements = Achievement::all();
            
            return $this->success([
                'achievements' => $achievements
            ]);
        }
        catch (\Exception $e)
        {
            Log::error($e->getMessage(), ['exception' => $e]);
            return $this->error('', 'Failed to retrieve achievements.', 500);
        }
    }

    public function indexByUserId(Request $request, $user_id)
    {
        try
        {
            $achievements = Achievement::where('user_id', $user_id)->get();

            return $this->success([
                'achievements' => $achievements
            ]);
        }
        catch (\Exception $e)
        {
            Log::error($e->getMessage(), ['exception' => $e]);
            return $this->error('', 'Failed to retrieve achievements for' . $user_id . '.', 500);
        }
    }

    public function store(AchievementRequest $request)
    {
        try
        {
            $achievement = Achievement::create($request->validated());

            return $this->success([
                'achievement' => $achievement
            ], null, 201);
        }
        catch (\Exception $e)
        {
            Log::error($e->getMessage(), ['exception' => $e]);
            return $this->error('', 'Failed to create achievement.', 500);
        }
    }

    public function update(AchievementRequest $request, string $id)
    {
        try
        {
            $achievement = Achievement::findOrFail($id)->update($request->validated());
            
            return $this->success([
                'achievement' => $achievement
            ]);
        }
        catch (\Exception $e)
        {
            Log::error($e->getMessage(), ['exception' => $e]);
            return $this->error('', 'Failed to update achievement.', 500);
        }
    }

    public function destroy(string $id)
    {
        try
        {
            Achievement::findOrFail($id)->delete();
            return $this->success('', 'Achievement deleted successfully.', 200);
        }
        catch (\Exception $e) 
        {
            Log::error($e->getMessage(), ['exception' => $e]);
            return $this->error('', 'Failed to delete achievement.', 500);
        }
    }
}
