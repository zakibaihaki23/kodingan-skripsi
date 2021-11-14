<?php

namespace App\Rules;

use App\PBB;

use Illuminate\Contracts\Validation\Rule;

class PBBRule implements Rule
{
    /**
     * Create a new rule instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Determine if the validation rule passes.
     *
     * @param  string  $attribute
     * @param  mixed  $value
     * @return bool
     */
    public function passes($attribute, $value)
    {
        return PBB::where('waktu', '=', $value)->where('id_kelurahan', '=', $value)->count() == 0;
    }

    /**
     * Get the validation error message.
     *
     * @return string
     */
    public function message()
    {
        return 'Tanggal sudah tersedia';
    }
}
