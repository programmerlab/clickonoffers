 
 <div class="col-md-12"> 
    <div class="form-group {{ $errors->first('country', ' has-error') }}">
         <label class="control-label col-md-2">Select  Country
                <span class="required">  </span>
            </label>
        <div class="col-md-6 multi-select-full"> 
          {{ Form::select('country[]', $all_countries, null, ['class'=>'form-control multiselect-filtering  ','multiple'=>"multiple" ]) }}
    
            <span class="help-block">{{ $errors->first('country', ':message') }}</span>
        </div>
    </div> 
</div>
