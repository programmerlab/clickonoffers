 <fieldset class="step ui-formwizard-content" id="step1" style="display: block;">
        
        <div class="row">

          
	     
         <div class="col-md-6">
                 <div class="form-group {{ $errors->first('country', ' has-error') }}">
                    <label>Select  country: <span class="text-danger">*</span></label>
                     <div class="multi-select-full">
                         <select class="multiselect-filtering" multiple="multiple">
                            @foreach($country_list as $key => $result)
                            <option value="{{$result->id}}">{{$result->name}}</option>
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
                        
                        <option value="1">Active</option>
                        <option value="0">InActive</option>
                          
                    </select>
                      <span class="help-block">{{ $errors->first('status', ':message') }}</span>
                </div>
            </div>
            
             <div class="col-md-12">
                 <div class="form-group {{ $errors->first('default_language_id', ' has-error') }}">
                    <label>Do you want to set Englisg as default language : <span class="text-danger">*</span></label>
                    
                      <input type="checkbox" name="default_language_id" value="1" class="styled form-control" checked="true"><span> Yes </span>
                   <input type="checkbox" name="default_language_id" value="0" class="styled form-control"><span> No </span>
                    
                    <span class="help-block">{{ $errors->first('default_language_id', ':message') }}</span>
                </div>
            </div>

            <div class="col-md-10" id="language">
                 <div class="form-group col-md-8 {{ $errors->first('language', ' has-error') }}">
                    <label>Select  Language: <span class="text-danger">*</span></label>
                     <div class="multi-select-full">
                         
                            <select class="select-search"    >
                            @foreach($language_list as $key => $result)
                            <option value="{{$result->id}}">{{$result->name}}</option>
                             @endforeach
                        </select>
                      <span class="help-block">{{ $errors->first('language', ':message') }}</span>
                      </div>
                </div>
           
                 <div class="form-group col-md-2 {{ $errors->first('default_language_id', ' has-error') }}">
                    <label>Make it as default Language : <span class="text-danger">*</span></label>
                    <br>
                      <input type="checkbox" name="default_language_id" value="1" class="styled form-control" checked="true"><span> Yes </span>
                   <input type="checkbox" name="default_language_id" value="0" class="styled form-control"><span> No </span>
                    
                    <span class="help-block">{{ $errors->first('default_language_id', ':message') }}</span>
                </div>

                <div class="form-group  col-md-2 {{ $errors->first('default_language_id', ' has-error') }}">
                    <label>Make it active : <span class="text-danger">*</span></label>
                    <br>
                      <input type="checkbox" name="default_language_id" value="1" class="styled form-control" checked="true"><span> Yes </span>
                   <input type="checkbox" name="default_language_id" value="0" class="styled form-control"><span> No </span>
                    
                    <span class="help-block">{{ $errors->first('default_language_id', ':message') }}</span>
                </div>
                
               
            </div>
            <div class="col-md-2">
     <button type="button" id="add_language" class="btn alert sm alert-success circle"> <i class="icon-plus-circle2"></i></button>
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
 