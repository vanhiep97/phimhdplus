@extends('master') @section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-3 col-sm-4 hidden-xs"></div>
            <div class="col-md-6 col-sm-4">
                <div class="list-film">
                    <h1 class="title">THÊM THỂ LOẠI</h1>
                    <form class="admin-form" enctype="multipart/form-data" id="add-category-form">
                        <div id="result"></div>
                        <label for="">Tên thể loại</label>
                        <input type="text" name="name">
                        <label for="">Loại danh mục: </label>
                        <div class="multiSelect">
                            <span>Chọn một...</span>
                            <ul class="dropSelect" id="dropSelect">
                                <li>
                                    <input type="radio" name="parent_id" value="0"> Thể loại cha
                                </li>
                                <li>Danh mục con</li>
                                @foreach (App\Category::where('parent_id', 0)->get() as $item)
                                    <li>
                                        <input type="radio" name="parent_id" value="{{$item->id}}"> {{$item->name}}
                                    </li>
                                @endforeach
                            </ul>
                        </div>
                        <label for="">Loại phim:</label>
                        <div class="multiSelect">
                            <span>Chọn một...</span>
                            <ul class="dropSelect" id="dropSelect">
                                <li>
                                    <input type="radio" name="type" value="2"> Phim nhiều tập
                                </li>
                                <li>
                                    <input type="radio" name="type" id="1"> Phim một tập
                                </li>
                            </ul>
                        </div>
                        <button class="button">THÊM THỂ LOẠI</button>
                </div>
                </form>
            </div>
        </div>
        <div class="col-md-3 col-sm-4 hidden-xs"></div>
    </div>
    </div>
@endsection