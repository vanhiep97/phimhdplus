<?php

namespace App\Providers;

use App\Film;
use App\Setting;
use Illuminate\Support\ServiceProvider;
use View;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        //
        View::composer('*', function ($view) {
            $slide = Film::where('is_slide', 1)->get();
            $topRate = Film::where('disable', 0)->orderBy('total_vote', 'DESC')->limit(10)->get();
            $view->with(['slide' => $slide, 'setting' => Setting::find(1), 'topRate' => $topRate]);
        });
    }

    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }
}
