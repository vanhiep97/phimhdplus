<?php

namespace App\Http\Controllers;

use App\Category;
use App\Film;
use App\FilmDetail;
use App\Like;
use App\User;
use App\Vote;
use Illuminate\Http\Request;

class AdminController extends Controller
{
    //
    public function index()
    {
        $film = Film::orderBy('id', 'desc')->paginate(10);
        return view('admin.index', ['film' => $film]);
    }

    public function film(Request $request, $action = null)
    {
        switch ($action) {
            case 'add':
                if ($request->method() === "POST") {
                    if (empty($request->name) || empty($request->about) || empty($request->actor) || empty($request->director) || empty($request->episode) || empty($request->category_parent)) {
                        return response()->json(['message' => 'Xin vui lòng nhập đầy đủ thông tin phim'], 422);
                    } else {
                        $categoryParent = Category::findOrFail($request->category_parent);
                        $film = new Film;
                        $film->name = $request->name;
                        $film->actor = $request->actor;
                        $film->director = $request->director;
                        $film->about = $request->about;
                        if ($categoryParent->type === 1 && $request->episode > 1) {
                            return response()->json(['message' => 'Phim lẻ không được nhiều hơn 1 tập'], 422);
                        }
                        $film->episode = $request->episode;
                        $film->type = $categoryParent->type;
                        $film->is_slide = $request->is_slide == "on" ? 1 : 0;
                        $film->disable = $request->disable == "on" ? 1 : 0;
                        $film->tags = $request->tags;
                        $category = $request->category ?? [];
                        array_unshift($category, $categoryParent->id);
                        $film->category = json_encode($category);
                        if ($request->hasFile('poster')) {
                            $posterName = md5(time()) . $request->poster->getClientOriginalExtension();
                            if ($request->poster->move(public_path('upload/posters'), $posterName)) {
                                $film->poster = url('upload/posters/' . $posterName);
                            } else {
                                return response()->json(['message' => 'Có lỗi xảy ra, vui lòng thử lại sau giây lát'], 422);
                            }
                        } else {
                            if (empty($request->poster)) {
                                return response()->json(['message' => 'Vui lòng điền poster phim'], 422);
                            }
                            $film->poster = $request->poster;
                            $film->save();
                            return response()->json(['message' => 'Thêm phim <b>' . $film->name . '</b> thành công. Tải lại trang để có hiệu lực!. Click <a href="' . route('admin.film.source', ['id' => $film->id]) . '">vào đây</a> để quản lý resource phim']);
                        }

                    }
                } else {
                    $categoryParent = Category::where('parent_id', 0)->get();
                    return view('admin.film.add', ['categoryParent' => $categoryParent]);
                }
                break;
            case 'edit':
                $film = Film::findOrFail($request->id);
                if ($request->method() === "POST") {
                    if (empty($request->name) || empty($request->about) || empty($request->actor) || empty($request->director) || empty($request->episode) || empty($request->category_parent)) {
                        return response()->json(['message' => 'Xin vui lòng nhập đầy đủ thông tin phim'], 422);
                    } else {
                        $categoryParent = Category::findOrFail($request->category_parent);
                        $film->name = $request->name;
                        $film->actor = $request->actor;
                        $film->director = $request->director;
                        $film->about = $request->about;
                        if ($categoryParent->type === 1 && $request->episode > 1) {
                            return response()->json(['message' => 'Phim lẻ không được nhiều hơn 1 tập'], 422);
                        }
                        $film->episode = $request->episode;
                        $film->type = $categoryParent->type;
                        $film->is_slide = $request->is_slide == "on" ? 1 : 0;
                        $film->disable = $request->disable == "on" ? 1 : 0;
                        $film->tags = $request->tags;
                        $category = $request->category ?? [];
                        array_unshift($category, $categoryParent->id);
                        $film->category = json_encode($category);
                        if ($request->hasFile('poster')) {
                            $posterName = md5(time()) . $request->poster->getClientOriginalExtension();
                            if ($request->poster->move(public_path('upload/posters'), $posterName)) {
                                $film->poster = url('upload/posters/' . $posterName);
                            }
                        }
                        if ($film->save()) {
                            return response()->json(['message' => 'Sửa phim <b>' . $film->name . '</b> thành công. Tải lại trang để có hiệu lực!. Click <a href="' . route('admin.film.source', ['id' => $film->id]) . '">vào đây</a> để quản lý resource phim']);
                        } else {
                            return response()->json(['message' => 'Có lỗi xảy ra, vui lòng thử lại sau giây lát'], 422);
                        }
                    }
                } else {
                    $categoryParent = Category::where('parent_id', 0)->get();
                    $categories = json_decode($film->category, true);
                    $parent = Category::find(array_shift($categories));
                    return view('admin.film.edit', ['categoryParent' => $categoryParent, 'film' => $film, 'categories' => $categories, 'parent' => $parent]);
                }
                break;
            case 'delete':
                $film = Film::findOrFail($request->id);
                if (sizeof($film->filmDetail) > 0) {
                    $html = "<center><div class='alert alert-danger'>Rescource phim đang tồn tại!  Vui lòng xoá resource của phim <b>$film->name</b> trước khi xoá phim này.</div></center>";
                    return view('dialog', ['html' => $html]);
                }
                if ($request->method() === "POST") {
                    Vote::where('film_id', $request->id)->delete();
                    Like::where('film_id', $request->id)->delete();
                    $film->delete();
                    $html = "<center><div class='alert alert-success'>
                    Đã xoá phim <b>$film->name</b> thành công. Tải lại trang để có hiệu lực!
                    </div>
                    </center>";
                    return view('dialog', ['html' => $html]);
                } else {
                    $html = "<center><div class='alert alert-warning'>
                    Xác nhận xoá phim <b>$film->name</b>
                    </div>
                    <button class='btn btn-warning' id='confirm-delete-film' data-id='$film->id'>Xác nhận</button>
                    </center>";
                    return view('dialog', ['html' => $html]);
                }
                break;
            case 'category':
                $category = Category::findOrFail($request->id);
                return $category->child;
                break;
            default:
                $film = Film::orderBy('id', 'desc')->paginate(20);
                return view('admin.film.index', ['film' => $film]);
        }
    }

    public function filmSource(Request $request, $id, $action = null, $filmDetail = null)
    {
        switch ($action) {
            case 'add':
                $film = Film::findOrFail($id);
                if (sizeof($film->filmDetail) >= $film->episode) {
                    return response()->json(['message' => 'Phim chỉ có ' . sizeof($film->filmDetail) . ' tập, không thể thêm resource'], 422);
                }
                if ($request->method() === "POST") {
                    if (empty($request->name) || empty($request->m18) || empty($request->m22) || empty($request->m36) || empty($request->m18_vip) || empty($request->m22_vip) || empty($request->m36_vip)) {
                        return response()->json(['message' => 'Xin vui lòng nhập đầy đủ thông tin resource phim'], 422);
                    } else {
                        $filmDetail = new FilmDetail;
                        $filmDetail->name = $request->name;
                        $filmDetail->film_id = $id;
                        $filmDetail->source1 = $request->m18;
                        $filmDetail->source2 = $request->m22;
                        $filmDetail->source3 = $request->m36;
                        $filmDetail->source_vip1 = $request->m18_vip;
                        $filmDetail->source_vip2 = $request->m22_vip;
                        $filmDetail->source_vip3 = $request->m36_vip;
                        if ($filmDetail->save()) {
                            return response()->json(['message' => 'Thêm resource phim thành công. Tải lại trang để có hiệu lực!!']);
                        } else {
                            return response()->json(['message' => 'Có lỗi xảy ra, xin vui lòng thử lại sau giây lát!'], 422);
                        }
                    }
                } else {
                    return view('admin.film.source.add', ['film' => $film]);
                }
                break;
            case 'edit':
                $filmDetail = FilmDetail::findOrFail($filmDetail);
                if ($request->method() === "POST") {
                    if (empty($request->name) || empty($request->m18) || empty($request->m22) || empty($request->m36) || empty($request->m18_vip) || empty($request->m22_vip) || empty($request->m36_vip)) {
                        return response()->json(['message' => 'Xin vui lòng nhập đầy đủ thông tin resource phim'], 422);
                    } else {
                        $filmDetail->name = $request->name;
                        $filmDetail->film_id = $id;
                        $filmDetail->source1 = $request->m18;
                        $filmDetail->source2 = $request->m22;
                        $filmDetail->source3 = $request->m36;
                        $filmDetail->source_vip1 = $request->m18_vip;
                        $filmDetail->source_vip2 = $request->m22_vip;
                        $filmDetail->source_vip3 = $request->m36_vip;
                        if ($filmDetail->save()) {
                            return response()->json(['message' => 'Sửa resource phim thành công. Tải lại trang để có hiệu lực!!']);
                        } else {
                            return response()->json(['message' => 'Có lỗi xảy ra, xin vui lòng thử lại sau giây lát!'], 422);
                        }
                    }
                } else {
                    return view('admin.film.source.edit', ['filmDetail' => $filmDetail]);
                }
                break;
            case 'delete':
                $filmDetail = FilmDetail::findOrFail($filmDetail);
                if ($request->method() === "POST") {
                    if ($filmDetail->delete()) {
                        $html = "<center><div class='alert alert-success'>
                        Đã xoá resource <b>$filmDetail->name</b> thành công. Tải lại trang để có hiệu lực!
                        </div>
                        </center>";
                        return view('dialog', ['html' => $html]);
                    } else {
                        $html = "<center><div class='alert alert-danger'>
                        Lỗi khi xoá phim <b>$filmDetail->name</b>, vui lòng thử lại
                        </div>
                        </center>";
                        return view('dialog', ['html' => $html]);
                    }
                } else {
                    $html = "<center><div class='alert alert-warning'>
                    Xác nhận xoá resource <b>$filmDetail->name</b>
                    </div>
                    <button class='btn btn-warning' id='confirm-delete-resource' data-id='$filmDetail->id'>Xác nhận</button>
                    </center>";
                    return view('dialog', ['html' => $html]);
                }
                break;
            default:
                $film = Film::findOrFail($id);
                return view('admin.film.source.index', ['film' => $film, 'filmDetail' => $film->filmDetail()->paginate(20)]);
        }
    }

    public function category(Request $request, $action = null)
    {
        switch ($action) {
            case 'add':
                if ($request->method() === "POST") {
                    if (empty($request->name) || empty($request->parent_id) && empty($request->type)) {
                        return response()->json(['message' => 'Xin vui lòng nhập đầy đủ thông tin thể loại'], 422);
                    } else {
                        $category = new Category;
                        $category->name = $request->name;
                        $category->parent_id = $request->parent_id ?? 0;
                        if (!empty($request->parent_id)) {
                            $category->type = Category::find($request->parent_id)->type;
                        } else {
                            $category->type = $request->type === 'on' ? 1 : 2;
                        }
                        if ($category->save()) {
                            return response()->json(['message' => 'Thêm thể loại <b>' . $category->name . '</b> thành công. Tải lại trang để có hiệu lực!!']);
                        } else {
                            return response()->json(['message' => 'Có lỗi xảy ra, xin vui lòng thử lại sau giây lát!'], 422);
                        }
                    }
                } else {
                    return view('admin.category.add');
                }
                break;
            case 'edit':
                $category = Category::findOrFail($request->id);
                if ($request->method() === "POST") {
                    if (empty($request->name) || empty($request->parent_id) && empty($request->type)) {
                        return response()->json(['message' => 'Xin vui lòng nhập đầy đủ thông tin thể loại'], 422);
                    } else {
                        $category->name = $request->name;
                        $category->parent_id = $request->parent_id ?? 0;
                        if (!empty($request->parent_id)) {
                            $category->type = Category::find($request->parent_id)->type;
                        } else {
                            $category->type = $request->type === 1 ? 1 : $request->type;
                        }
                        if ($category->save()) {
                            return response()->json(['message' => 'Sửa thể loại <b>' . $category->name . '</b> thành công. Tải lại trang để có hiệu lực!!']);
                        } else {
                            return response()->json(['message' => 'Có lỗi xảy ra, xin vui lòng thử lại sau giây lát!'], 422);
                        }
                    }
                } else {
                    return view('admin.category.edit', ['category' => $category]);
                }
                break;
            case 'delete':
                $category = Category::findOrFail($request->id);
                if (sizeof($category->child) > 0) {
                    $html = "<center><div class='alert alert-danger'>Thể loại này đang chứ thể loại con, vui lòng xoá thể loại con trước khi xoá thể loại này.</div></center>";
                    return view('dialog', ['html' => $html]);
                }
                if ($request->method() === "POST") {
                    $film = Film::where('category', 'like', '%' . $category->id . '%')->get();
                    foreach ($film as $item) {
                        $cat = json_decode($item->category, true);
                        unset($cat[array_search($category->id, $cat)]);
                        $item->disable = sizeof($cat) === 0 ? 1 : 0;
                        $item->category = json_encode($cat);
                        $item->save();
                    }
                    if ($category->delete()) {
                        $html = "<center><div class='alert alert-success'>
                        Đã xoá phim <b>$category->name</b> thành công. Tải lại trang để có hiệu lực!
                        </div>
                        </center>";
                        return view('dialog', ['html' => $html]);
                    } else {
                        $html = "<center><div class='alert alert-danger'>
                        Lỗi khi xoá thể loại <b>$category->name</b>, vui lòng thử lại
                        </div>
                        </center>";
                        return view('dialog', ['html' => $html]);
                    }
                } else {
                    $html = "<center><div class='alert alert-warning'>
                    Xác nhận xoá thể loại <b>$category->name</b>
                    </div>
                    <button class='btn btn-warning' id='confirm-delete-category' data-id='$category->id'>Xác nhận</button>
                    </center>";
                    return view('dialog', ['html' => $html]);
                }
                break;
            default:
                $category = Category::where('parent_id', 0)->paginate(10);
                return view('admin.category.index', ['category' => $category]);
        }
    }

    public function user(Request $request, $action = null)
    {
        switch ($action) {
            case 'delete':
                $user = User::findOrFail($request->id);
                if ($request->method() === "POST") {
                    if ($user->right) {
                        $html = "<center><div class='alert alert-danger'>
                        Thành viên <b>$user->email</b> đang có quyền Quản Trị Viên, vui lòng thử lại
                        </div>
                        </center>";
                        return view('dialog', ['html' => $html]);
                    }
                    if ($user->delete()) {
                        $html = "<center><div class='alert alert-success'>
                        Đã xoá thành viên <b>$user->email</b> thành công. Tải lại trang để có hiệu lực!
                        </div>
                        </center>";
                        return view('dialog', ['html' => $html]);
                    } else {
                        $html = "<center><div class='alert alert-danger'>
                        Lỗi khi xoá thành viên <b>$user->email</b>, vui lòng thử lại
                        </div>
                        </center>";
                        return view('dialog', ['html' => $html]);
                    }
                }
                $html = "<center><div class='alert alert-warning'>
                Xác nhận xoá thành viên <b>$user->email</b>
                </div>
                <button class='btn btn-warning' id='confirm-delete-user' data-id='$user->id'>Xác nhận</button>
                </center>";
                return view('dialog', ['html' => $html]);
                break;
            case 'block':
                $user = User::findOrFail($request->id);
                if ($request->method() === "POST") {
                    if ($user->right === -1) {
                        $user->right = 0;
                    } else {
                        $user->right = -1;
                    }
                    if ($user->save()) {
                        $html = "<center><div class='alert alert-success'>
                        Đã " . ($user->right === 0 ? 'mở khoá' : 'khoá') . " thành viên <b>$user->email</b> thành công. Tải lại trang để có hiệu lực!
                        </div>
                        </center>";
                        return view('dialog', ['html' => $html]);
                    } else {
                        $html = "<center><div class='alert alert-danger'>
                        Lỗi khi " . ($user->right === 0 ? 'mở khoá' : 'khoá') . " thành viên <b>$user->email</b>, vui lòng thử lại
                        </div>
                        </center>";
                        return view('dialog', ['html' => $html]);
                    }
                }
                $html = "<center><div class='alert alert-warning'>
                Xác nhận " . ($user->right === -1 ? 'mở khoá' : 'khoá') . " tài khoản <b>$user->email</b>
                </div>
                <button class='btn btn-warning' id='confirm-block-user' data-id='$user->id'>Xác nhận</button>
                </center>";
                return view('dialog', ['html' => $html]);
                break;
            case 'upgrade':
                $user = User::findOrFail($request->id);
                if ($request->method() === "POST") {
                    if ($user->right === 1) {
                        $user->right = 0;
                    } elseif ($user->right === 0) {
                        $user->right = 1;
                    }
                    if ($user->save()) {
                        $html = "<center><div class='alert alert-success'>
                        Đã " . ($user->right === 1 ? 'nâng quyền' : 'hạ quyền') . " thành viên <b>$user->email</b> thành công. Tải lại trang để có hiệu lực!
                        </div>
                        </center>";
                        return view('dialog', ['html' => $html]);
                    } else {
                        $html = "<center><div class='alert alert-danger'>
                        Lỗi khi " . ($user->right === 1 ? 'nâng quyền' : 'hạ quyền') . " thành viên <b>$user->email</b>, vui lòng thử lại
                        </div>
                        </center>";
                        return view('dialog', ['html' => $html]);
                    }
                }
                $html = "<center><div class='alert alert-warning'>
                Xác nhận " . ($user->right === 0 ? 'nâng quyền' : 'hạ quyền') . " tài khoản <b>$user->email</b>
                </div>
                <button class='btn btn-warning' id='confirm-upgrade-user' data-id='$user->id'>Xác nhận</button>
                </center>";
                return view('dialog', ['html' => $html]);
                break;
            default:
                $user = User::paginate(10);
                return view('admin.user.index', ['user' => $user]);
        }
    }
}
