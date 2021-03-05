<?php

namespace App\Http\Controllers;

use App\Film;
use App\User;
use Auth;
use Hash;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    protected $app_id;
    protected $app_secret;
    protected $scope;
    protected $redirectUri;

    public function __construct()
    {
        $this->app_id = '1830570347236325';
        $this->app_secret = 'ce42ff94e670a5bdec74a50aeebec1c5';
        $this->scope = 'email,public_profile';
        $this->redirectUri = route('login.facebook.done');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $filmBo = Film::where([['type', 2], ['disable', 0]])->orderBy('id', 'DESC')->limit(24)->get();
        $filmLe = Film::where([['type', 1], ['disable', 0]])->orderBy('id', 'DESC')->limit(24)->get();
        $filmNew = Film::where('disable', 0)->orderBy('id', 'DESC')->limit(24)->get();
        $filmMostView = Film::where('disable', 0)->orderBy('view', 'DESC')->limit(24)->get();
        return view('home.index', [
            'filmBo' => $filmBo,
            'filmLe' => $filmLe,
            'filmNew' => $filmNew,
            'filmMostView' => $filmMostView
        ]);
    }

    public function phimBo()
    {
        $filmBo = Film::where([['type', 2], ['disable', 0]])->orderBy('id', 'DESC')->paginate(24);
        return view('home.phimbo', [
            'filmBo' => $filmBo
        ]);
    }

    public function phimLe()
    {
        $filmLe = Film::where([['type', 1], ['disable', 0]])->orderBy('id', 'DESC')->paginate(24);
        return view('home.phimle', [
            'filmLe' => $filmLe
        ]);
    }

    public function phimMoi()
    {
        $filmMoi = Film::where('disable', 0)->orderBy('id', 'DESC')->paginate(24);
        return view('home.phimmoi', [
            'filmMoi' => $filmMoi
        ]);
    }

    public function register(Request $request)
    {
        if ($request->method() === "POST") {
            $user = User::where('email', $request->email)->first();
            if (is_null($request->email)) {
                return response()->json(['message' => 'Vui lòng nhập email!'], 422);
            } elseif (!preg_match('/^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9_.+-].[a-zA-Z0-9_.+-]/', $request->email)) {
                return response()->json(['message' => 'Vui lòng nhập email hợp lệ!'], 422);
            } elseif (is_null($request->password)) {
                return response()->json(['message' => 'Vui lòng nhập mật khẩu!'], 422);
            } elseif (strlen($request->password) < 6) {
                return response()->json(['message' => 'Mật khẩu phải ít nhất 6 kí tự trở lên!'], 422);
            } elseif (strpos($request->password, $request->confirm_password) === false) {
                return response()->json(['message' => 'Hai mật khẩu không giống nhau!'], 422);
            } elseif (is_null($user)) {
                $user = User::create([
                    'email' => $request->email,
                    'password' => bcrypt($request->password),
                    'avatar' => asset('css/icons/default.png')
                ]);
                if ($user) {
                    Auth::login($user, true);
                    return response()->json([
                        'message' => 'Tạo tài khoản thành công, hệ thống đang tự động đăng nhập, vui lòng đợi trong giây lát!',
                        'redirectUrl' => $request->redirectUrl ?? route('home')
                    ]);
                } else {
                    return response()->json(['message' => 'Có lỗi xảy ra, không thể tạo tài khoản, vui lòng thử lại sau!'], 422);
                }
            } else {
                return response()->json(['message' => 'Email này đã có người đăng ký!'], 422);
            }
        }
        return view('home.register');
    }

    public function login(Request $request)
    {
        if ($request->method() === "POST") {
            if (is_null($request->email)) {
                return response()->json(['message' => 'Vui lòng nhập địa chỉ email!'], 422);
            }
            $user = User::where('email', $request->email)->first();
            if (is_null($user)) {
                return response()->json(['message' => 'Email này không tồn tại!'], 422);
            } else {
                if (Hash::check($request->password, $user->password)) {
                    if ($user->right === -1) {
                        return response()->json(['message' => 'Tài khoản này hiện đang bị khoá, vui lòng liên hệ hỗ trợ để giải quyết!'], 422);
                    }
                    Auth::login($user, true);
                    return response()->json([
                        'message' => 'Đăng nhập thành công, hệ thống đang tự động chuyển hướng, vui lòng đợi trong giây lát!',
                        'redirectUrl' => $request->redirectUrl ?? route('home')
                    ]);
                } else {
                    return response()->json(['message' => 'Mật khẩu không chính xác!'], 422);
                }
            }
        }
        return view('home.login');
    }

    public function loginFacebook()
    {
        return redirect("https://www.facebook.com/v2.11/dialog/oauth?client_id=$this->app_id&redirect_uri=$this->redirectUri&scope=$this->scope");
    }

    public function loginFacebookDone(Request $request)
    {
        if ($data = file_get_contents("https://graph.facebook.com/v2.11/oauth/access_token?client_id=$this->app_id&client_secret=$this->app_secret&code=$request->code&redirect_uri=$this->redirectUri")) {
            $data = json_decode($data);
            $access_token = $data->access_token;
            if ($data = file_get_contents("https://graph.facebook.com/me/?access_token=$access_token&fields=id,email,name")) {
                $data = json_decode($data);
                $user = User::where('email', $data->email ?? $data->id)->get()->first();
                if (is_null($user)) {
                    $user = User::create([
                        'email' => $data->email,
                        'avatar' => asset('css/icons/default.png')
                    ]);
                    Auth::login($user, true);
                    return redirect()->route('home');
                } else {
                    if ($user->right === -1) {
                        return redirect()->route('home');
                    } else {
                        Auth::login($user, true);
                        return redirect()->route('home');
                    }
                }
            }
            return redirect()->route('app.login');
        }
        return redirect()->route('app.login');
    }
}
