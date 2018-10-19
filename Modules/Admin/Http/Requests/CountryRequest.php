<?php

declare(strict_types=1);

namespace Modules\Admin\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Request;
use Validator;
use Response;

class CountryRequest extends FormRequest
{
    /**
     * The metric validation rules.
     *
     * @return array
     */
    public function rules(Request $request)
    {
        switch ($this->method()) {
                case 'GET':
                case 'DELETE': {
                        return [];
                    }
                case 'POST': {
                     return [
                            'country' => 'required',
                            'country.*' => 'required_with:country.*',
                        ];
  
                    }
                case 'PUT':
                case 'PATCH': {
                        return [
                            'country' => 'required',
                            'country.*' => 'required_with:country.*',
                        ];

                }
                default:{
                    d(2);
                     break;
                }
            } 
    }

    /**
     * The
     *
     * @return bool
     */
    public function authorize()
    {   
        return true;
    }
}
