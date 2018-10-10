<?php

namespace Modules\Admin\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Http\Controllers\Controller;
use Auth;
use URL;
use Cache;
use Modules\Admin\Entities\AdminCountries;
use \Illuminate\Support\Facades\Session;
use View,Config;


class AdminLoginController extends Controller
{
    
     
    public function __construct()
    { 
        View::share('viewPage', 'dashboard'); 
        View::share('route_url', '');
        View::share('heading', 'Dashboard');

        $this->record_per_page = Config::get('app.record_per_page');
    }

     /**
     * Display a listing of the resource.
     * @return Response
     */
    public function index()
    {
        if(Auth::guard('admin')->user()) { return view('admin::admin.dashboard'); }
        else { return view('admin::admin.login'); }
    }

    /**
     * checking admin login details.
     * @param email
     * @param password
     * @return Response json array
     */
    public function post_login(Request $request)
    {
        $this->validate($request, [ 'email' => 'required|email', 'password' => 'required']);
 
        $credentials = $request->only('email', 'password');
        $credentials['status']  =   1;
        if (Auth::guard('admin')->attempt($credentials, $request->has('remember')))
        {          
            return response()->json(['status'=>true,'csrf' => csrf_token(),'url'=>URL::to('/o4k/dashboard/')]);   
        }
        else
        {
            return response()->json(['status' => false, 'message' => trans('auth.failed')]); 
        }
    }
    
    /**
     * Show the form for creating a new resource.
     * @return Response
     */
    public function dashboard()
    {
         if(Auth::guard('admin')->user()) { return view('admin::admin.dashboard'); }
        else {   return redirect('admin/'); }
    }
    
    /**
     * logout for admin users.
     * @return Response
     */
    public function logout()
    {
        Auth::guard('admin')->logout();
        Cache::flush();
        return redirect('/admin/login');
    }
    
    /**
     * Checking user Login.
     * @return true or false
     */
    public function CheckLogin()
    {
        if(Auth::guard('admin')->user()) 
        {
          return response()->json(['status'=>true,'csrf' => csrf_token()]);   
        }
        else 
        { 
         return response()->json(['status'=>false,'csrf' => csrf_token(),'url'=>URL::to('/o4k/')]);   
        }
    }
    
    
     /**
     * Checking valid.
     * @return true or false
     */
    public function not_found()
    {
       return view('admin::admin.404'); 
    }
}
