

<div class="form-group col-md-6 {{ $errors->first('country', ' has-error') }}">
    <label>Select Country: <span class="text-danger">*</span></label>
     <div class="multi-select-full">
          {{ Form::select('country[]', $all_countries, null, ['class'=>'multiselect-filtering  ','multiple'=>"multiple" ]) }}
        @if ($errors->has('country'))
         <span class="help-block">{{ $errors->first('country', ':message') }}</span> 
       @endif
      </div>
</div> 

 