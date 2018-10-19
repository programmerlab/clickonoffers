<?php

declare(strict_types=1);

namespace Modules\Admin\Models;

use Illuminate\Database\Eloquent\Model as Eloquent;
use Illuminate\Http\Request;
use Illuminate\Database\Connection;


class  CountryModule extends Eloquent
{
    protected $table = 'country_modules';
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

    protected $fillable = ['module_row_id','module_name','country_id'];
    
    public static function countryModule($request,$module_name=null,$module_row_id=null){
         
        if($request->get('country')){
             $del =  \Modules\Admin\Models\CountryModule::where('module_row_id',$module_row_id) 
                                    ->where('module_name',$module_name)
                                    ->delete();    
            foreach ($request->get('country') as $key => $value) {
                                   
                $country =new \Modules\Admin\Models\CountryModule;
                $country->country_id =$value;
                $country->module_name =$module_name;
                $country->module_row_id =$module_row_id; 
                $country->save() ; 
            } 
        }else{
            return false;
        }
        
    }


    public function countryName(){
        return $this->belongsTo('Modules\Admin\Models\AllCountries','country_id');
    }

}
