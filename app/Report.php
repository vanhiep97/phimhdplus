<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Report extends Model
{
    //
    public function film()
    {
        return $this->hasMany('App\Film', 'film_id', 'id');
    }
}
