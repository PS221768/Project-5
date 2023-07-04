<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Achievement extends Model
{
    use HasFactory;
    protected $fillable = ["name", "amount", "start", "finish", "user_id", "exercise_id"];

    public function user()
    {
        return $this -> belongsTo(User::class);
    }

    public function exercise()
    {
        return $this -> belongsTo(Exercise::class);
    }
}