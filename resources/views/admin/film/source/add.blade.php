@extends('master')
@section('content')
    <div class="container">
        <div class="list-film">
            <h1 class="title">THÊM RESOURCE PHIM - {{$film->name}}</h1>
            <form class="admin-form" enctype="multipart/form-data" id="add-source-form" data-film-id="{{$film->id}}">
                <div id="result"></div>
                <div class="row">
                    <div class="col-md-6 col-sm-6">
                        <label for="">Tên source (tên tập phim):</label>
                        <input type="text" name="name">
                        <label for="">Source 480p</label>
                        <textarea name="m18"></textarea>
                        <label for="">Source 720p</label>
                        <textarea name="m22"></textarea>
                        <label for="">Source 1080p</label>
                        <textarea name="m36"></textarea>
                    </div>
                    <div class="col-md-6 col-sm-6">
                        <label for="">Source 480p VIP</label>
                        <textarea name="m18_vip"></textarea>
                        <label for="">Source 720p VIP</label>
                        <textarea name="m22_vip"></textarea>
                        <label for="">Source 1080p VIP</label>
                        <textarea name="m36_vip"></textarea>
                        <button class="button">Thêm Source</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
@endsection