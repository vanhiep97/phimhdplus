<?php

namespace App\Http\Controllers;

use App\Category;
use App\Film;
use App\FilmDetail;
use App\Like;
use App\Report;
use App\Vote;
use Auth;
use Illuminate\Http\Request;

class DetailController extends Controller
{
    public function category($id)
    {
        $category = Category::findOrFail($id);
        $film = Film::where([['category', 'like', '%' . $category->id . '%'], ['disable', 0], ['type', $category->type]])->paginate(24);
        return view('detail.category', ['category' => $category, 'film' => $film]);
    }

    public function detail($id)
    {
        $film = Film::findOrFail($id);
        $categories = json_decode($film->category, true);
        $relate = Film::where([['category', 'like', '%' . $categories[array_rand($categories)] . '%'], ['disable', 0]])->paginate(12);
        return view('detail.detail', ['film' => $film, 'relate' => $relate]);
    }

    public function viewFilm($id)
    {
        $film = Film::findOrFail($id);
        $film->view++;
        $film->save();
        $categories = json_decode($film->category, true);
        $relate = Film::where([['category', 'like', '%' . $categories[array_rand($categories)] . '%'], ['disable', 0]])->paginate(12);
        return view('detail.view', ['film' => $film, 'relate' => $relate]);
    }

    public function download($id)
    {
        $film = Film::findOrFail($id);
        return view('detail.download', ['film' => $film]);
    }

    public function getDownload($id)
    {
        $filmDetail = FilmDetail::findOrFail($id);
        $link = [];
        $link['m18'] = route('film.download.start', ['uri' => base64_encode($filmDetail->name . '.' . $filmDetail->id . '.m18')]);
        $link['m22'] = route('film.download.start', ['uri' => base64_encode($filmDetail->name . '.' . $filmDetail->id . '.m22')]);
        $link['m36'] = route('film.download.start', ['uri' => base64_encode($filmDetail->name . '.' . $filmDetail->id . '.m36')]);
        return response()->json($link);
    }

    public function startDownload($uri)
    {
        $uri = explode('.', base64_decode($uri));
        $filmDetail = FilmDetail::findOrFail($uri[1]);
        switch ($uri[2]) {
            case 'm18':
                if (Auth::user()->vip) {
                    if (file_exists($filmDetail->source_vip1)) {
                        return response()->download($filmDetail->source_vip1);
                    }
                    return redirect($filmDetail->source_vip1);
                }
                if (file_exists($filmDetail->source1)) {
                    return response()->download($filmDetail->source1);
                }
                return redirect($filmDetail->source1);
                break;
            case 'm22':
                if (Auth::user()->vip) {
                    if (file_exists($filmDetail->source_vip1)) {
                        return response()->download($filmDetail->source_vip2);
                    }
                    return redirect($filmDetail->source_vip2);
                }
                if (file_exists($filmDetail->source1)) {
                    return response()->download($filmDetail->source2);
                }
                return redirect($filmDetail->source2);
                break;
            case 'm36':
                if (Auth::user()->vip) {
                    if (file_exists($filmDetail->source_vip1)) {
                        return response()->download($filmDetail->source_vip3);
                    }
                    return redirect($filmDetail->source_vip3);
                }
                if (file_exists($filmDetail->source1)) {
                    return response()->download($filmDetail->source3);
                }
                return redirect($filmDetail->source3);
                break;
            default:
                abort(404);
                break;
        }
    }

    public function like($id)
    {
        $film = Film::findOrFail($id);
        $like = Like::where([['film_id', $id], ['user_id', Auth::id()]])->first();
        if (is_null($like)) {
            $like = new Like;
            $like->film_id = $film->id;
            $like->user_id = Auth::id();
            $like->save();
            return response()->json(['code' => 1]);
        } else {
            $like->delete();
            return response()->json(['code' => 0]);
        }
    }

    public function vote(Request $request, $id)
    {
        $film = Film::findOrFail($id);
        $userVote = Vote::where([['film_id', $id], ['user_id', Auth::id()]])->first();
        $filmVote = Vote::where('film_id', $id)->get();
        if (is_null($userVote)) {
            $userVote = new Vote;
            $userVote->film_id = $film->id;
            $userVote->user_id = Auth::id();
            $userVote->point = $request->point;
            if (sizeof($filmVote) === 0) {
                $total_point = $request->point;
            } else {
                $total_point = round(($filmVote->sum('point') + $request->point) / (sizeof($filmVote) + 1));
            }
            $film->total_vote = $total_point;
            $film->save();
            $userVote->save();
            return response()->json(['code' => 1]);
        } else {
            return response()->json(['code' => 0]);
        }
    }

    public function report(Request $request, $id)
    {
        if ($request->method() === "POST") {
            if (is_null($request->email)) {
                return response()->json(['message' => 'Vui lòng nhập email!'], 422);
            } elseif (!preg_match('/^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9_.+-].[a-zA-Z0-9_.+-]/', $request->email)) {
                return response()->json(['message' => 'Vui lòng nhập email hợp lệ!'], 422);
            } elseif (is_null($request->message)) {
                return response()->json(['message' => 'Vui lòng nhập nội dung lỗi bạn muốn gửi đi!'], 422);
            } else {
                $report = new Report;
                $report->film_id = $request->film;
                $report->email = $request->email;
                $report->messages = $request->message;
                $report->save();
                if ($report) {
                    return response()->json(['message' => 'Chúng tôi đã ghi nhận báo lỗi của bạn. Cảm ơn vì sự giúp đỡ, chúng tôi sẽ phản hồi lại với bạn sau!']);
                } else {
                    return response()->json(['message' => 'Có lỗi xảy ra, bạn vui lòng thử lại sau!'], 422);
                }
            }
        }
        $film = Film::findOrFail($id);
        return view('detail.report', ['film' => $film]);
    }

    public function getSource($filmDetailId)
    {
        $filmDetail = FilmDetail::findOrFail($filmDetailId);
        $data = array();
        $data['source'] = [
            'm18' => $filmDetail->source1,
            'm22' => $filmDetail->source2,
            'm36' => $filmDetail->source3,
        ];
        if (Auth::check()) {
            if (Auth::user()->vip) {
                $data['source'] = [
                    'm18' => $filmDetail->source_vip1,
                    'm22' => $filmDetail->source_vip2,
                    'm36' => $filmDetail->source_vip3,
                ];
            }
        }
        $data['name'] = $filmDetail->name;
        $data['poster'] = $filmDetail->film->poster;
        return response()->json($data);
    }
}
