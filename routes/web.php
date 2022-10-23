<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\PublicController;
use App\Http\Controllers\CosplayController;
use App\Http\Controllers\RentLogController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\CostumeRentController;

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

Route::get('/', [PublicController::class, 'index']);

Route::middleware('only_guest')->group(function() {
    Route::get('login', [AuthController::class, 'login'])->name('login');
    Route::post('login', [AuthController::class, 'authenticating']);
    Route::get('register', [AuthController::class, 'register']);
    Route::post('register', [AuthController::class, 'registerProcess']);
});

Route::middleware('auth')->group(function() {
Route::get('logout', [AuthController::class, 'logout']);

Route::get('profile', [UserController::class, 'profile'])->middleware('only_client');
Route::put('profile', [UserController::class, 'editprofile'])->middleware('only_client');


Route::middleware('only_admin')->group(function() {
    Route::get('dashboard', [DashboardController::class, 'index']);
    Route::get('menu-costume', [CosplayController::class, 'index']);
    Route::get('costume-add', [CosplayController::class, 'add']);
    Route::post('costume-add', [CosplayController::class, 'store']);
    Route::get('costume-edit/{slug}', [CosplayController::class, 'edit']);
    Route::post('costume-edit/{slug}', [CosplayController::class, 'update']);
    Route::get('costume-delete/{slug}', [CosplayController::class, 'delete']);
    Route::get('costume-deleted/', [CosplayController::class, 'deletedCostume']);
    Route::get('costume-restore/{slug}', [CosplayController::class, 'restore']);
    
    Route::get('categories', [CategoryController::class, 'index']);
    Route::get('category-add', [CategoryController::class, 'add']);
    Route::get('category-edit/{slug}', [CategoryController::class, 'edit']);
    Route::post('category-add', [CategoryController::class, 'store']);
    Route::put('category-edit/{slug}', [CategoryController::class, 'update']);
    Route::get('category-delete/{slug}', [CategoryController::class, 'delete']);
    Route::get('category-deleted', [CategoryController::class, 'deletedCategory']);
    Route::get('category-restore/{slug}', [CategoryController::class, 'restore']);
    
    Route::get('users', [UserController::class, 'index']);
    Route::get('user-restore/{slug}', [UserController::class, 'restore']);
    Route::get('users-banned', [UserController::class, 'bannedUser']);
    Route::get('user-destroy/{slug}', [UserController::class, 'destroy']);
    Route::get('user-approve/{slug}', [UserController::class, 'approve']);
    Route::get('user-detail/{slug}', [UserController::class, 'show']);
    Route::get('registered-users', [UserController::class, 'registeredUser']);
    
    Route::get('costume-rent', [CostumeRentController::class, 'index']);
    Route::post('costume-rent', [CostumeRentController::class, 'store']);
    Route::get('rent-return', [CostumeRentController::class, 'returnCostume']);
    Route::post('rent-return', [CostumeRentController::class, 'saveRentCostume']);
    Route::get('rentlogs', [RentLogController::class, 'index']);

    
});


});