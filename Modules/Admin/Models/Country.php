<?php

declare(strict_types=1);

namespace Modules\Admin\Models;

use Illuminate\Database\Eloquent\Model as Eloquent;
 

class  Country extends Eloquent
{
     
    protected $parent = 'parent_id';
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'country_languages';
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    /**
     * The primary key used by the model.
     *
     * @var string
     */
    protected $primaryKey = 'id';

    public function activeLanguage(){
        return $this->belongsTo('Modules\Admin\Models\Language','active_language','id');
    }

    public function country(){
        return $this->hasMany('Modules\Admin\Models\CountryModule','module_row_id')->with('countryName');
    }

    
}
