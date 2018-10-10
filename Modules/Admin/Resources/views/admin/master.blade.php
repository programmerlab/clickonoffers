
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>@yield('title')</title>
  <meta name="csrf-token" content="{{ csrf_token() }}">
<!-- Global stylesheets --> 
<link href="https://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700,900" rel="stylesheet" type="text/css">
<link href="{{asset('public/admin/css/icons/icomoon/styles.css')}}" rel="stylesheet" type="text/css">
<link href="{{asset('public/admin/css/bootstrap.css')}}" rel="stylesheet" type="text/css">
<link href="{{asset('public/admin/css/components.css')}}" rel="stylesheet" type="text/css">
<link href="{{asset('public/admin/css/colors.css')}}" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="{{asset('public/admin/css/uikit/css/uikit.almost-flat.min.css')}}" media="all">
<link href="{{asset('public/admin/css/main.min.css')}}" rel="stylesheet" type="text/css">
<link href="{{asset('public/admin/css/core.css')}}" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="{{asset('public/admin/css/themes/themes_combined.min.css')}}" media="all">
<link href="{{asset('public/admin/css/custom/dashboard.css')}}" rel="stylesheet" type="text/css">
<!-- /global stylesheets -->

@yield('css')

<!--   JS files -->
<script type="text/javascript" src="{{asset('public/js/jquery.min.js')}}"></script>
<script type="text/javascript" src="{{asset('public/js/bootstrap.min.js')}}"></script>
<script type="text/javascript" src="{{asset('public/admin/js/plugins/loaders/blockui.min.js')}}"></script>
<!-- /core JS files -->

<!-- theme JS files -->
<script type="text/javascript" src="{{asset('public/admin/js/core/app.js')}}"></script>
<script type="text/javascript" src="{{asset('public/admin/js/plugins/ui/ripple.min.js')}}"></script>
<!-- /theme JS files -->
<script>
var base_url = "{{URL::to('/')}}";
</script>
 <script type="text/javascript" src="{{asset('public/admin/js/common.js')}}"></script>
<script src="{{asset('Modules/Admin/Resources/assets/js/CheckLogin.js')}}"></script>
</head>

<body class="navbar-bottom">

    <!-- Main navbar -->
    <div class="navbar navbar-inverse bg-indigo">
        <div class="navbar-header">
        <a class="navbar-brand" href="{{URL('/o4k/')}} "><img style="height: 24px;" src="{{asset('public/images/logo.png')}}" alt=""></a>
        <ul class="nav navbar-nav visible-xs-block">
        <li><a data-toggle="collapse" data-target="#navbar-mobile"><i class="icon-tree5"></i></a></li>
        <li><a class="sidebar-mobile-main-toggle"><i class="icon-paragraph-justify3"></i></a></li>
        </ul>
        </div>

        <div class="navbar-collapse collapse" id="navbar-mobile">
            <ul class="nav navbar-nav">
                <li><a class="sidebar-control sidebar-main-toggle hidden-xs"><i class="icon-paragraph-justify3"></i></a></li>
            </ul>


        <ul class="nav navbar-nav navbar-right">
       



        <li class="dropdown dropdown-user">
        <a class="dropdown-toggle" data-toggle="dropdown">
        <img src="{{asset('public/images/placeholder.jpg')}}" alt="">
        <span>{{Auth::guard('admin')->user()->name}}</span>
        <i class="caret"></i>
        </a>

        <ul class="dropdown-menu dropdown-menu-right">
        <li><a href="{{URL('/o4k/')}}"><i class="icon-home2"></i>Dashboard</a></li>  
        <li><a href="{{URL('/o4k/logout')}}"><i class="icon-switch2"></i> Logout</a></li>
        </ul>
        </li>
        </ul>
        </div>
    </div>
    <!-- /main navbar -->


<!-- Page header -->
<div class="page-header">
@yield('heading')
</div>
<!-- /page header -->


<!-- Page container -->
<div class="page-container">

<!-- Page content -->
<div class="page-content">

<!-- Main sidebar -->
<div class="sidebar sidebar-main sidebar-default">
<div class="sidebar-content">
@include('admin::admin.sidebar')				
</div>
</div>
<!-- /main sidebar -->

<!-- Main content -->
<div class="content-wrapper"> 
@yield('content') 
</div>
<!-- /main content -->

</div>
<!-- /page content -->
</div>
<!-- /page container -->
<!--js -->
@yield('js')
<!-- /page js -->
<!--scripts -->
@stack('scripts')
<!-- /page scripts -->
</body>
</html>
