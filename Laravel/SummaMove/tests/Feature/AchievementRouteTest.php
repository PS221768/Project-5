<?php

namespace Tests\Feature;

use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class AchievementRouteTest extends TestCase
{
    use RefreshDatabase;

    protected function setUp(): void
    {
        parent::setUp();

        $user = User::factory()->create();
        $this->actingAs($user);
    }

    public function testUsersRoute()
    {
        $response = $this->get('/api/achievement');

        $response->assertStatus(200);
        $response->assertJsonStructure([
            'status',
            'message',
            'data' => [
                'achievements' => [
                    '*' => [
                        'id',
                        'name',
                        'amount',
                        'start',
                        'finish',
                        'user_id',
                        'exercise_id',
                        'created_at',
                        'updated_at'
                    ]
                ]
            ]
        ]);
    }
}