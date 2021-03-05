<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class FilmDetail extends Model
{
    //
    public function film()
    {
        return $this->belongsTo('App\Film', 'film_id', 'id');
    }
}
