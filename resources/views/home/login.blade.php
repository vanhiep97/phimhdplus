@extends('master')
@section('content')
    <div class="login-dialog">
        <div id="result"></div>
        <form id="login-form">
            <input type="hidden" name="redirectUrl" value="{{request()->redirectUrl}}">
            <div class="input">
                <input type="email" name="email" placeholder="Email"/>
            </div>
            <div class="input">
                <input type="password" name="password" placeholder="Mật khẩu"/>
            </div>
            <button class="button">Đăng nhập</button>
        </form>
        <a href="{{route('register')}}">
            <button class="button">Đăng ký tài khoản</button>
        </a>
        <span class="login-choose">hoặc</span>
        <a href="{{route('login.facebook')}}">
            <button class="button btn-facebook"><i class="fa fa-facebook"></i> Đăng nhập bằng Facebook</button>
        </a>
    </div>
@endsection