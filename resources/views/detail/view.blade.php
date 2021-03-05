@extends('master')
@section('content')
    <div class="container">
        <div class="col-md-9 col-sm-8">
            @if (sizeof($film->filmDetail) === 0)
                <div id="player">
                    <script>
                      play('', '');
                    </script>
                </div>
            @else
                <video
                        id="my-video"
                        class="video-js"
                        controls
                        preload="auto"
                        width="850"
                        height="475"
                        poster="{{ "/images/" .$film->poster }}"
                        data-setup='{ "controls": true, "autoplay": true, "preload": "auto" }'
                >
                    <source src="{{ '/videos/' .$film->filmDetail->first()->source1 }}" type="video/mp4"/>
                    <source src="{{ '/videos/' .$film->filmDetail->first()->source1 }}" type="video/webm"/>
                    <p class="vjs-no-js">
                        Để xem video này, vui lòng bật JavaScript và xem xét nâng cấp lên trình duyệt web
                        <a href="https://videojs.com/html5-video-support/" target="_blank"> supports HTML5 video</a>
                    </p>
                </video>
            @endif
            <div class="film-action">
                @if (!Auth::check() || Auth::check() && !Auth::user()->vip)
                    <button class="off-ads">
                        <i class="fa fa-toggle-off"></i>
                        Tắt Quảng Cáo
                    </button>
                @endif
                <button class="report" data-film="{{$film->id}}">
                    <i class="fa fa-flag-checkered"></i>
                    Báo lỗi phim
                </button>
            </div>
            <div class="list-film">
                <h1 class="title" style="color: rgb(255, 94, 0);">
                    {{$film->name}}
                </h1>
                @if (Auth::check())
                    @if (sizeof(Auth::user()->vote()->where('film_id', $film->id)->get()) === 0)
                        <div class="film-vote">
                            <span>ĐÁNH GIÁ PHIM</span>
                            <span>
                                <span class="star-point">0</span>
                            </span>
                            <div class="list-star" data-id="{{$film->id}}">
                                <span class="star-white"></span>
                                <span class="star-white"></span>
                                <span class="star-white"></span>
                                <span class="star-white"></span>
                                <span class="star-white"></span>
                            </div>
                        </div>
                    @else
                        <div class="film-vote">
                            <span>BẠN ĐÃ ĐÁNH GIÁ</span>
                            <span>
                                <span class="star-point">{{Auth::user()->vote()->where('film_id', $film->id)->first()->point}}</span>
                            </span>
                            <div class="list-star">
                                @for ($i = 0; $i < Auth::user()->vote()->where('film_id', $film->id)->first()->point; $i++)
                                    <span class="star"></span>
                                @endfor
                                @for ($i = 0; $i < (5 - Auth::user()->vote()->where('film_id', $film->id)->first()->point); $i++)
                                    <span class="star-white2"></span>
                                @endfor
                            </div>
                        </div>
                    @endif
                @endif
                <div class="fb-like" data-href="{{url()->current()}}" data-layout="standard" data-action="like"
                     data-size="small" data-show-faces="true" data-share="true"></div>
                @if ($film->type === 2)
                    <div class="film-eposide">
                        @foreach ($film->filmDetail as $item)
                            <span {{$loop->index ? '' : 'class=active'}} data-eposide="{{$item->id}}">{{++$loop->index}}</span>
                        @endforeach
                    </div>
                @endif
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
                                <a href="{{route('film', ['uri' => Help::beauty($item->name), 'id' => $item->id])}}"
                                   title="{{$item->name}}">
                                <div class="star-rank-{{$item->total_vote}}"></div>
                                @if ($item->type === 2)
                                    <div class="episode">{{sizeof($item->filmDetail)}}/{{$item->episode}}</div>
                                @endif
                                <div class="thumb" style="background-image: url({{"/images/" .$item->poster}});"></div>
                                <div class="play"></div>
                                <div class="black-gradient"></div>
                                <div class="film-name">
                                    <a href="{{route('film', ['uri' => Help::beauty($item->name), 'id' => $item->id])}}"
                                       title="{{$item->name}}">{{$item->name}}</a>
                                </div>
                                </a>
                            </div>
                        </div>
                    @endforeach
                </div>
                @if (sizeof($film->toArray()) === 0)
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
    <script>
      jwplayer().on('setupError', function () {
        $('<div/>').addClass('over').appendTo('body');
        $('body').append('<div class="login-dialog"><span class="closex"></span><div class="alert alert-danger center" style="font-size: 16px;">Có lỗi xảy ra, có thể do mạng yếu hoặc tập phim này không tồn tại. Hãy thử F5 lại trang web!</div></div>');
      });
      jwplayer().on('error', function () {
        $('<div/>').addClass('over').appendTo('body');
        $('body').append('<div class="login-dialog"><span class="closex"></span><div class="alert alert-danger center" style="font-size: 16px;">Có lỗi xảy ra, có thể do mạng yếu hoặc không thể phát tập phim này. Hãy thử F5 lại trang web!</div></div>');
      });
    </script>
@endsection