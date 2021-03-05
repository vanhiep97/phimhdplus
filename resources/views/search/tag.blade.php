@extends('master')
@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-3 col-sm-4">
                <div class="list-film">
                    <h1 class="title">TAGS PHỔ BIẾN</h1>
                    @foreach ($tags as $item)
                        {!! Help::tags($item) !!},
                    @endforeach
                </div>
            </div>
            <div class="col-md-9 col-sm-8">
                <div class="list-film">
                    @if ($film)
                        <h1 class="title">TAGS: {{$key}}</h1>
                        <div class="row">
                            @foreach ($film as $item)
                                <div class="col-md-3 col-sm-4 col-xs-6">
                                    <div class="list-item" title="{{$item->name}}">
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
                                    </div>
                                </div>
                            @endforeach
                        </div>
                        {{$film->links()}}
                    @endif
                </div>
            </div>
        </div>
    </div>
@endsection