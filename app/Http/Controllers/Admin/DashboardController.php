<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

class DashboardController extends Controller
{
    public function index()
    {
        if (Auth::user()->roles == "ADMIN") {
            $allArticel = DB::table('blogs')
                ->where('deleted_at', '=', null)
                ->count();
            $transactions = DB::table('transactions')
                ->count();
            $processed = DB::table('blogs')
                ->where('status', '=', 'PENDING')
                ->where('deleted_at', '=', null)
                ->count();
            $accepted = DB::table('blogs')
                ->where('status', '!=', 'PENDING')
                ->where('deleted_at', '=', null)
                ->count();
        } else {
            $allArticel = DB::table('blogs')
                ->where('user_id', '=', Auth::user()->id)
                ->where('deleted_at', '=', null)
                ->count();
            $transactions = DB::table('transactions')
                ->where('user_id', '=', Auth::user()->id)
                ->count();
            $processed = DB::table('blogs')
                ->where('status', '=', 'PENDING')
                ->where('user_id', '=', Auth::user()->id)
                ->where('deleted_at', '=', null)
                ->count();
            $accepted = DB::table('blogs')
                ->where('status', '!=', 'PENDING')
                ->where('user_id', '=', Auth::user()->id)
                ->where('deleted_at', '=', null)
                ->count();
        }

        return view(
            'pages.admin.dashboard',
            [
                'allArticel' => $allArticel,
                'transactions' => $transactions,
                'accepted' => $accepted,
                'processed' => $processed
            ]
        );
    }
}
