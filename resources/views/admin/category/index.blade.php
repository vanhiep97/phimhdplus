@extends('master') @section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-3 col-sm-4">
                @include('admin.slide')
            </div>
            <div class="col-md-9 col-sm-8">
                <div class="list-film">
                    <h1 class="title">QUẢN LÝ THỂ LOẠI</h1>
                    <div style="overflow-x: auto;">
                        <table class="admin-table">
                            <tr>
                                <th>ID</th>
                                <th>Tên thể loại</th>
                                <th>Loại phim</th>
                                <th>Tuỳ chọn</th>
                            </tr>
                            @foreach ($category as $item)
                                <tr class="parent">
                                    <td>{{$item->id}}</td>
                                    <td>{{$item->name}}</td>
                                    <td>{{$item->type === 2 ? 'Nhiều tập' : 'Một tập'}}</td>
                                    <td>
                                        <a href="{{route('admin.category', ['action' => 'edit', 'id' => $item->id])}}">
                                            <button class="btn btn-success">Sửa</button>
                                        </a>
                                        <a id="delete-category" data-id="{{$item->id}}">
                                            <button class="btn btn-danger">Xoá</button>
                                        </a>
                                    </td>
                                </tr>
                                @foreach ($item->child as $item)
                                    <tr>
                                        <td></td>
                                        <td>{{$item->parent->name}} - {{$item->name}}</td>
                                        <td>{{$item->type === 1 ? 'Nhiều tập' : 'Một tập'}}</td>
                                        <td>
                                            <a href="{{route('admin.category', ['action' => 'edit', 'id' => $item->id])}}">
                                                <button class="btn btn-success">Sửa</button>
                                            </a>
                                            <a id="delete-category" data-id="{{$item->id}}">
                                                <button class="btn btn-danger">Xoá</button>
                                            </a>
                                        </td>
                                    </tr>
                                @endforeach
                            @endforeach @if (sizeof($category) === 0)
                                <tr>
                                    <td colspan="4">Chưa có thể loại nào!</td>
                                </tr>
                            @endif
                        </table>
                    </div>
                    {{$category->links()}}
                    <a href="{{route('admin.category', ['action' => 'add'])}}">
                        <button class="btn btn-success">Thêm thể loại mới</button>
                    </a>
                </div>
            </div>
        </div>
    </div>
@endsection