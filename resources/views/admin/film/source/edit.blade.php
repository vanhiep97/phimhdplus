@extends('master')
@section('content')
    <div class="container">
        <div class="list-film">
            <h1 class="title">SỬA RESOURCE - {{$filmDetail->name}}</h1>
            <form class="admin-form" enctype="multipart/form-data" id="edit-source-form"
                  data-film-id="{{$filmDetail->film->id}}" data-id="{{$filmDetail->id}}">
                <div id="result"></div>
                <div class="row">
                    <div class="col-md-6 col-sm-6">
                        <label for="">Tên source (tên tập phim):</label>
                        <input type="text" name="name" value="{{$filmDetail->name}}">
                        <label for="">Source 480p</label>
                        <textarea name="m18">{{$filmDetail->source1}}</textarea>
                        <label for="">Source 720p</label>
                        <textarea name="m22">{{$filmDetail->source2}}</textarea>
                        <label for="">Source 1080p</label>
                        <textarea name="m36">{{$filmDetail->source3}}</textarea>
                    </div>
                    <div class="col-md-6 col-sm-6">
                        <label for="">Source 480p VIP</label>
                        <textarea name="m18_vip">{{$filmDetail->source_vip1}}</textarea>
                        <label for="">Source 720p VIP</label>
                        <textarea name="m22_vip">{{$filmDetail->source_vip2}}</textarea>
                        <label for="">Source 1080p VIP</label>
                        <textarea name="m36_vip">{{$filmDetail->source_vip3}}</textarea>
                        <button class="button">Lưu Source</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
@endsection