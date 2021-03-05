<?php

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('settings')->insert([
            'title' => 'PhimHD+ - PhimHD Online',
            'keywords' => 'phimhd online, phimhd moi nhat, phimhd+, phimhd mien phi',
            'descriptions' => 'PhimHD online cập nhật mới nhất',
            'vip' => 99
        ]);
    }
}
