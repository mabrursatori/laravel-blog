<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

class ProductTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $satu = new User;
        $satu->username = "satori";
        $satu->name = "Satori";
        $satu->email = "mabrrsatori@gmail.com";
        $satu->password = Hash::make("123456");
        $satu->image = "saat-ini-tidak-ada-file.png";
        $satu->role = "Sarmili, Bintaro, Tangerang Selatan";
        $satu->bio = "085624436317";
        $satu->save();
    }
}
