<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Blog;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Validator;
use Throwable;

class BlogController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $blogs = null;
        if (Auth::user()->roles == "ADMIN") {
            $blogs = Blog::paginate(10);
            $keyword = $request->get('keyword');
            if ($keyword) {
                $blogs = Blog::where(
                    'title',
                    "LIKE",
                    "%$keyword%"
                )->paginate(10);
            }
        } else {
            $blogs = Blog::where('user_id', Auth::user()->id)->paginate(10);
            $keyword = $request->get('keyword');
            if ($keyword) {
                $blogs = Blog::where('user_id', Auth::user()->id)
                    ->where(
                        'title',
                        "LIKE",
                        "%$keyword%"
                    )->paginate(10);
            }
        }

        return view('pages.admin.blog.index', ['blogs' => $blogs]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('pages.admin.blog.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        Validator::make($request->all(), [
            'title' => 'required',
            'image' => 'required|image',
            'content' => 'required',
            'categories' => 'required'
        ])->validate();
        $new_blog = new Blog;
        $new_blog->title = $request->get('title');
        $new_blog->slug = Str::slug($request->get('title'));
        $new_blog->content = $request->get('content');
        $new_blog->image = $request->file('image')->store(
            'images/blogs',
            'public'
        );
        $new_blog->user_id = Auth::user()->id;
        $new_blog->save();
        $new_blog->categories()->attach($request->get('categories'));
        return redirect()->route('blog.index')
            ->with('status', 'Artikel berhasil ditambahkan');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $blog = Blog::findOrFail($id);
        return view('pages.admin.blog.detail', [
            'blog' => $blog
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $blog = Blog::findOrFail($id);
        return view(
            'pages.admin.blog.edit',
            [
                'blog' => $blog
            ]
        );
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        Validator::make($request->all(), [
            'title' => 'required',
            'content' => 'required',
        ])->validate();
        $blog = Blog::findOrFail($id);
        $idcategory = [];
        foreach ($blog->categories as $category) {
            array_push($idcategory, $category->id);
        }
        $blog->title = $request->get('title');
        $blog->slug = Str::slug($request->get('title'));
        $blog->status = $request->get('status');
        $blog->content = $request->get('content');
        if ($request->file('image')) {
            $blog->image = $request->file('image')->store(
                'images/blogs',
                'public'
            );
        }
        $blog->save();
        if ($request->get('categories')) {
            $blog->categories()->sync($request->get('categories'));
        } else {
            $blog->categories()->sync($idcategory);
        }
        return redirect()->route('blog.index')
            ->with('status', 'Artikel berhasil ditambahkan');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $blog = Blog::findOrFail($id);
        try {
            $blog->categories()->detach($blog->categories);
            $blog->forceDelete();
            return redirect()->route('blog.index')
                ->with('status', 'Blog successfully deleted');
        } catch (Throwable $e) {
            report($e);

            return redirect()->route('blog.index')
                ->with('status', "Tidak dapat dihapus karena memiliki hubungan dengan data di table lain");
        }
    }
}
