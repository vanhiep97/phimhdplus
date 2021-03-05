<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateFilmTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('films', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name');
            $table->string('poster');
            $table->text('about');
            $table->text('actor');
            $table->text('director');
            $table->text('category');
            $table->text('tags')->nullable();
            $table->integer('is_slide')->default(0); //1 slide - 0 no
            $table->integer('disable')->default(0); //1 slide - 0 no
            $table->integer('type'); //1 phim le - 2 phim bo
            $table->integer('view')->default(0);
            $table->integer('total_vote')->default(5);
            $table->integer('episode');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('film');
    }
}
