<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class AchievementRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array|string>
     */
    public function rules(): array
    {
        return [
            'name' => 'required|string|max:191',
            'amount' => 'required|integer',
            'start' => 'required|date_format:H:i',
            'finish' => 'required|date_format:H:i',
            'user_id' => 'required|integer',
            'exercise_id' => 'required|integer',
        ];
    }
}
