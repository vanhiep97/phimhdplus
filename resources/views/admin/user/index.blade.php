@extends('master') @section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-3 col-sm-4">
                @include('admin.slide')
            </div>
            <div class="col-md-9 col-sm-8">
                <div class="list-film">
                    <h1 class="title">QUẢN LÝ NGƯỜI DÙNG</h1>
                    <div style="overflow-x: auto">
                        <table class="admin-table">
                            <tr>
                                <th>ID</th>
                                <th>Email</th>
                                <th>Ngày đăng ký</th>
                                <th>Thành viên</th>
                                <th>Tuỳ chọn</th>
                            </tr>
                            @foreach ($user as $item)
                                @if (Auth::id() === $item->id)
                                    @continue
                                @endif
                                <tr>
                                    <td>{{$item->id}}</td>
                                    <td>{{$item->email}}</td>
                                    <td>{{date("H:i d/m/Y", strtotime($item->created_at))}}</td>
                                    <td>{{$item->vip ? 'VIP' : 'Free'}}</td>
                                    <td>
                                        @if ($item->right === 0)
                                            <a id="upgrade-user" data-id="{{$item->id}}">
                                                <button class="btn btn-success">Nâng quyền</button>
                                            </a>
                                        @endif
                                        @if ($item->right === 1)
                                            <a id="upgrade-user" data-id="{{$item->id}}">
                                                <button class="btn btn-danger">Hạ quyền</button>
                                            </a>
                                        @endif
                                        <a id="block-user" data-id="{{$item->id}}">
                                            <button class="btn btn-danger">
                                                {{$item->right === -1 ? 'Mở khoá' : 'Khoá'}}
                                            </button>
                                        </a>
                                        </a>
                                        @if ($item->right !== 1)
                                            <a id="delete-user" data-id="{{$item->id}}">
                                                <button class="btn btn-danger">Xoá</button>
                                            </a>
                                        @endif
                                    </td>
                                </tr>
                            @endforeach @if (sizeof($user) === 0)
                                <tr>
                                    <td colspan="5">Chưa có người dùng nào!</td>
                                </tr>
                            @endif
                        </table>
                    </div>
                    {{$user->links()}}
                </div>
            </div>
        </div>
    </div>
@endsection