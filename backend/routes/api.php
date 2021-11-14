<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Route::middleware('auth:api')->get('/user', function (Request $request) {
//     return $request->user();
// });

Route::group(['middleware' => ['json.response']], function () {
    // public routes
    Route::post('/login', 'AuthController@login');
    Route::post('/admin', 'AdminController@adminlogin');
    Route::post('/admin/register', 'AdminController@adminregister');
    Route::get('/pbb/report', 'PbbController@export')->name('drc.export');
    Route::get('/kependudukan/report', 'KependudukanController@export');
    Route::post('/logout', 'AuthController@logout');
    Route::post('/register', 'AuthController@register');

    // GET PROFILE
    Route::get('/admin', 'AdminController@index');
    Route::get('/user', 'AuthController@index');


    // INSTANSI
    Route::post('/kecamatan', 'InstansiController@addInstansi');
    Route::post('/kelurahan', 'InstansiController@addKelurahan');
    Route::get('/kelurahan', 'InstansiController@kelurahan');
    Route::get('/kecamatan', 'InstansiController@index');
    Route::get('/counter', 'InstansiController@viewCount');

    //PBB
    Route::get('/pbb', 'PbbController@index');
    Route::post('/pbb', 'PbbController@createPbb');
    Route::delete('/pbb/{id}', 'PbbController@destroy');
    Route::get('/pbb/{id}', 'PbbController@show');
    Route::put('/pbb/{id}', 'PbbController@updatePBB');

    //KEPENDUDUKAN
    Route::get('/kependudukan', 'KependudukanController@index');
    Route::post('/kependudukan', 'KependudukanController@createKependudukan');
});

Route::middleware('auth:api')->group(function () {
    Route::post('/user/update-password/{id}', 'AuthController@update');
});
