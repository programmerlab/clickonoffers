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
	                        <th> Country Name </th> 
	                        <th> Active Language</th>
	                        <th> Status </th> 
                          <th> Location </th>
	                        <th>Created date</th> 
	                        <th>Action</th> 
	                    </tr>
	                </thead>
	                <tbody>

                    <thead>
                      @foreach($country as $key => $result)
                      <tr>
                          <td>{{++$key}}</td>
                           
                          <td>
                            @if(count($result->country))
                            @foreach($result->country as $key => $countryName)
                              <li>{{$countryName->countryName->name??''}}</li>
                            @endforeach
                            
                            @else
                              NA
                            @endif
                            
                          </td> 

                          <td>{{ $result->activeLanguage->name??'NA' }}</td>
                          <td>{{($result->status==1)?'Active':'Inactive'}}</td>
                          <td>{{$result->location??'NA'}}</td>

                          <td>
                              {!! Carbon\Carbon::parse($result->created_at)->format($date_format); !!}
                        </td>
                                
                        <td> 
                                    
                            <a href="{{ route('country.edit',$result->id)}}" class="btn btn-primary btn-xs" style="margin-left: 20px">
                            <i class="fa fa-edit" title="edit"></i> Edit
                            </a>

                            {!! Form::open(array('class' => 'form-inline pull-left deletion-form', 'method' => 'DELETE',  'id'=>'deleteForm_'.$result->id, 'route' => array('country.destroy', $result->id))) !!}

                            <button class='delbtn btn btn-danger btn-xs' type="submit" name="remove_levels" value="delete" id="{{$result->id}}"><i class="fa fa-trash" title="Delete"></i> Delete
                            </button>

                            {!! Form::close() !!}

                                </td>


                      </tr>
                      @endforeach
                    </thead>
	                 
	                    
	                </tbody>
	            </table>
	             <div class="center" align="center">  {!! $country->appends(['search' => isset($_GET['search'])?$_GET['search']:''])->render() !!}</div> 
             </div>
      
@stop