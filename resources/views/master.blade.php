<!DOCTYPE html>
<html lang="{{ app()->getLocale() }}">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <meta property="og:url" content="{{url()->current()}}"/>
    <meta property="og:type" content="website"/>
    <meta property="og:title" content="{{$title ?? $setting->title}}"/>
    <meta property="og:description" content="{{$description ?? $setting->descriptions}}"/>
    <meta property="og:image" content="{{$imagePoster ?? asset('css/icons/logo.jpg')}}"/>
    <meta name="description" content="{{$description ?? $setting->descriptions}}">
    <meta name="keywords" content="{{$keyword ?? $setting->keywords}}">
    <base href="{{url('')}}">
    <link rel="stylesheet" href="{{asset('css/bootstrap.min.css')}}">
    <link rel="stylesheet" href="{{asset('css/font-awesome.min.css')}}">
    <link rel="stylesheet" href="{{asset('css/app.min.css')}}">
    <link rel="stylesheet" href="{{asset('css/swiper.min.css')}}">
    <script src="https://content.jwplatform.com/libraries/90pS7TYy.js"></script>
    <link href="{{asset('css/video-js.css')}}" rel="stylesheet"/>
    <script src="{{asset('js/videojs-ie8.min.js')}}"></script>
    <script src="{{asset('js/jquery-3.2.1.min.js')}}"></script>
    <script src="{{asset('js/bootstrap.min.js')}}"></script>
    <script src="{{asset('js/swiper.min.js')}}"></script>
    <script src="{{asset('js/app.min.js')}}"></script>
    <title>{{$title ?? $setting->title}}</title>
</head>
<body id="root">
<div id="fb-root"></div>
<script src="{{asset('js/video.js')}}"></script>
<script>(function (d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s);
    js.id = id;
    js.src = 'https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.12&appId=1830570347236325&autoLogAppEvents=1';
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));</script>
<header>
    <div class="header-logo">
        <a href="{{route('home')}}" title="Home">
            <img src="{{asset('css/icons/logo.jpg')}}" alt="LOGO"/>
        </a>
    </div>
    <div class="search-box">
        <button class="search-box_button">
            <i class="fa fa-search"></i>
        </button>
        <input type="text" placeholder="Tìm kiếm phim, diễn viên, đạo diễn..." class="search-box_input"/>
        <button class="search-box_button_open"><i class="fa fa-search"></i></button>
    </div>
    <button class="btn-toggle">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
    </button>
</header>
<div id="content">
    @include('slide')
    @yield('content')
</div>
<footer>
    <ul>
        <li>
            <img src="{{asset('css/icons/logo.jpg')}}" alt="LOGO"/>
        </li>
        <li class="footer-inline">
            <a href="{{url('hoi-dap-huong-dan')}}">Hỏi đáp - Hướng dẫn</a>
        </li>
        <li class="footer-inline">
            <a href="{{url('dieu-khoan-su-dung')}}">Điều khoản sử dụng</a></li>
        <li class="footer-inline">
            <a href="#">Liên hệ quảng cáo</a></li>
        <li>
            Copyright ©{{date('Y')}} PHIMHD+. All Rights Reserved.
        </li>
    </ul>
</footer>
</body>
</html>