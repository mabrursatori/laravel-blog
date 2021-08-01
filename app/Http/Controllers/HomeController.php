<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Transaction;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;


class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    // public function __construct()
    // {
    //     $this->middleware('auth');
    // }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        $categories = Category::paginate(6);
        $mainBlog = DB::table('blogs')
            ->join('users', 'users.id', '=', 'blogs.user_id')
            ->select('blogs.*', 'users.name as author')
            ->where('blogs.status', '=', 'ACCEPTED')
            ->orderBy('blogs.id', 'desc')
            ->first();
        $blogs = DB::table('blogs')
            ->join('users', 'users.id', '=', 'blogs.user_id')
            ->select('blogs.*', 'users.name as author')
            ->where('blogs.status', '=', 'ACCEPTED')
            ->orderBy('blogs.id', 'desc')
            ->paginate(4);
        return view('pages.home', [
            'mainBlog' => $mainBlog,
            'categories' => $categories,
            'blogs' => $blogs
        ]);
    }

    public function show($slug)
    {
        $categories = Category::paginate(6);
        $allCategories = Category::get();
        $blog = DB::table('blogs')
            ->join('users', 'users.id', '=', 'blogs.user_id')
            ->where('blogs.slug', '=', $slug)
            ->select('blogs.*', 'users.name as author')
            ->first();
        $history = new Transaction;
        $history->blog_id = $blog->id;
        if (Auth::user()) {
            $history->user_id = Auth::user()->id;
        } else {
            $user = User::where('name', 'Unknown')->first();
            $history->user_id = $user->id;
        }
        $history->save();
        return view('pages.detail', [
            'blog' => $blog,
            'categories' => $categories,
            'allCategories' => $allCategories
        ]);
    }

    public function category($name)
    {
        $categories = Category::paginate(6);
        $allCategories = Category::get();
        $blogs =  DB::table('blogs')
            ->join('users', 'users.id', '=', 'blogs.user_id')
            ->join('blog_category', 'blog_category.blog_id', '=', 'blogs.id')
            ->join('categories', 'categories.id', '=', 'blog_category.category_id')
            ->select('blogs.*', 'users.name as author')
            ->where('categories.name', '=', $name)
            ->where('blogs.status', '=', 'ACCEPTED')
            ->get();
        return view('pages.category', [
            'categories' => $categories,
            'blogs' => $blogs,
            'allCategories' => $allCategories
        ]);
    }
}
