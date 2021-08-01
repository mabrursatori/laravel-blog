<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\CategoryRequest;
use Illuminate\Http\Request;
use App\Models\Category;
use Throwable;

class CategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $data = Category::paginate(10);
        $keyword = $request->get('keyword');
        if ($keyword) {
            $data = Category::where(
                'name',
                "LIKE",
                "%$keyword%"
            )->paginate(10);
        }
        return view('pages.admin.category.index', ['data' => $data]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('pages.admin.category.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(CategoryRequest $request)
    {
        $data = $request->all();

        Category::create($data);
        return redirect()->route('category.index')
            ->with('status', 'Kategori berhasil ditambahkan');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $item = Category::findOrFail($id);
        return view('pages.admin.category.edit', [
            'item' => $item
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(CategoryRequest $request, $id)
    {
        $data = $request->all();
        $item = Category::findOrFail($id);
        $item->update($data);
        return redirect()->route('category.index')
            ->with('status', 'Category berhasil diupdate');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $item = Category::findOrFail($id);


        try {
            $item->forceDelete();

            return redirect()->route('category.index')
                ->with('status', 'Category berhasil dihapus');
        } catch (Throwable $e) {
            report($e);

            return redirect()->route('category.index')
                ->with('status', "Tidak dapat dihapus karena memiliki hubungan dengan data di table lain");
        }
    }

    public function ajaxSearch(Request $request)
    {
        $keyword = $request->get('w');
        $categories = Category::where("name", "LIKE", "%$keyword%")->get();
        return $categories;
    }
}
