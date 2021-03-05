@extends('master')
@section('content')
    <div class="container">
        <div class="col-md-9 col-sm-8">
            <a href="{{route('film.view', ['uri' => Help::beauty($film->name), 'id' => $film->id])}}">
                <div class="slide-home">
                    <div class="thumb" style="background-image: url({{$film->poster}});"></div>
                    <div class="play"></div>
                </div>
            </a>
            <div class="list-film">
                <h1 class="title" style="color: rgb(255, 94, 0);">
                    {{$film->name}}
                </h1>
                <div class="fb-like" data-href="{{url()->current()}}" data-layout="standard" data-action="like"
                     data-size="small" data-show-faces="true" data-share="true"></div>
                <div class="film-detail">
                    <a href="{{route('film.view', ['uri' => Help::beauty($film->name), 'id' => $film->id])}}">
                        <button class="btn btn-inline btn-success">
                            <i class="fa fa-play-circle"></i>
                            XEM PHIM
                        </button>
                    </a>
                    @if (Auth::check())
                        <a href="{{route('film.download', ['uri' => Help::beauty($film->name), 'id' => $film->id])}}">
                            <button class="btn btn-inline btn-danger">
                                <i class="fa fa-download"></i>
                                DOWNLOAD
                            </button>
                        </a>
                        @if (sizeof(App\Like::where([['user_id', Auth::id()], ['film_id', $film->id]])->get()) === 0)
                            <button id="like-button" data-id="{{$film->id}}" class="btn btn-inline btn-primary">
                                <i class="fa fa-heart"></i>
                                <span>Yêu thích</span>
                            </button>
                        @else
                            <button id="like-button" data-id="{{$film->id}}" class="btn btn-inline btn-primary">
                                <i class="fa fa-heart" style="color: #f00"></i>
                                <span>Đã thích</span>
                            </button>
                        @endif
                    @endif
                    <span>Đánh giá:
                        <span class="star-point">{{$film->total_vote}}</span>
                        <i class="fa fa-star" style="color: #ED8A19"></i> ({{sizeof($film->vote)}} votes)</span>
                    <span>Lượt xem: {{$film->view}}</span>
                    <span>Đạo  diễn: {{$film->director}}</span>
                    <span>Diễn viên: {!! Help::actorTags($film) !!}</span>
                    @if ($film->type === 2)
                        <span>Số tập: {{sizeof($film->filmDetail)}}/{{$film->episode}}</span>
                    @endif
                    <span>Thể  loại: {!! Help::listCategory($film->category) !!}</span>
                    <span>Tags: {!! Help::tags($film) !!}</span>
                    <div class="film-about">
                        {{$film->about}}
                    </div>
                </div>
            </div>
            <div class="list-film">
                <h1 class="title">BÌNH LUẬN PHIM</h1>
                <div class="fb-comments" data-href="{{url()->current()}}" data-numposts="10"></div>
            </div>
            <div class="list-film">
                <h1 class="title">PHIM CÙNG THỂ LOẠI</h1>
                <div class="row">
                    @foreach ($relate as $item)
                        <div class="col-md-3 col-sm-4 col-xs-6">
                            <div class="list-item" title="{{$item->name}}">
                                <div class="star-rank-{{$item->total_vote}}"></div>
                                @if ($item->type === 2)
                                    <div class="episode">{{sizeof($item->filmDetail)}}/{{$item->episode}}</div>
                                @endif
                                <div class="thumb" style="background-image: url({{$item->poster}});"></div>
                                <div class="play"></div>
                                <div class="black-gradient"></div>
                                <div class="film-name">
                                    <a href="{{route('film', ['uri' => Help::beauty($item->name), 'id' => $item->id])}}"
                                       title="{{$item->name}}">{{$item->name}}</a>
                                </div>
                            </div>
                        </div>
                    @endforeach
                </div>
                @if (count($film->toArray()) === 0)
                    <table class="admin-table">
                        <tr>
                            <td>
                                Chưa có phim nào trong thể loại này!
                            </td>
                        </tr>
                    </table>
                @endif
                {{$relate->links()}}
            </div>
        </div>
        <div class="col-md-3 col-sm-4">
            @include('slide_right')
        </div>
    </div>
@endsection