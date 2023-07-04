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
            'name' => 'sometimes|required|string|max:191',
            'amount' => 'sometimes|required|integer',
            'start' => 'sometimes|required|date_format:H:i',
            'finish' => 'sometimes|required|date_format:H:i',
            'user_id' => 'sometimes|required|integer',
            'exercise_id' => 'sometimes|required|integer',
        ];
    }
}
