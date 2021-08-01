<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Transaction;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

class TransactionController extends Controller
{
    public function index()
    {
        $data = null;
        if (Auth::user()->roles == "ADMIN") {
            $data = DB::table('transactions')
                ->join('users', 'users.id', '=', 'transactions.user_id')
                ->join('blogs', 'blogs.id', '=', 'transactions.blog_id')
                ->select('transactions.*', 'users.name', 'blogs.title as titleblog')
                ->orderBy('transactions.id', 'desc')
                ->paginate(10);
        } else {
            $data = DB::table('transactions')
                ->join('users', 'users.id', '=', 'transactions.user_id')
                ->join('blogs', 'blogs.id', '=', 'transactions.blog_id')
                ->select('transactions.*', 'users.name', 'blogs.title as titleblog', 'blogs.user_id')
                ->where('blogs.user_id', '=', Auth::user()->id)
                ->orderBy('transactions.id', 'desc')
                ->paginate(10);
        }
        return view('pages.admin.transaksi.index', ['data' => $data]);
    }

    public function destroy($id)
    {
        $transaction = Transaction::findOrFail($id);
        $transaction->forceDelete();
        return redirect()->route('transaction')
            ->with('status', 'history successfully deleted');
    }
}
