 <fieldset class="step ui-formwizard-content" id="step1" style="display: block;">
        
        <div class="row">

          
	     
         <div class="col-md-6">
                 <div class="form-group {{ $errors->first('country', ' has-error') }}">
                    <label>Select  country: <span class="text-danger">*</span></label>
                     <div class="multi-select-full">
                         <select class="multiselect-filtering" multiple="multiple" name="country">
                            @foreach($country_list as $key => $result)
                            <option value="{{$result->id}}" {{(isset($country->country_id) && $country->country_id==$result->id)?'Selected':''}}>{{$result->name}}</option>
                             @endforeach
                        </select>
                      <span class="help-block">{{ $errors->first('country', ':message') }}</span>
                      </div>
                </div>
            </div> 



         <div class="col-md-6">
                 <div class="form-group {{ $errors->first('status', ' has-error') }}">
                    <label>Status: <span class="text-danger">*</span></label>
                    
                    <select name="status" class="form-control"  >
                        
                        <option value="1" {{(isset($country->staus) && $country->staus==1)?'Selected':''}}>Active</option>
                        <option value="0" {{(isset($country->staus) && $country->staus==0)?'Selected':''}}>InActive</option>
                          
                    </select>
                      <span class="help-block">{{ $errors->first('status', ':message') }}</span>
                </div>
            </div>
            
             <div class="col-md-12">
                 <div class="form-group {{ $errors->first('default_language_id', ' has-error') }}">
                    <label>Do you want to set Englisg as default language : <span class="text-danger">*</span></label>
                    
                      <input type="radio" name="default_language" value="1" class="styled form-control" checked="checked" {{(isset($country->default_language_eng) && $country->default_language_eng==1)?'checked':''}}    ><span> Yes </span>
                   <input type="radio" name="default_language" value="0" class="styled form-control" {{(isset($country->default_language_eng) && $country->default_language_eng==0)?'checked':''}}><span> No </span>
                    
                    <span class="help-block">{{ $errors->first('default_language_id', ':message') }}</span>
                </div>
            </div>
            <hr style="border: 1px solid #ccc" />
        <div class="col-md-12">
            <div class="col-md-10" id="language">
                <div class="form-group col-md-6 {{ $errors->first('language', ' has-error') }}">
                    <label>Select other Language: <span class="text-danger">*</span></label>
                     <div class="multi-select-full">
                         
                            <select class="select-search" name="language[]"   >
                            @foreach($language_list as $key => $result)
                            <option value="{{$result->id}}">{{$result->name}}</option>
                             @endforeach
                        </select>
                      <span class="help-block">{{ $errors->first('language', ':message') }}</span>
                      </div>
                </div>
           
                 <div class="form-group col-md-2 {{ $errors->first('default_language_id', ' has-error') }}">
                    <label>Make it as default : <span class="text-danger">*</span></label>
                    <br>
                      <input type="radio" name="make_default_language[]" value="1" class="styled form-control make_default_language"  ><span> Yes </span>
                   <input type="radio" name="make_default_language[]" value="0" class="styled form-control make_default_language"  checked="" ><span> No </span>
                    
                    <span class="help-block">{{ $errors->first('make_default_language', ':message') }}</span>
                </div>

                <div class="form-group  col-md-2 {{ $errors->first('default_language_id', ' has-error') }}">
                    <label>Make it active : <span class="text-danger">*</span></label>
                    <br>
                      <input type="radio" name="make_active_language[]" value="1" class="styled form-control make_active_language" ><span> Yes </span>
                   <input type="radio" name="make_active_language[]" value="0" class="styled form-control make_active_language"  checked="" ><span> No </span>
                    
                    <span class="help-block">{{ $errors->first('make_active_language', ':message') }}</span>
                </div>
                
               
            </div>
            <!--  <div class="col-md-2">
                <button type="button" id="add_language" class="btn alert sm alert-success circle"> <i class="icon-plus-circle2"></i></button>
            </div> -->
        </div>   
           
            <div class="col-md-12"> <hr style="border: 1px solid #ccc" /></div>
            <div class="col-md-6">
                <div class="form-group {{ $errors->first('location', ' has-error') }}  @if(session('field_errors')) {{ 'has-error' }} @endif">
                    <label class="control-label">Add Location <span class="required"> * </span></label>
                        {!! Form::text('location',null, ['class' => 'form-control','data-required'=>1,'id'=>'location','onkeyup'=>'initMap()'])  !!} 
                        
                        <span class="help-block" style="color:red">{{ $errors->first('location', ':message') }} </span>
                    
                </div> 
             </div>
             <div class="col-md-12">
                  <div class="form-group pull-right ">
                {!! Form::submit(' Save ', ['class'=>'btn  btn-primary text-white','id'=>'saveBtn']) !!}

                 <a href="{{route('country')}}">
            {!! Form::button('Back', ['class'=>'btn btn-warning text-white']) !!} </a>
                     </div>   
            </div> 

        </div> 
 
    </fieldset >  