<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
Route::get('/', 'HomeController@index')->name('home');
Route::match(['GET', 'POST'], '/register', 'HomeController@register')->name('register')->middleware('guest');
Route::group(['prefix' => 'login', 'middleware' => 'guest'], function () {
    Route::match(['GET', 'POST'], '/', 'HomeController@login')->name('login');
    Route::get('/facebook', 'HomeController@loginFacebook')->name('login.facebook');
    Route::get('/facebook/done', 'HomeController@loginFacebookDone')->name('login.facebook.done');
});
Route::get('/logout', function () {
    Auth::logout();
    return redirect()->route('home');
})->name('logout')->middleware('auth');
Route::get('/phim-bo-moi-nhat', 'HomeController@phimBo')->name('phimbo');
Route::get('/phim-le-moi-nhat', 'HomeController@phimLe')->name('phimle');
Route::get('/phim-moi-nhat', 'HomeController@phimMoi')->name('phimmoi');
Route::get('/hoi-dap-huong-dan', function () {
    return view('home.hoidap');
});
Route::get('/dieu-khoan-su-dung', function () {
    return view('home.dieukhoan');
});
Route::get('/the-loai/{id}-{uri}', 'DetailController@category')->name('category');
Route::get('/phim/{id}-{uri}', 'DetailController@detail')->name('film');
Route::get('/phim/{id}-{uri}/view', 'DetailController@viewFilm')->name('film.view');
Route::get('/phim/{id}-{uri}/download', 'DetailController@download')->name('film.download')->middleware('auth');
Route::get('/phim/download/{uri}', 'DetailController@startDownload')->name('film.download.start')->middleware('auth');
Route::get('/tags/{key?}', 'SearchController@tag')->name('tag');
Route::get('/search', 'SearchController@index')->name('search');
Route::group(['prefix' => 'ajax'], function () {
    Route::get('/source/{id}', 'DetailController@getSource');
    Route::get('/download/{id}', 'DetailController@getDownload');
    Route::any('/report/{id}', 'DetailController@report');
    Route::any('/like/{id}', 'DetailController@like')->middleware('auth');
    Route::any('/vote/{id}', 'DetailController@vote')->middleware('auth');
    Route::get('/upgrade', 'UserController@upgradeAjax')->middleware('auth');
});
Route::group(['prefix' => 'admin', 'middleware' => 'admin'], function () {
    Route::get('/', 'AdminController@index')->name('admin');
    Route::any('/film/{action?}', 'AdminController@film')->name('admin.film');
    Route::any('/film/source/{id}/{action?}/{filmDefail?}', 'AdminController@filmSource')->name('admin.film.source');
    Route::any('/category/{action?}', 'AdminController@category')->name('admin.category');
    Route::any('/user/{action?}', 'AdminController@user')->name('admin.user');
});
Route::group(['prefix' => 'user', 'middleware' => 'auth'], function () {
    Route::get('/', 'UserController@index')->name('user');
    Route::any('/change-password', 'UserController@changePassword')->name('user.pass');
    Route::any('/change-avatar', 'UserController@changeAvatar')->name('user.avatar');
    Route::any('/upgrade', 'UserController@upgrade')->name('user.upgrade');
    Route::any('/recharge', 'UserController@recharge')->name('user.recharge');
});