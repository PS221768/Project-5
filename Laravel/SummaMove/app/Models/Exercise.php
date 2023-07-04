<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Exercise extends Model
{
    use HasFactory;
    protected $fillable = ["name", "description_nl", "description_en"];

    public function achievements()
    {
        return $this -> hasMany(Achievement::class);
    }
}