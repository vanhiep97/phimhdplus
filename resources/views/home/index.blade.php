@extends('master') @section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-9 col-sm-8">
                <div class="slide-home">
                    <div class="swiper-container">
                        <!-- Additional required wrapper -->
                        <div class="swiper-wrapper">
                            <!-- Slides -->
                            @foreach ($slide as $item)
                                <div class="swiper-slide">
                                    <a href="{{route('film', ['uri' => Help::beauty($item->name), 'id' => $item->id])}}"
                                       title="{{$item->name}}">
                                        <img src="{{$item->poster}}" alt="" class="thumb">
                                    </a>
                                </div>
                            @endforeach
                        </div>
                        <!-- If we need pagination -->
                        <div id="swiper-home" class="swiper-pagination"></div>
                    </div>
                </div>
                <div class="list-film">
                    <h1 class="title">
                        PHIM BỘ MỚI NHẤT
                        <span>
                        <a href="{{route('phimbo')}}"></a>
                    </span>
                    </h1>
                    <div class="swiper-container">
                        <div class="swiper-wrapper">
                            @foreach ($filmBo as $item)
                                <div class="swiper-slide col-md-3 col-sm-3 col-xs-6">
                                    <div class="list-item" title="{{$item->name}}">
                                        <a href="{{route('film', ['uri' => Help::beauty($item->name), 'id' => $item->id])}}"
                                           title="{{$item->name}}">
                                            <div class="star-rank-{{$item->total_vote}}"></div>
                                            @if ($item->type === 2)
                                                <div class="episode">{{sizeof($item->filmDetail)}}
                                                    /{{$item->episode}}</div>
                                            @endif
                                            <div class="thumb" style="background-image: url({{$item->poster}});"></div>
                                            <div class="play"></div>
                                            <div class="black-gradient"></div>
                                            <div class="film-name">
                                                {{$item->name}}
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            @endforeach
                        </div>
                    </div>
                </div>
                <div class="list-film">
                    <h1 class="title">
                        PHIM LẺ MỚI
                        <span>
                        <a href="{{route('phimle')}}"></a>
                    </span>
                    </h1>
                    <div class="swiper-container">
                        <div class="swiper-wrapper">
                            @foreach ($filmLe as $item)
                                <div class="swiper-slide col-md-3 col-sm-3 col-xs-6">
                                    <div class="list-item" title="{{$item->name}}">
                                        <a href="{{route('film', ['uri' => Help::beauty($item->name), 'id' => $item->id])}}"
                                           title="{{$item->name}}">
                                            <div class="star-rank-{{$item->total_vote}}"></div>
                                            @if ($item->type === 2)
                                                <div class="episode">{{sizeof($item->filmDetail)}}
                                                    /{{$item->episode}}</div>
                                            @endif
                                            <div class="thumb" style="background-image: url({{$item->poster}});"></div>
                                            <div class="play"></div>
                                            <div class="black-gradient"></div>
                                            <div class="film-name">
                                                {{$item->name}}
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            @endforeach
                        </div>
                    </div>
                </div>
                <div class="list-film">
                    <h1 class="title">
                        TOP PHIM MỚI
                        <span>
                        <a href="{{route('phimmoi')}}"></a>
                    </span>
                    </h1>
                    <div class="swiper-container">
                        <div class="swiper-wrapper">
                            @foreach ($filmNew as $item)
                                <div class="swiper-slide col-md-3 col-sm-3 col-xs-6">
                                    <div class="list-item" title="{{$item->name}}">
                                        <a href="{{route('film', ['uri' => Help::beauty($item->name), 'id' => $item->id])}}"
                                           title="{{$item->name}}">
                                            <div class="star-rank-{{$item->total_vote}}"></div>
                                            @if ($item->type === 2)
                                                <div class="episode">{{sizeof($item->filmDetail)}}
                                                    /{{$item->episode}}</div>
                                            @endif
                                            <div class="thumb" style="background-image: url({{$item->poster}});"></div>
                                            <div class="play"></div>
                                            <div class="black-gradient"></div>
                                            <div class="film-name">
                                                {{$item->name}}
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            @endforeach
                        </div>
                    </div>
                </div>
                <div class="list-film">
                    <h1 class="title">TOP PHIM XEM NHIỀU</h1>
                    <div class="swiper-container">
                        <div class="swiper-wrapper">
                            @foreach ($filmMostView as $item)
                                <div class="swiper-slide col-md-3 col-sm-3 col-xs-6">
                                    <div class="list-item" title="{{$item->name}}">
                                        <a href="{{route('film', ['uri' => Help::beauty($item->name), 'id' => $item->id])}}"
                                           title="{{$item->name}}">
                                            <div class="star-rank-{{$item->total_vote}}"></div>
                                            @if ($item->type === 2)
                                                <div class="episode">{{sizeof($item->filmDetail)}}
                                                    /{{$item->episode}}</div>
                                            @endif
                                            <div class="thumb" style="background-image: url({{$item->poster}});"></div>
                                            <div class="play"></div>
                                            <div class="black-gradient"></div>
                                            <div class="film-name">
                                                {{$item->name}}
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            @endforeach
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-4">
                @include('slide_right')
            </div>
        </div>
        <script>
          var swiper = new Swiper('.slide-home .swiper-container', {
            pagination: {
              el: '.swiper-pagination',
              type: 'progressbar',
            },
            autoplay: {
              delay: 5000,
            },
          });
          var width = window.innerWidth;
          var newFilm = new Swiper('.list-film .swiper-container', {
            slidesPerView: 4,
            slidesPerColumn: 2,
            breakpoints: {
              480: {
                slidesPerView: 2
              },
              1024: {
                slidesPerView: 3
              }
            }
          });
        </script>
@endsection