<?php

namespace Tests\Feature;

use App\Models\User;
use App\Models\Exercise;
use App\Models\Achievement;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class AchievementControllerTest extends TestCase
{
    use RefreshDatabase;

    private $user_id;
    protected function setUp(): void
    {
        parent::setUp();

        $user = User::factory()->create();
        $this->user_id = $user->id;
        $this->actingAs($user); // Authenticate the user for the tests
    }

    /** @test */
    public function test_app_can_get_all_achievements()
    {
        Achievement::factory()->count(5)->user($this->user_id)->create();

        $response = $this->getJson('/api/achievement');

        $response->assertStatus(200)
            ->assertJsonStructure([
                'data' => [
                    'achievements',
                ],
            ]);
    }

    /** @test */
    public function test_app_can_create_an_achievement()
    {
        $achievementData = Achievement::factory()->user($this->user_id)->raw();

        $response = $this->postJson('/api/achievement', $achievementData);

        $response->assertStatus(201)
            ->assertJson([
                'data' => [
                    'achievement' => $achievementData,
                ],
            ]);

        $this->assertDatabaseHas('achievements', $achievementData);
    }

    /** @test */
    public function test_app_can_update_an_achievement()
    {
        $achievement = Achievement::factory()->user($this->user_id)->create();
        $updatedData = Achievement::factory()->user($this->user_id)->raw();

        $response = $this->patchJson('/api/achievement/' . $achievement->id, $updatedData);

        $response->assertStatus(200)
            ->assertJson([
                'data' => [
                    'achievement' => $updatedData,
                ],
            ]);

        $this->assertDatabaseHas('achievements', $updatedData);
    }

    /** @test */
    public function app_can_delete_an_achievement()
    {
        $achievement = Achievement::factory()->user($this->user_id)->create();

        $response = $this->deleteJson('/api/achievement/' . $achievement->id);

        $response->assertStatus(200);
        $this->assertDatabaseMissing('achievements', ['id' => $achievement->id]);
    }
}
