@extends('master')
@section('content')
    <div class="container">
        <div class="list-film">
            <h1 class="title">SỬA PHIM - {{$film->name}}</h1>
            <form class="admin-form" enctype="multipart/form-data" id="edit-film-form">
                <input type="hidden" name="id" value="{{$film->id}}">
                <div id="result"></div>
                <div class="row">
                    <div class="col-md-4 col-sm-4">
                        <label for="">Tên phim:</label>
                        <input type="text" name="name" value="{{$film->name}}">
                        <label for="">Diễn viên: (ngăn cách bởi dấu ",")</label>
                        <textarea name="actor">{{$film->actor}}</textarea>
                        <label for="">Đạo diễn: (ngăn cách bởi dấu ",")</label>
                        <textarea name="director">{{$film->director}}</textarea>
                    </div>
                    <div class="col-md-4 col-sm-4">
                        <label for="">Mô tả ngắn:</label>
                        <textarea name="about">{{$film->about}}</textarea>
                        <label for="">Danh mục: {{sizeof($parent) === 0 ? '(Phim này chưa có danh mục)':''}}</label>
                        <div class="multiSelect">
                            <span>Chọn danh mục...</span>
                            <ul class="dropSelect" id="category_parent">
                                @foreach ($categoryParent as $item)
                                    <li>
                                        <input type="radio" name="category_parent"
                                               value="{{$item->id}}" {{sizeof($parent) > 0 && $item->id == $parent->id ? "checked" : ""}}> {{$item->name}}
                                    </li>
                                @endforeach
                            </ul>
                        </div>
                        <label for="">Thể loại: (chọn nhiều)</label>
                        <div class="multiSelect">
                            <span>Chọn nhiều...</span>
                            <ul class="dropSelect" id="dropSelect">
                                @if (sizeof($parent) > 0)
                                    @foreach ($parent->child as $item)
                                        <li>
                                            <input type="checkbox" name="category[]"
                                                   value="{{$item->id}}" {{in_array($item->id, $categories) ? "checked" : ""}}> {{$item->name}}
                                        </li>
                                    @endforeach
                                @endif
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-4">
                        <label for="">Từ khoá: (ngăn cách bởi dấu ",")</label>
                        <textarea name="tags">{{$film->tags}}</textarea>
                        <label for="">Số tập:</label>
                        <input type="text" name="episode" value="{{$film->episode}}">
                        <label for="">Poster:</label>
                        <input type="file" name="poster">
                        <label for="">Poster cũ:</label>
                        <div class="old-poster">
                            <img src="{{$film->poster}}" alt="">
                        </div>
                        <br>
                        <input type="checkbox" name="is_slide" {{$film->is_slide ? "checked" : ""}}> Đặt làm Slide <br>
                        <input type="checkbox" name="disable" {{$film->disable ? "checked" : ""}}> Ẩn phim
                        <button class="button">Sửa Phim</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
@endsection