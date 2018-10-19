<div class="tab-pane" id="tab_1_2">  
<div class="portlet light bordered">
 
 
<input type="hidden" name="tab" value="avtar">
    <div class="form-group">
     
    <div class="col-md-12">
        <div class="form-group  {{ $errors->first('profile_image', ' has-error') }}">
            <label class="control-label col-md-2"> Profile Image <span class="required"> * </span></label>
            <div class="col-lg-6">
                @if(isset($url))
                 <div class="fileinput-new thumbnail" style="width: 200px; height: 150px;">
            <img src=" {{ $url ?? 'http://www.placehold.it/200x150/EFEFEF/AAAAAA&amp;text=no+image'}}" alt=""> </div>
            @endif
                <input type="file" class="file-input" name="profile_image">
                 <span class="help-block" style="color:#e73d4a">{{ $errors->first('profile_image', ':message') }}</span>
            <a href="javascript:;" class="btn red fileinput-exists" data-dismiss="fileinput"> Remove </a>
            </div>
        </div>
    </div>
     @include('admin::partials.country2')

   

        <div class="col-md-12">
             <br><br><br>
                  <div class="form-group pull-right ">
                {!! Form::submit(' Save Changes ', ['class'=>'btn  btn-primary text-white','id'=>'saveBtn']) !!}

                 <a href="{{URL::previous()}}">
            {!! Form::button('Back', ['class'=>'btn btn-warning text-white']) !!} </a>
                     </div>   
            </div> 


    </div>
          
</div>