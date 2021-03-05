@extends('master')
@section('content')
    <div class="container">
        <h1 class="title">TÌM KIẾM NÂNG CAO</h1>
        <div class="row">
            <div class="col-md-3 col-sm-4">
                <div class="list-film">
                    <div class="admin-form">
                        <form>
                            <input type="text" name="keys" placeholder="Nhập tên phim, diễn viên, đạo diễn...">
                            <button class="button">Tìm kiếm</button>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-md-9 col-sm-8">
                <div class="list-film">
                    @if ($film)
                        <h1 class="title">KẾT QUẢ TÌM KIẾM</h1>
                        <table class="admin-table">
                            <tr>
                                <td>Tìm thấy {{sizeof($film)}} kết quả với từ khoá "<b>{{$keys}}</b>"</td>
                            </tr>
                        </table>
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