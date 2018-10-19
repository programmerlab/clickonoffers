<?php

declare(strict_types=1);

namespace Modules\Admin\Http\Controllers;

use App\Helpers\Helper;
use App\Http\Controllers\Controller;
use Hash;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\Redirect;
use Input; 
use Modules\Admin\Models\Country;
use Modules\Admin\Models\User;
use Route;
use View;
use Validator;
use Session; 
use Modules\Admin\Http\Requests\CountryRequest;
/**
 * Class SingleUsersController
 */
class CountryController extends Controller
{
    /**
     * @var  Repository
     */

    /**
     * Displays all Country.
     *
     * @return \Illuminate\View\View
     */
    public function __construct()
    {
        $this->middleware('admin');
        View::share('viewPage', 'Country');
        View::share('helper', new Helper);
        View::share('heading', 'Country');
        View::share('route_url', route('country'));

        $this->record_per_page = Config::get('app.record_per_page');
        $this->indexUrl     = 'admin::country.index';
        $this->createUrl    = 'admin::country.create';
        $this->editUrl      = 'admin::country.edit';
        $this->defaultUrl   = route('country');
        $this->createMessage = 'Record created successfully.';
        $this->updateMessage = 'Record updated successfully.';
        $this->deleteMessage =  'Record deleted successfully.';

        $this->country = \DB::table('all_countries')->get();
    }

    protected $users;

    /*
     * Dashboard
     * */

    public function index(Country $country, Request $request)
    {
        $page_title  = ucfirst(Route::currentRouteName());
        $page_action = 'View '.ucfirst(Route::currentRouteName());

        if ($request->ajax()) {
            $id           = $request->get('id');
            $status       = $request->get('status');
            $user         = Country::find($id);
            $s            = ($status == 1) ? $status=0:$status=1;
            $user->status = $s;
            $user->save();
            echo $s;

            exit();
        }
        // Search by name ,email and group
        $search    = Input::get('search');
        $status    = Input::get('status'); 

        if ((isset($search) && !empty($search)) or  (isset($status) && !empty($status)) or !empty($role_type)) {
            $search = isset($search) ? Input::get('search') : '';

            $country =  Country::with(['country'=>function($q){
                    $q->where('module_name','country_languages');
                }])->with('activeLanguage')->where(function ($query) use ($search,$status) {
                if (!empty($search)) {
                    $query->Where('country_id', 'LIKE', "%$search%")
                        ->OrWhere('status', 'LIKE', "%$search%") ;
                }

                if (!empty($status)) {
                    
                    $status =  ($status == 'active')?1:0;
                    $query->Where('status', $status);
                }
            })->Paginate($this->record_per_page);
        } else {
            $country = Country::with(['country'=>function($q){
                    $q->where('module_name','country_languages');
                }])->with('activeLanguage')
                ->orderBy('id', 'desc')->Paginate($this->record_per_page);
        } 
         

          //  dd($country[0]->activeLanguage->name);
        return view($this->indexUrl, compact('status', 'country', 'page_title', 'page_action'));
    }

    /*
     * create Group method
     * */

    public function create(Country $country)
    {
        $page_title  =  str_replace(['.','create'],'', ucfirst(Route::currentRouteName()));
        $page_action =  str_replace('.',' ', ucfirst(Route::currentRouteName()));

        $language_list = \DB::table('all_languages')->select('id','lang_code','name')->get();
        
        return view($this->createUrl, compact('language_list','country_list','country', 'page_title', 'page_action'));
    }

    /*
     * Save Group method
     * */

    public function store(CountryRequest $request, Country $country)
    {
        $request->validate([ 
            'location' => 'required',
        ]);

        $country->status = $request->get('status');
        $country->default_language_eng = $request->get('default_language');
        $country->location = $request->get('location');

        $language = $request->get('language');
        $make_default_language = $request->get('make_default_language');
        $make_active_language = $request->get('make_active_language');

        $lang = [];
        foreach ($language as $key => $value) {
            $default = $make_default_language[$key]??0;
            $active  = $make_active_language[$key]??0;
            if($active==1){
               $active_language = $value; 
            }
            if($default==1){
               $other_language = $value; 
            }
            $lang[] = [$value=>['default_language'=>$default,'make_active'=>$active]];
            
        }
        $country->other_default_language = $other_language??0;
        $country->other_languages = json_encode($lang);
        $country->active_language =  $active_language??$request->get('default_language');
        
       try {
            \DB::beginTransaction(); 
            $country->save();
             \Modules\Admin\Models\CountryModule::countryModule($request,$country->getTable(),$country->id);
             \DB::commit();
        } catch (\Exception $e) { 
            \DB::rollback(); 
        } 

        return Redirect::to($this->defaultUrl)
            ->with('flash_alert_notice', $this->createMessage);
    }

    /*
     * Edit Group method
     * @param
     * object : $user
     * */

    public function edit(Country $country)
    {   $page_title  =  str_replace(['.','edit'],'', ucfirst(Route::currentRouteName()));
        $page_action =  str_replace('.',' ', ucfirst(Route::currentRouteName()));

        $language_list = \DB::table('all_languages')->select('id','lang_code','name')->get();
       
       $country->country  = \Modules\Admin\Models\CountryModule::where('module_row_id',$country->id)
                            ->where('module_name',$country->getTable())->pluck('country_id'); 


        return view($this->editUrl, compact('country', 'page_title', 'page_action','language_list','country_list'));
    }

    public function update(Request $request, Country $country)
    {
         $request->validate([ 
            'location' => 'required',
        ]);
        $country->status = $request->get('status');
        $country->default_language_eng = $request->get('default_language');
        $country->location = $request->get('location');

        $language = $request->get('language');
        $make_default_language = $request->get('make_default_language');
        $make_active_language = $request->get('make_active_language');

        $lang = [];
        foreach ($language as $key => $value) {
            $default = $make_default_language[$key]??0;
            $active  = $make_active_language[$key]??0;
            if($active==1){
               $active_language = $value; 
            }
            if($default==1){
               $other_language = $value; 
            }
            $lang[] = [$value=>['default_language'=>$default,'make_active'=>$active]];
            
        }
        $country->other_default_language = $other_language??0;
        $country->other_languages = json_encode($lang);
        $country->active_language =  $active_language??$request->get('default_language');
        
        try {
            \DB::beginTransaction(); 
            $country->save();
             \Modules\Admin\Models\CountryModule::countryModule($request,$country->getTable(),$country->id);
             \DB::commit();
        } catch (\Exception $e) { 
            \DB::rollback(); 
        }

        return Redirect::to($this->defaultUrl)
            ->with('flash_alert_notice', $this->updateMessage);
    }
    /*
     *Delete User
     * @param ID
     *
     */
    public function destroy(Request $request, Country $country)
    {    
         $country->delete();
        return Redirect::to($this->defaultUrl)
            ->with('flash_alert_notice', $this->deleteMessage);
    }

    public function show(User $user)
    {
    }
}
