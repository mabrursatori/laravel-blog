<?php

namespace App\Http\Requests\Admin;

use Illuminate\Foundation\Http\FormRequest;

class UserRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return false;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            "name" => "required|min:5|max:100",
            "username" => "required|min:5|max:20",
            "image" => "required",
            "email" => "required|email",
            "password" => "required",
            "confirmation_password" => "required|same:password",
            "bio" => "required",
            "role" => "required",
        ];
    }
}
