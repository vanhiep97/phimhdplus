@extends('master') @section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-3 col-sm-4">
                @include('admin.slide')
            </div>
            <div class="col-md-9 col-sm-8">
                <div class="list-film">
                    <h1 class="title">QUẢN LÝ PHIM</h1>
                    <div style="overflow-x: auto">
                        <table class="admin-table">
                            <tr>
                                <th>ID</th>
                                <th>Tên phim</th>
                                <th>Poster</th>
                                <th>Tuỳ chọn</th>
                            </tr>
                            @foreach ($film as $item)
                                <tr>
                                    <td>{{$item->id}}</td>
                                    <td style="text-align: left;">
                                        <a href="{{route('film', ['id' => $item->id, 'uri' => Help::beauty($item->name)])}}"
                                           title="{{$item->name}}">{{$item->name}}</a>
                                    </td>
                                    <td>
                                        <img src="{{$item->poster}}" alt="" width="50px" height="50px">
                                    </td>
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
                            @endforeach @if (sizeof($film) === 0)
                                <tr>
                                    <td colspan="4">Chưa có phim nào!</td>
                                </tr>
                            @endif
                        </table>
                    </div>
                    {{$film->links()}}
                    <a href="{{route('admin.film', ['action' => 'add'])}}">
                        <button class="btn btn-success">Thêm phim mới</button>
                    </a>
                </div>
            </div>
        </div>
    </div>
@endsection