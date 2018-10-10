@extends('admin::layouts.master')
 
    @section('content') 
      @include('admin::partials.navigation')
      @include('admin::partials.breadcrumb')   

       @include('admin::partials.sidebar')   

            <div class="panel panel-white"> 
  		          <div class="panel panel-flat">
                  <div class="panel-heading">
                    <h6 class="panel-title"><b> {{$heading }} List</b><a class="heading-elements-toggle"><i class="icon-more"></i></a></h6>
                    <div class="heading-elements">
                      <ul class="icons-list">
                        <li> <a type="button" href="{{route('country.create')}}" class="btn btn-primary text-white btn-labeled btn-rounded "><b><i class="icon-plus3"></i></b> Add country<span class="legitRipple-ripple" ></span></a></li> 
                      </ul>
                    </div>
                  </div> 
  		        </div> 
  		         <div class="panel-body"> 
                  <div class="table-toolbar">
                    <div class="row">
                      <form action="{{route('country')}}" method="get" id="filter_data">
                     
                       
                      <div class="col-md-3">
                          <input value="{{ (isset($_REQUEST['search']))?$_REQUEST['search']:''}}" placeholder="Search by country" type="text" name="search" id="search" class="form-control" >
                      </div>
                      <div class="col-md-2">
                          <input type="submit" value="Search" class="btn btn-primary form-control">
                      </div>
                       
                    </form>
                    
                  
                    </div>
                </div> 
            </div>
  		        @if(Session::has('flash_alert_notice'))
                   <div class="alert alert-success alert-dismissable" style="margin:10px">
                      <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
                    <i class="icon fa fa-check"></i>  
                   {{ Session::get('flash_alert_notice') }} 
                   </div>
               @endif
               
  		         
                <table class="table table-striped table-hover table-bordered table-responsive" id="">
	                <thead>
	                    <tr>
                    	 	<th>  Sno. </th>
	                        <th> Sub Category Name </th>
	                        <th> Category Name </th>
	                        <th> Image </th> 
	                        <th>Created date</th> 
	                        <th>Action</th> 
	                    </tr>
	                </thead>
	                <tbody>
	                 
	                    
	                </tbody>
	            </table>
	             <div class="center" align="center">  {!! $country->appends(['search' => isset($_GET['search'])?$_GET['search']:''])->render() !!}</div> 
             </div>
      
@stop