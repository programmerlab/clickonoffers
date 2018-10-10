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
use Session;

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
        $this->deleteMessqge =  'Record deleted successfully.';

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
            $user         = User::find($id);
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

            $country = User::where(function ($query) use ($search,$status,$role_type) {
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
            $country = User::orderBy('id', 'desc')->Paginate($this->record_per_page);
        }
        
        return view($this->indexUrl, compact('status', 'country', 'page_title', 'page_action'));
    }

    /*
     * create Group method
     * */

    public function create(Country $country)
    {
        $page_title  =  str_replace(['.','create'],'', ucfirst(Route::currentRouteName()));
        $page_action =  str_replace('.',' ', ucfirst(Route::currentRouteName()));

        $country_list = $this->country;
        $language_list = \DB::table('all_languages')->select('id','lang_code','name')->get();
        
        return view($this->createUrl, compact('language_list','country_list','country', 'page_title', 'page_action'));
    }

    /*
     * Save Group method
     * */

    public function store(Request $request, Country $country)
    {
         

        return Redirect::to($this->defaultUrl)
            ->with('flash_alert_notice', $this->createMessage);
    }

    /*
     * Edit Group method
     * @param
     * object : $user
     * */

    public function edit(Country $country)
    {
        $page_title  =  str_replace(['.','edit'],'', ucfirst(Route::currentRouteName()));
        $page_action =  str_replace('.',' ', ucfirst(Route::currentRouteName()));

         $country_list =  \DB::table('all_countries')->get();
        $language_list = \DB::table('all_languages')->select('id','lang_code','name')->get();
        
        return view($this->editUrl, compact('js_file', 'role_id', 'roles', 'user', 'page_title', 'page_action'));
    }

    public function update(Request $request, Country $country)
    {
         

        return Redirect::to($this->defaultUrl)
            ->with('flash_alert_notice', $this->updateMessage);
    }
    /*
     *Delete User
     * @param ID
     *
     */
    public function destroy(Request $request, $country)
    {
         $country->delete();
        return Redirect::to($this->defaultUrl)
            ->with('flash_alert_notice', $this->deleteMessage);
    }

    public function show(User $user)
    {
    }
}
