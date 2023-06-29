<?php

namespace Tests\Feature;

use App\Models\User;
use App\Models\Exercise;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class ExerciseControllerTest extends TestCase
{
    use RefreshDatabase;

    protected function setUp(): void
    {
        parent::setUp();

        $user = User::factory()->create();
        $this->actingAs($user); // Authenticate the user for the tests
    }

    /** @test */
    public function it_can_get_all_exercises()
    {
        Exercise::factory()->count(5)->create();

        $response = $this->getJson('/api/exercise');

        $response->assertStatus(200)
            ->assertJsonStructure([
                'data' => [
                    'exercises',
                ],
            ]);
    }

    /** @test */
    public function it_can_create_an_exercise()
    {
        $exerciseData = Exercise::factory()->raw();

        $response = $this->postJson('/api/exercise', $exerciseData);

        $response->assertStatus(201)
            ->assertJson([
                'data' => [
                    'exercise' => $exerciseData,
                ],
            ]);

        $this->assertDatabaseHas('exercises', $exerciseData);
    }

    /** @test */
    public function it_can_show_an_exercise()
    {
        $exercise = Exercise::factory()->create();

        $response = $this->getJson('/api/exercise/' . $exercise->id);

        $response->assertStatus(200)
            ->assertJsonStructure([
                'data' => [
                    'exercise',
                ],
            ]);
    }

    /** @test */
    public function it_can_update_an_exercise()
    {
        $exercise = Exercise::factory()->create();
        $updatedData = Exercise::factory()->raw();

        $response = $this->putJson('/api/exercise/' . $exercise->id, $updatedData);

        $response->assertStatus(200)
            ->assertJson([
                'data' => [
                    'exercise' => $updatedData,
                ],
            ]);

        $this->assertDatabaseHas('exercises', $updatedData);
    }

    /** @test */
    public function it_can_delete_an_exercise()
    {
        $exercise = Exercise::factory()->create();

        $response = $this->deleteJson('/api/exercise/' . $exercise->id);

        $response->assertStatus(204);
        $this->assertDatabaseMissing('exercises', ['id' => $exercise->id]);
    }
}
