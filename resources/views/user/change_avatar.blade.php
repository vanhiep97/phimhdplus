@extends('master')
@section('content')
    <div class="login-dialog">
        <div id="result"></div>
        <form id="change-avatar-form" enctype="multipart/form-data">
            <label for="">Avatar cũ:</label>
            <img src="{{Auth::user()->avatar}}" style="width: 100px; height: 100px; display: block; margin: 0 auto;">
            <input type="hidden" name="redirectUrl" value="{{request()->redirectUrl}}">
            <input type="file" name="avatar">
            <button class="button">Upload</button>
        </form>
    </div>
@endsection