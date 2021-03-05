<?php

namespace App\Http\Controllers;

use App\Setting;
use Auth;
use Hash;
use Illuminate\Http\Request;

class UserController extends Controller
{
    //
    public function index()
    {
        $vote = Auth::user()->vote()->paginate(10);
        $like = Auth::user()->like()->paginate(10);
        return view('user.index', ['vote' => $vote, 'like' => $like]);
    }

    public function changePassword(Request $request)
    {
        if ($request->method() === "POST") {
            if (!empty(Auth::user()->password)) {
                if (!Hash::check($request->old_password, Auth::user()->password)) {
                    return response()->json(['message' => 'Mật khẩu cũ bạn vừa nhập không đúng!'], 422);
                }
            }
            if (is_null($request->new_password)) {
                return response()->json(['message' => 'Vui lòng nhập mật khẩu mới!'], 422);
            }
            if ($request->new_password !== $request->re_password) {
                return response()->json(['message' => 'Hai mật khẩu không giống nhau!'], 422);
            }
            if (strlen($request->new_password) < 6) {
                return response()->json(['message' => 'Mật khẩu phải ít nhất 6 kí tự trở lên!'], 422);
            }
            Auth::user()->password = bcrypt($request->new_password);
            Auth::user()->save();
            return response()->json(['message' => empty($request->old_password) ? 'Đặt mật khẩu mới thành công!' : 'Đổi mật khẩu thành công!']);
        }
        return view('user.change_password');
    }

    public function changeAvatar(Request $request)
    {
        if ($request->method() === "POST") {
            if ($request->hasFile('avatar')) {
                $fileName = md5(time()) . $request->avatar->getClientOriginalExtension();
                if ($request->avatar->move(public_path('upload/users/avatar'), $fileName)) {
                    Auth::user()->avatar = url('upload/users/avatar/' . $fileName);
                    Auth::user()->save();
                    return response()->json(['message' => 'Avatar mới đã được tải lên thành công!']);
                } else {
                    return response()->json(['message' => 'Có lỗi xảy ra, vui lòng thử lại sau!'], 422);
                }
            } else {
                return response()->json(['message' => 'Vui lòng chọn file để tải lên!'], 422);
            }
        }
        return view('user.change_avatar');
    }

    public function upgrade(Request $request)
    {
        if ($request->method() === "POST") {
            if (Auth::user()->credit < Setting::find(1)->vip) {
                $html = '<div class="alert alert-danger">Credit cuả bạn không đủ. Vui lòng <a>nạp thêm</a> !</div>';
                return view('dialog', ['html' => $html]);
            } else {
                Auth::user()->credit -= Setting::find(1)->vip;
                Auth::user()->vip = 1;
                Auth::user()->save();
                $html = '<div class="alert alert-success">Nâng cấp VIP thành công. 
                Tài khoản có thể sử dụng mọi tính năng của tài khoản VIP</div>';
                return view('dialog', ['html' => $html]);
            }
        }
        return view('user.upgrade');
    }

    public function recharge(Request $request)
    {
        if ($request->method() === "POST") {
            if (empty($request->type_card)) {
                return response()->json(['message' => 'Vui lòng chọn loại thẻ nạp!'], 422);
            }
            if (empty($request->pin)) {
                return response()->json(['message' => 'Vui lòng nhập mã PIN in sau thẻ cào!'], 422);
            }
            if (empty($request->seri)) {
                return response()->json(['message' => 'Vui lòng nhập số seri!'], 422);
            }
            return response()->json(['message' => 'Telco đang bảo trì kênh nạp, vui lòng thử lại sau!'], 422);
        }
        return view('user.recharge');
    }

    public function upgradeAjax(Request $request)
    {
        $html = '<div class="alert alert-success">Nâng cấp tài khoản VIP. Chỉ với ';
        $html .= '<span style="color:red; font-weight: bold;">' . Setting::find(1)->vip . ' Credit</span> tài khoản của bạn sẽ được 
        sử dụng toàn bộ ưu đãi của tài khoản VIP.</div>';
        $html .= '<button class="button" id="confirm-upgrade">NÂNG CẤP NGAY</button>';
        return view('dialog', ['html' => $html]);
    }
}
