<?php

namespace Database\Factories;

use App\Models\User;
use App\Models\Exercise;
use App\Models\Achievement;
use Illuminate\Database\Eloquent\Factories\Factory;

class AchievementFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Achievement::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'name' => $this->faker->sentence,
            'amount' => $this->faker->randomDigitNotNull,
            'start' => $this->faker->time('H:i'),
            'finish' => $this->faker->time('H:i'),
            'exercise_id' => Exercise::factory()->create()->id,
        ];
    }

    public function user($user_id)
    {
        return $this->state(function (array $attributes) use ($user_id) {
            return [
                'user_id' => $user_id,
            ];
        });
    }
}