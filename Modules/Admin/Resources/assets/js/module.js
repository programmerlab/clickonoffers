$(function() {
	

   //initialize selectbox
    if($('.bootstrap-select').length){$('.bootstrap-select').selectpicker();} 

/* ************************************************************************* */  
/* *************************** Initialize form components ********************** */  
/* ************************************************************************* */  
     

/* ************************************************************************* */ 
/* ************************* user module start ***************************** */
/* ************************************************************************* */ 


//       if($('#modules_user_list').length)
////       {
////      
////            $('#modules_user_list').DataTable
////            ({
////                processing: true,
////                serverSide: true,  
////                ajax: base_url+"/o4k/modules/UserModulesList",
////                columns: 
////                [ 
////                    { data: 'id', name: 'id' },
////                    { data: 'module_name', name: 'module_name' },
////                    { data: 'slug', name: 'slug' },
////                    {
////                        data: "created_at", sortable: true,
////                        render: function (data, type, full) {  return full.created_at; } 
////                    },
////                    {
////                    data: "status", sortable: true, 'sWidth': '10%',
////                    render: function (data, type, full) { 
////                    if(full.status=="1")  { return '<span class="label label-success">Active</span>';  }
////                    else  { return '<span class="label label-default">Inactive</span>'; }
////
////                    }
////
////                    },
////                    {
////                    data: "null",
////                    sortable: false,
////                    render: function (data, type, full) { 
////
////                    var  u = '<ul class="icons-list"><li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">'+
////                    '<i class="icon-menu9"></i></a><ul class="dropdown-menu dropdown-menu-right">'+
////                    '<li><a href="'+base_url+'/o4k/modules/user/edit/'+full.id+'"><i class=" icon-pen"></i> Edit Module</a></li>'+
////                    '<li><a Onclick="return ConfirmDelete();" class="delete_single" href="'+base_url+'/o4k/modules/user/destroy/'+full.id+'"><i class="icon-trash"></i> Delete Module</a></li>'+
////                    '</ul></li></ul>';                     
////                    return u;
////                    } 
////                    }
////                ]
////       
////        });
////        
////    }
//    
///* ************************************************************************* */  
///* *************************** user module add ***************************** */  
///* ************************************************************************* */ 


     $("#module_name").keyup(function() {
        $("#module_slug").val(generate_slug($("#module_name").val()));
    });
    
    
///*
//    * create form 
//    * params : Name,Status,Slug  
//*/
      
   $("#module_user_create").submit(function(e)
   {
        e.preventDefault(); 
        var Status          =   $("[name='status']").val().trim();
        var Name            =   $("[name='module_name']").val().trim();
        var Slug            =   $("[name='module_slug']").val().trim();
        var parent_module   =   $("[name='parent_module']").val().trim(); 
	   
        var module_type   =   $("[name='module_type']").val().trim(); 
        
        var a=0;
        var b=0;
        var c=0; 
        var d=0; 
        var e=0; 
        
        
        //Name
        if(Name.length > 0){
            a=1; 
            $( "#modulebox" ).removeClass( "has-error" );
            $("#modulebox .help-block").html(' ');
        }
        else{
            a=0; 
            $( "#modulebox" ).addClass( "has-error" ); 
            $("#modulebox .help-block").html('<label id="default_select-error" class="validation-error-label" for="default_select">This field is required.</label>');
        }
        
        
        
        //Status
        if(Status=='0' || Status=='1'){
            b=1;  
            $( "#module_status" ).removeClass( "has-error" );
            $("#module_status .help-block").html(' ');
        }
        else{
            b=0; 
            $$( "#module_status" ).addClass( "has-error" ); 
            $("#module_status .help-block").html('<label id="default_select-error" class="validation-error-label" for="default_select">Invalid status.</label>');
        }
        
        //Slug
        if(Slug.length > 0)
        {
            var gnsg= generate_slug($("#module_name").val());
          
            if(gnsg != Slug) { 
                  
                c=0;
                $( "#slugbox" ).addClass( "has-error" ); 
                $("#slugbox .help-block").html('<label id="default_select-error" class="validation-error-label" for="default_select">The generated slug is not matching.</label>');
            }
            else{ 
                c=1; $( "#slugbox" ).removeClass( "has-error" );
                $("#slugbox .help-block").html(' ');
            }   
        }
        else{
            
            c=0; 
            $( "#slugbox" ).addClass( "has-error" );
            $("#slugbox .help-block").html('<label id="default_select-error" class="validation-error-label" for="default_select">This feild is required</label>');
        }
       
        //module_type
       
        if(module_type=='0' || module_type=='1'){
             
            e=1;  
            $( "#typeBox" ).removeClass( "has-error" );
            $("#typeBox .help-block").html(' ');
        }
        else{
            e=0; 
            $("#typeBox" ).addClass( "has-error" ); 
            if(module_type=='select')
                $("#typeBox .help-block").html('<label id="default_select-error" class="validation-error-label" for="default_select">This feild is required.</label>');
            else
                $("#typeBox .help-block").html('<label id="default_select-error" class="validation-error-label" for="default_select">Invalid Module Type.</label>');
        }
        
        if (a===1 && b===1 && c===1   && e===1)
        {
            $( "#modulebox" ).removeClass( "has-error" );
            $("#modulebox .help-block").html(" "); 
            $( "#slugbox" ).removeClass( "has-error" );
            $("#slugbox .help-block").html(" ");
            $( "#parent_module" ).removeClass( "has-error" );
            $("#parent_module .help-block").html(' ');
             var action=   $("#module_user_create").attr('action');
             $.ajax({
                    type: "POST",
                    url:action,
                    dataType: "json",
                    async: false, 
                    data: new FormData($('#module_user_create')[0]),
                    processData: false,
                    contentType: false, 
                    success: function(response)
                    {     
                        if(response.hasOwnProperty("parent") )
                        {
                            if(response.parent=="1")
                            {
                                $( "#parent_module" ).addClass( "has-error" );
                                $("#parent_module .help-block").html(response.msg);   
                            }
                            
                        }else{
                            if(response.status==true){window.location.href = response.url;  }else{location.reload();$(".showalert").show(response.alert);}
                        }
   
                        
                    },
                    error: function (request, textStatus, errorThrown) {
                        
                       
                            var obj = request.responseJSON.errors ;

                            if(obj.hasOwnProperty("module_name") )
                            {
                               $("#modulebox .help-block").attr('style',  'color:#F44336 !important');
                               $( "#modulebox" ).addClass( "has-error" );
                               $("#modulebox .help-block").html("<div class='mad'>"+request.responseJSON.errors.module_name[0]+"</div>");   
                            }
                            if(obj.hasOwnProperty("module_slug") )
                            {
                                $( "#slugbox" ).addClass( "has-error" );
                                $("#slugbox .help-block").attr('style',  'color:#F44336 !important');
                                $("#slugbox .help-block").html("<div class='mad'>"+request.responseJSON.errors.module_slug[0]+"</div>");   
                            }                    

                    }
                });
            
        }
        
        return false;
       
   });
   
   
   
/* ************************************************************************* */  
/* *************************** user module add ***************************** */  
/* ************************************************************************* */ 
    
/*
    * create form 
    * params : Name,Status,Slug  
*/
      
//   $("#module_user_updates").submit(function(e)
//   {
//        e.preventDefault(); 
//        var Status          =   $("[name='status']").val().trim();
//        var Name            =   $("[name='module_name']").val().trim();
//        var Slug            =   $("[name='module_slug']").val().trim();
//        var parent_module   =   $("[name='parent_module']").val().trim(); 
//	    var module_country  =  $(".modulecountry").is(':checked');
//        var module_type   =   $("[name='module_type']").val().trim(); 
//        
//        var a=0;
//        var b=0;
//        var c=0; 
//        var d=0; 
//        var e=0; 
//        
//        
//        //Name
//        if(Name.length > 0){
//            a=1; 
//            $( "#modulebox" ).removeClass( "has-error" );
//            $("#modulebox .help-block").html(' ');
//        }
//        else{
//            a=0; 
//            $( "#modulebox" ).addClass( "has-error" ); 
//            $("#modulebox .help-block").html('<label id="default_select-error" class="validation-error-label" for="default_select">This field is required.</label>');
//        }
//        
//        
//        
//        //Status
//        if(Status=='0' || Status=='1'){
//            b=1;  
//            $( "#module_status" ).removeClass( "has-error" );
//            $("#module_status .help-block").html(' ');
//        }
//        else{
//            b=0; 
//            $$( "#module_status" ).addClass( "has-error" ); 
//            $("#module_status .help-block").html('<label id="default_select-error" class="validation-error-label" for="default_select">Invalid status.</label>');
//        }
//        
//        //Slug
//        if(Slug.length > 0)
//        {
//            var gnsg= generate_slug($("#module_name").val());
//          
//            if(gnsg != Slug) { 
//                  
//                c=0;
//                $( "#slugbox" ).addClass( "has-error" ); 
//                $("#slugbox .help-block").html('<label id="default_select-error" class="validation-error-label" for="default_select">The generated slug is not matching.</label>');
//            }
//            else{ 
//                c=1; $( "#slugbox" ).removeClass( "has-error" );
//                $("#slugbox .help-block").html(' ');
//            }   
//        }
//        else{
//            
//            c=0; 
//            $( "#slugbox" ).addClass( "has-error" );
//            $("#slugbox .help-block").html('<label id="default_select-error" class="validation-error-label" for="default_select">This feild is required</label>');
//        }
//        
//	    //module_country
//        if(module_country== true){
//            d=1;  
//            $( "#countryerror" ).removeClass( "has-error" );
//            $("#countryerror .help-block").html(' ');
//        }else{
//            d=0; 
//            $( "#countryerror" ).addClass( "has-error" );
//            $("#countryerror .help-block").html('<label id="default_select-error" class="validation-error-label" for="default_select">Select at least one.</label>');
//        }
//        
//        
//        //module_type
//       
//        if(module_type=='0' || module_type=='1'){
//             
//            e=1;  
//            $( "#typeBox" ).removeClass( "has-error" );
//            $("#typeBox .help-block").html(' ');
//        }
//        else{
//            e=0; 
//            $("#typeBox" ).addClass( "has-error" ); 
//            if(module_type=='select')
//                $("#typeBox .help-block").html('<label id="default_select-error" class="validation-error-label" for="default_select">This feild is required.</label>');
//            else
//                $("#typeBox .help-block").html('<label id="default_select-error" class="validation-error-label" for="default_select">Invalid Module Type.</label>');
//        }
//        
//        if (a===1 && b===1 && c===1 && d===1 && e===1)
//        {
//            $( "#modulebox" ).removeClass( "has-error" );
//            $("#modulebox .help-block").html(" "); 
//            $( "#slugbox" ).removeClass( "has-error" );
//            $("#slugbox .help-block").html(" ");
//            $( "#parent_module" ).removeClass( "has-error" );
//            $("#parent_module .help-block").html(' ');
//            
//             $.ajax({
//                    type: "POST",
//                    url:base_url+"/o4k/modules/user/update/"+$("#module_user_updates").attr('data-id'),
//                    dataType: "json",
//                    async: false, 
//                    data: new FormData($('#module_user_updates')[0]),
//                    processData: false,
//                    contentType: false, 
//                    success: function(response)
//                    {     
//                        if(response.hasOwnProperty("parent") )
//                        {
//                            if(response.parent=="1")
//                            {
//                                $( "#parent_module" ).addClass( "has-error" );
//                                $("#parent_module .help-block").html(response.msg);   
//                            }
//                            
//                        }else{
//                            if(response.status==true){window.location.href = response.url;  }else{location.reload();$(".showalert").show(response.alert);}
//                        }
//   
//                        
//                    },
//                    error: function (request, textStatus, errorThrown) {
//                        
//                       
//                            var obj = request.responseJSON.errors ;
//
//                            if(obj.hasOwnProperty("module_name") )
//                            {
//                               $("#modulebox .help-block").attr('style',  'color:#F44336 !important');
//                               $( "#modulebox" ).addClass( "has-error" );
//                               $("#modulebox .help-block").html("<div class='mad'>"+request.responseJSON.errors.module_name[0]+"</div>");   
//                            }
//                            if(obj.hasOwnProperty("module_slug") )
//                            {
//                                $( "#slugbox" ).addClass( "has-error" );
//                                $("#slugbox .help-block").attr('style',  'color:#F44336 !important');
//                                $("#slugbox .help-block").html("<div class='mad'>"+request.responseJSON.errors.module_slug[0]+"</div>");   
//                            }                      
//
//                    }
//                });
//            
//        }
//        
//        return false;
//       
//   });
    
/* ************************************************************************* */ 
/* ************************************************************************* */ 
  
});
