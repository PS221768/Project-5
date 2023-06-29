<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class ExerciseRouteTest extends TestCase
{
    use RefreshDatabase;

    public function testUsersRoute()
    {
        $response = $this->get('/api/exercise');

        $response->assertStatus(200);
        $response->assertJsonStructure([
            'status',
            'message',
            'data' => [
                'exercises' => [
                    '*' => [
                        'id',
                        'name',
                        'description',
                        'created_at',
                        'updated_at'
                    ]
                ]
            ]
        ]);
    }
}