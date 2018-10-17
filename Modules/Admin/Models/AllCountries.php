<?php

declare(strict_types=1);

namespace Modules\Admin\Models;

use Illuminate\Database\Eloquent\Model as Eloquent;
 

class  AllCountries extends Eloquent
{
     
   /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'all_countries';
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

    
}
