<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Admin\DashboardController;
use App\Http\Controllers\Admin\UserController;
use App\Http\Controllers\Admin\CategoryController;
use App\Http\Controllers\Admin\BlogController;
use App\Http\Controllers\Admin\TransactionController;
use App\Http\Controllers\HomeController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/



Auth::routes();

Route::get('/', [HomeController::class, 'index'])->name('home');
Route::get('home/show/{slug}', [HomeController::class, 'show'])->name('show');
Route::get('home/category/{name}', [HomeController::class, 'category'])->name('category');



Route::prefix('admin')
    ->middleware(['auth', 'admin'])
    ->group(function () {
        Route::get('/', [DashboardController::class, 'index'])
            ->name('dashboard');
        Route::resource('user', UserController::class);
        Route::get('/ajax/categories/search', [CategoryController::class, 'ajaxSearch']);
        Route::resource('category', CategoryController::class);
        Route::resource('blog', BlogController::class);
        Route::delete('/transaction/delete/{id}', [TransactionController::class, 'destroy'])->name('transaction.destroy');
        Route::get('transaction', [TransactionController::class, 'index'])->name('transaction');
    });

// Route::prefix('admin')
//     ->group(function () {
//         Route::get('/', [DashboardController::class, 'index'])
//             ->name('dashboard');
//         Route::resource('user', UserController::class);
//         Route::resource('category', CategoryController::class);
//         Route::resource('blog', BlogController::class);
//         Route::get('transaction', TransactionController::class);
//     });
