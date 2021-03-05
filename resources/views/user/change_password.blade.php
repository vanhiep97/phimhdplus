@extends('master')
@section('content')
    <div class="login-dialog">
        <div id="result"></div>
        <form id="change-pass-form">
            <input type="hidden" name="redirectUrl" value="{{request()->redirectUrl}}">
            @if (!empty(Auth::user()->password))
                <label for="">Mật khẩu cũ:</label>
                <input type="password" name="old_password">
            @endif
            <label for="">Mật khẩu mới:</label>
            <input type="password" name="new_password">
            <label for="">Nhập lại mật khẩu:</label>
            <input type="password" name="re_password">
            <button class="button">Đổi mật khẩu</button>
        </form>
    </div>
@endsection