@extends('master')
@section('content')
    <div class="container">
        <div class="list-film">
            <h1 class="title">THÊM PHIM MỚI</h1>
            <form class="admin-form" enctype="multipart/form-data" id="add-film-form">
                <div id="result"></div>
                <div class="row">
                    <div class="col-md-4 col-sm-4">
                        <label for="">Tên phim:</label>
                        <input type="text" name="name">
                        <label for="">Diễn viên: (ngăn cách bởi dấu ",")</label>
                        <textarea name="actor"></textarea>
                        <label for="">Đạo diễn: (ngăn cách bởi dấu ",")</label>
                        <textarea name="director"></textarea>
                    </div>
                    <div class="col-md-4 col-sm-4">
                        <label for="">Mô tả ngắn:</label>
                        <textarea name="about"></textarea>
                        <label for="">Danh mục:</label>
                        <div class="multiSelect">
                            <span>Chọn danh mục...</span>
                            <ul class="dropSelect" id="category_parent">
                                @foreach ($categoryParent as $item)
                                    <li>
                                        <input type="radio" name="category_parent"
                                               value="{{$item->id}}"> {{$item->name}}
                                    </li>
                                @endforeach
                            </ul>
                        </div>
                        <label for="">Thể loại: (chọn nhiều)</label>
                        <div class="multiSelect">
                            <span>Chọn nhiều...</span>
                            <ul class="dropSelect" id="dropSelect">
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-4">
                        <label for="">Từ khoá: (ngăn cách bởi dấu ",")</label>
                        <textarea name="tags"></textarea>
                        <label for="">Số tập:</label>
                        <input type="text" name="episode" value="1">
                        <label for="">Poster:</label>
                        <input type="file" name="poster">
                        hoặc
                        <label for="">Url Poster:</label>
                        <input type="text" name="poster">
                        <br>
                        <input type="checkbox" name="is_slide"> Đặt làm Slide <br>
                        <input type="checkbox" name="disable"> Ẩn phim
                        <button class="button">Thêm phim mới</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
@endsection