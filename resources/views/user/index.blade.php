@extends('master')
@section('content')
    <div class="container">
        <h1 class="title">QUẢN LÝ TÀI KHOẢN</h1>
        <div class="row">
            <div class="col-md-3 col-sm-4">
                <div class="list-film">
                    <h1 class="title">CHỨC NĂNG</h1>
                    <ul class="admin-slide">
                        <li><a href="{{route('user.avatar')}}">Đổi avatar</a></li>
                        <li>
                            <a href="{{route('user.pass')}}">
                                @if (empty(Auth::user()->password))
                                    <b style="color: red">Đặt mật khẩu</b>
                                @else
                                    Đổi mật khẩu
                                @endif
                            </a></li>
                        @if(!Auth::user()->vip)
                            <li><a href="{{route('user.upgrade')}}" style="color: red; font-weight: bold;">Nâng cấp
                                    VIP</a></li>
                        @endif
                        <li><a href="{{route('user.recharge')}}">Nạp Credit</a></li>
                        <li>Yêu cầu post phim</li>
                    </ul>
                </div>
            </div>
            <div class="col-md-9 col-sm-8">
                <div class="list-film row">
                    <h3 class="title">Tài khoản: {{Auth::user()->email}}</h3>
                    <div class="col-md-3 col-sm-3">
                        <div class="list-item">
                            <div class="thumb" style="background-image: url({{Auth::user()->avatar}})"></div>
                        </div>
                    </div>
                    <div class="user-info col-md-9 col-sm-9">
                        <span>Email: {{Auth::user()->email}}</span>
                        <span style="color: red;">Credit: {{number_format(Auth::user()->credit)}}</span>
                        <span>Thành viên: 
                            @if (Auth::user()->vip)
                                <label for="" class="label label-danger">VIP</label>
                            @else
                                <label for="" class="label label-default">Free</label>
                                <button class="btn btn-success" id="upgrade-button">Nâng cấp VIP</button>
                            @endif
                        </span>
                        <a href="{{route('user.avatar')}}">
                            <button class="btn btn-primary">
                                Đổi avatar
                            </button>
                        </a>
                        <a href="{{route('user.pass')}}">
                            @if (empty(Auth::user()->password))
                                <button class="btn btn-warning">
                                    Đặt mật khẩu
                                </button>
                            @else
                                <button class="btn btn-danger">
                                    Đổi mật khẩu
                                </button>
                            @endif
                        </a>
                    </div>
                </div>
                <div class="list-film">
                    <h1 class="title">PHIM YÊU THÍCH</h1>
                    <div style="overflow-x: auto">
                        <table class="admin-table">
                            <tr>
                                <th>ID</th>
                                <th>Tên phim</th>
                                <th>Poster</th>
                                <th>Tuỳ chọn</th>
                            </tr>
                            @foreach ($like as $item)
                                <tr>
                                    <td>{{$item->film->id}}</td>
                                    <td style="text-align: left;">
                                        <a href="{{route('film', ['id' => $item->film->id, 'uri' => Help::beauty($item->film->name)])}}"
                                           title="{{$item->film->name}}">{{$item->film->name}}</a>
                                    </td>
                                    <td><img src="{{"/images/" .$item->film->poster}}" alt="" width="50px" height="50px"></td>
                                    <td>
                                        <button id="like-button" data-id="{{$item->film->id}}"
                                                class="btn btn-inline btn-primary">
                                            <i class="fa fa-heart" style="color: #f00"></i>
                                            <span>Bỏ thích</span>
                                        </button>
                                    </td>
                                </tr>
                            @endforeach
                            @if (sizeof($like) === 0)
                                <tr>
                                    <td colspan="4">Danh sách yêu thích đang trống, <a href="{{route('home')}}">Xem phim
                                            ngay</a>!
                                    </td>
                                </tr>
                            @endif
                        </table>
                    </div>
                    {{$like->links()}}
                </div>
                <div class="list-film">
                    <h1 class="title">PHIM ĐÃ ĐÁNH GIÁ</h1>
                    <div style="overflow-x: auto">
                        <table class="admin-table">
                            <tr>
                                <th>ID</th>
                                <th>Tên phim</th>
                                <th>Poster</th>
                                <th>Đánh giá</th>
                            </tr>
                            @foreach ($vote as $item)
                                <tr>
                                    <td>{{$item->film->id}}</td>
                                    <td style="text-align: left;">
                                        <a href="{{route('film', ['id' => $item->film->id, 'uri' => Help::beauty($item->film->name)])}}"
                                           title="{{$item->film->name}}">{{$item->film->name}}</a>
                                    </td>
                                    <td><img src="{{"/images/" .$item->film->poster}}" alt="" width="50px" height="50px"></td>
                                    <td>
                                        <span class="star-point">{{$item->point}}</span> <i class="fa fa-star"
                                                                                            style="color: #ED8A19"></i>
                                    </td>
                                </tr>
                            @endforeach
                            @if (sizeof($vote) === 0)
                                <tr>
                                    <td colspan="4">Danh sách đánh giá phim đang trống, <a href="{{route('home')}}">Xem
                                            phim ngay</a>!
                                    </td>
                                </tr>
                            @endif
                        </table>
                    </div>
                    {{$vote->links()}}
                </div>
            </div>
        </div>
    </div>
@endsection