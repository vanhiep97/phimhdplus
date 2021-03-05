@extends('master')
@section('content')
    <div class="container">
        <h1 class="title">ADMIN CPANEL</h1>
        <div class="row">
            <div class="col-md-3 col-sm-4">
                @include('admin.slide')
            </div>
            <div class="col-md-9 col-sm-8">
                <div class="list-film">
                    <h1 class="title">DANH SÁCH PHIM</h1>
                    <div style="overflow-x: auto">
                        <table class="admin-table">
                            <tr>
                                <th>ID</th>
                                <th>Tên phim</th>
                                <th>Poster</th>
                                <th>Tình trạng</th>
                                <th>Tuỳ chọn</th>
                            </tr>
                            @foreach ($film as $item)
                                <tr>
                                    <td>{{$item->id}}</td>
                                    <td style="text-align: left;">
                                        <a href="{{route('film', ['id' => $item->id, 'uri' => Help::beauty($item->name)])}}"
                                           title="{{$item->name}}">{{$item->name}}</a>
                                    </td>
                                    <td><img src="{{$item->poster}}" alt="" width="50px" height="50px"></td>
                                    <td>{{$item->disable ? 'Bị ẩn' : 'Đang hiển thị'}}</td>
                                    <td>
                                        <a href="{{route('admin.film.source', ['id' => $item->id])}}">
                                            <button class="btn btn-primary">Quản lý Source</button>
                                        </a>
                                        <a href="{{route('admin.film', ['action' => 'edit', 'id' => $item->id])}}">
                                            <button class="btn btn-success">Sửa</button>
                                        </a>
                                        <a id="delete-film" data-id="{{$item->id}}">
                                            <button class="btn btn-danger">Xoá</button>
                                        </a>
                                    </td>
                                </tr>
                            @endforeach
                            @if (sizeof($film) === 0)
                                <tr>
                                    <td colspan="4">Chưa có phim nào!</td>
                                </tr>
                            @endif
                        </table>
                    </div>
                    {{$film->links()}}
                </div>
                <div class="list-film">
                    <h1 class="title">THỐNG KÊ</h1>
                    <div class="film-detail">
                        <span>Tổng số phim: <b>{{sizeof(App\Film::all())}}</b></span>
                        <span>Đang hiển thị: <b>{{sizeof(App\Film::where('disable', 0)->get())}}</b></span>
                        <span>Đang bị ẩn: <b>{{sizeof(App\Film::where('disable', 1)->get())}}</b></span>
                        <span>Tổng số thành viên: <b>{{sizeof(App\User::all())}}</b></span>
                        <span>Thành viên VIP: <b>{{sizeof(App\User::where('vip', 1)->get())}}</b></span>
                        <span>Thành viên thường: <b>{{sizeof(App\User::where('vip', 0)->get())}}</b></span>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection