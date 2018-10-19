
    <fieldset class="step ui-formwizard-content" id="step1" style="display: block;">
        
        <div class="row">
             @include('admin::partials.country')

            <div class="col-md-6">
                <div class="form-group {{ $errors->first('category_name', ' has-error') }}  @if(session('field_errors')) {{ 'has-error' }} @endif">
                    <label  >Category Name <span class="required"> * </span></label>
                   
                        {!! Form::text('category_name',null, ['class' => 'form-control','data-required'=>1])  !!} 
                        
                        <span class="help-block" style="color:red">{{ $errors->first('category_name', ':message') }} @if(session('field_errors')) {{ 'The Category name already been taken!' }} @endif</span>
                    
                </div> 
            </div>
            <div class="col-md-6">
                <div class="form-group  {{ $errors->first('category_image', ' has-error') }}">
                    <label > Category Image <span class="required"> * </span></label>
                     
                        @if(isset($url))
                         <div class="fileinput-new thumbnail" style="width: 200px; height: 150px;">
                    <img src=" {{ $url ?? 'http://www.placehold.it/200x150/EFEFEF/AAAAAA&amp;text=no+image'}}" alt=""> </div>
                    @endif
                        <input type="file" class="file-input" name="category_image">
                         <span class="help-block" style="color:#e73d4a">{{ $errors->first('category_image', ':message') }}</span>
                    
                    </div>
                 
            </div> 

             <div class="col-md-6">
               
                <div class="form-group {{ $errors->first('description', ' has-error') }}">
                    <label  >Description<span class="required"> </span></label>
                     
                        {!! Form::textarea('description',null, ['class' => 'form-control summernote','data-required'=>1,'rows'=>3,'cols'=>5])  !!} 
                        
                        <span class="help-block">{{ $errors->first('description', ':message') }}</span>
                    </div>
                </div> 
                                            
            </div>
             <div class="col-md-12">
                  <div class="form-group pull-right ">
                {!! Form::submit(' Save ', ['class'=>'btn  btn-primary text-white','id'=>'saveBtn']) !!}

                 <a href="{{route('category')}}">
            {!! Form::button('Back', ['class'=>'btn btn-warning text-white']) !!} </a>
                     </div>   
            </div> 

        </div> 
 
    </fieldset > 