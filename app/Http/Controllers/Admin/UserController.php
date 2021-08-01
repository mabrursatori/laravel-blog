<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rule;
use Throwable;


class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {

        $users = User::paginate(10);
        $keyword = $request->get('keyword');
        if ($keyword) {
            $users = User::where(
                'name',
                "LIKE",
                "%$keyword%"
            )->paginate(10);
        }
        return view('pages.admin.user.index', ['users' => $users]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('pages.admin.user.create');
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
            "name" => "required|min:2|max:100",
            "username" => "required|min:5|max:20",
            "email" => "required|email",
            "password" => "required",
            "confirmation_password" => "required|same:password",
            "bio" => "required",
            "roles" => [
                "required",
                Rule::in(['ADMIN', 'PENULIS']),
            ]
        ])->validate();
        $new_user = new User;
        $new_user->name = $request->get('name');
        $new_user->username = $request->get('username');
        $new_user->email = $request->get('email');
        $new_user->password = Hash::make($request->get('password'));
        $new_user->bio = $request->get('bio');
        $new_user->roles = $request->get('roles');
        if ($request->file('image')) {
            $new_user->image = $request->file('image')->store(
                'images/users',
                'public'
            );
        } else {
            $new_user->image = "images/users/default-user.png";
        }
        $new_user->save();
        return redirect()->route('user.index')
            ->with('status', 'User successfully created');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $user = User::findOrFail($id);
        return view('pages.admin.user.detail', [
            'user' => $user
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
        $user = User::findOrFail($id);
        return view('pages.admin.user.edit', [
            'user' => $user
        ]);
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
            "name" => "required|min:2|max:100",
            "username" => "required|min:5|max:20",
            "email" => "required|email",
            "confirmation_password" => "same:password",
            "bio" => "required",
            "roles" => [
                "required",
                Rule::in(['ADMIN', 'PENULIS']),
            ]
        ])->validate();
        $new_user = User::findOrFail($id);
        $new_user->name = $request->get('name');
        $new_user->username = $request->get('username');
        $new_user->email = $request->get('email');
        if ($request->get('password')) {
            $new_user->password = Hash::make($request->get('password'));
        }
        $new_user->bio = $request->get('bio');
        $new_user->roles = $request->get('roles');
        if ($request->file('image')) {
            $new_user->image = $request->file('image')->store(
                'images/users',
                'public'
            );
        }
        $new_user->save();
        return redirect()->route('user.index')
            ->with('status', 'User successfully updated');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $user = User::findOrFail($id);


        try {
            $user->forceDelete();
            return redirect()->route('user.index')
                ->with('status', 'User successfully deleted');
        } catch (Throwable $e) {
            report($e);

            return redirect()->route('user.index')
                ->with('status', "Tidak dapat dihapus karena memiliki hubungan dengan data di table lain");
        }
    }
}
