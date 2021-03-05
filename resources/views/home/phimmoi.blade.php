@extends('master')
@section('content')
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
                    <h1 class="title" style="text-transform: uppercase">TOP MỚI NHẤT</h1>
                    <div class="row">
                        @foreach ($filmMoi as $item)
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
                    @if (sizeof($filmMoi) === 0)
                        <table class="admin-table">
                            <tr>
                                <td>
                                    Chưa có phim nào trong thể loại này!
                                </td>
                            </tr>
                        </table>
                    @endif
                    {{$filmMoi->links()}}
                </div>
            </div>
            <div class="col-md-3 col-sm-4">
                @include('slide_right')
            </div>
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
    </script>
@endsection