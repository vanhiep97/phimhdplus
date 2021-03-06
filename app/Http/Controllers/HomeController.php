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
                return response()->json(['message' => 'Vui l??ng nh???p email!'], 422);
            } elseif (!preg_match('/^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9_.+-].[a-zA-Z0-9_.+-]/', $request->email)) {
                return response()->json(['message' => 'Vui l??ng nh???p email h???p l???!'], 422);
            } elseif (is_null($request->password)) {
                return response()->json(['message' => 'Vui l??ng nh???p m???t kh???u!'], 422);
            } elseif (strlen($request->password) < 6) {
                return response()->json(['message' => 'M???t kh???u ph???i ??t nh???t 6 k?? t??? tr??? l??n!'], 422);
            } elseif (strpos($request->password, $request->confirm_password) === false) {
                return response()->json(['message' => 'Hai m???t kh???u kh??ng gi???ng nhau!'], 422);
            } elseif (is_null($user)) {
                $user = User::create([
                    'email' => $request->email,
                    'password' => bcrypt($request->password),
                    'avatar' => asset('css/icons/default.png')
                ]);
                if ($user) {
                    Auth::login($user, true);
                    return response()->json([
                        'message' => 'T???o t??i kho???n th??nh c??ng, h??? th???ng ??ang t??? ?????ng ????ng nh???p, vui l??ng ?????i trong gi??y l??t!',
                        'redirectUrl' => $request->redirectUrl ?? route('home')
                    ]);
                } else {
                    return response()->json(['message' => 'C?? l???i x???y ra, kh??ng th??? t???o t??i kho???n, vui l??ng th??? l???i sau!'], 422);
                }
            } else {
                return response()->json(['message' => 'Email n??y ???? c?? ng?????i ????ng k??!'], 422);
            }
        }
        return view('home.register');
    }

    public function login(Request $request)
    {
        if ($request->method() === "POST") {
            if (is_null($request->email)) {
                return response()->json(['message' => 'Vui l??ng nh???p ?????a ch??? email!'], 422);
            }
            $user = User::where('email', $request->email)->first();
            if (is_null($user)) {
                return response()->json(['message' => 'Email n??y kh??ng t???n t???i!'], 422);
            } else {
                if (Hash::check($request->password, $user->password)) {
                    if ($user->right === -1) {
                        return response()->json(['message' => 'T??i kho???n n??y hi???n ??ang b??? kho??, vui l??ng li??n h??? h??? tr??? ????? gi???i quy???t!'], 422);
                    }
                    Auth::login($user, true);
                    return response()->json([
                        'message' => '????ng nh???p th??nh c??ng, h??? th???ng ??ang t??? ?????ng chuy???n h?????ng, vui l??ng ?????i trong gi??y l??t!',
                        'redirectUrl' => $request->redirectUrl ?? route('home')
                    ]);
                } else {
                    return response()->json(['message' => 'M???t kh???u kh??ng ch??nh x??c!'], 422);
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
