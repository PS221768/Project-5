<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class AchievementSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('achievements')->insert([
            "name" => "Burpee prestatie - 1 Juli",
            "amount" => 50,
            "start" => "18:00",
            "finish" => "18:10",
            "user_id" => 2,
            "exercise_id" => 7
        ]);
    }
}
