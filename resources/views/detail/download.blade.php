@extends('master')
@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-9 col-sm-8">
                <a href="{{route('film.view', ['uri' => Help::beauty($film->name), 'id' => $film->id])}}">
                    <div class="slide-home">
                        <div class="thumb" style="background-image: url({{$film->poster}});"></div>
                        <div class="play"></div>
                    </div>
                </a>
                <div class="list-film">
                    <h1 class="title" style="color: rgb(255, 94, 0);">
                        Download: {{$film->name}}
                    </h1>
                    <div class="fb-like" data-href="{{url()->current()}}" data-layout="standard" data-action="like"
                         data-size="small" data-show-faces="true" data-share="true"></div>
                    <div class="film-action">
                        <button class="report" data-film="{{$film->id}}">
                            <i class="fa fa-flag-checkered"></i>
                            Báo lỗi
                        </button>
                    </div>
                    @if (sizeof($film->filmDetail) === 0)
                        <div class="alert alert-danger">
                            Không tìm thấy file download của phim này
                        </div>
                    @else
                        @if ($film->type === 2)
                            <div id="download-div" style="display: none">
                                <span>Chọn chất lượng: </span>
                                <a href="" id="download-m18">
                                    <button class="btn btn-danger">480p</button>
                                </a>
                                <a href="" id="download-m22">
                                    <button class="btn btn-danger">720p</button>
                                </a>
                                <a href="" id="download-m36">
                                    <button class="btn btn-danger">1080p</button>
                                </a>
                            </div>
                            <span>Danh sách tập: </span>
                            @if ($film->type === 2)
                                <div class="film-eposide-download">
                                    @foreach ($film->filmDetail as $item)
                                        <span data-eposide="{{$item->id}}">{{++$loop->index}}</span>
                                    @endforeach
                                </div>
                            @endif
                        @else
                            <div id="download-div">
                                Chọn chất lượng:
                                <a href="{{route('film.download.start', ['uri' => base64_encode($film->filmDetail->first()->name.'.'.$film->filmDetail->first()->id.'.m18')])}}"
                                   id="download-m18">
                                    <button class="btn btn-danger">480p</button>
                                </a>
                                <a href="{{route('film.download.start', ['uri' => base64_encode($film->filmDetail->first()->name.'.'.$film->filmDetail->first()->id.'.m18')])}}"
                                   id="download-m18">
                                    <button class="btn btn-danger">720p</button>
                                </a>
                                <a href="{{route('film.download.start', ['uri' => base64_encode($film->filmDetail->first()->name.'.'.$film->filmDetail->first()->id.'.m18')])}}"
                                   id="download-m18">
                                    <button class="btn btn-danger">1080p</button>
                                </a>
                            </div>
                        @endif
                    @endif
                </div>
            </div>
            <div class="col-md-3 col-sm-4">
                @include('slide_right')
            </div>
        </div>
    </div>
@endsection