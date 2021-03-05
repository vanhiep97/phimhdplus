<?php

namespace App\Http\Controllers;

use App\Film;
use Illuminate\Http\Request;

class SearchController extends Controller
{
    //
    public function index(Request $request)
    {
        $film = null;
        if ($request->keys) {
            $film = Film::where('disable', 0)->where(function ($query) {
                global $request;
                $query->where('name', 'like', '%' . $request->keys . '%')->orWhere('actor', 'like', '%' . $request->keys . '%')->orWhere('director', 'like', '%' . $request->keys . '%');
            })->paginate(24);
        }
        return view('search.index', ['film' => $film, 'keys' => $request->keys]);
    }

    public function tag(Request $request, $key = null)
    {
        $film = null;
        $tags = Film::inRandomOrder()->limit(5)->get();
        if ($key) {
            $film = Film::where('disable', 0)->where('tags', 'like', '%' . $request->key . '%')->paginate(24);
        }
        return view('search.tag', ['film' => $film, 'key' => $key, 'tags' => $tags]);
    }
}
