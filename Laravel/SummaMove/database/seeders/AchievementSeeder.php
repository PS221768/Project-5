<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class AchievementSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('users')->insert([
            "name" => "Burpee prestatie - 1 Juli",
            "amount" => 50,
            "start" => "18:00",
            "finish" => "18:10",
            "user_id" => 2,
            "exercise_id" => 7
        ]);
    }
}
