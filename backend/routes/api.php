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
    // USER
    Route::get('/admin', 'AdminController@index');
    Route::get('/user', 'AuthController@index');
    Route::post('/logout', 'AuthController@logout');
    Route::post('/register', 'AuthController@register');
    Route::post('/login', 'AuthController@login');
    Route::post('/admin', 'AdminController@adminlogin');
    Route::post('/admin/register', 'AdminController@adminregister');


    //INFORMASI
    Route::post('/informasi', 'InformasiController@addInformasi');
    Route::get('/informasi', 'InformasiController@filterInformasi');

    // INSTANSI
    Route::post('/kecamatan', 'InstansiController@addInstansi');
    Route::post('/kelurahan', 'InstansiController@addKelurahan');
    Route::get('/kelurahan', 'InstansiController@kelurahan');
    Route::get('/kecamatan', 'InstansiController@index');
    Route::get('/result', 'InstansiController@totalData');
    Route::get('/total', 'InstansiController@totalSemua');

    //PBB
    Route::get('/pbb', 'PbbController@index');
    Route::get('/pbb/notvalid', 'PbbController@dataBelumValid');
    Route::post('/pbb', 'PbbController@createPbb');
    Route::delete('/pbb/{id}', 'PbbController@destroy');
    Route::get('/pbb/{id}', 'PbbController@show');
    Route::put('/pbb/{id}', 'PbbController@updatePBB');
    Route::get('/pbb/report', 'PbbController@export')->name('drc.export');

    //KEPENDUDUKAN
    Route::get('/kependudukan', 'KependudukanController@index');
    Route::post('/kependudukan', 'KependudukanController@createKependudukan');
    Route::get('/kependudukan/report', 'KependudukanController@export');
});

Route::middleware('auth:api')->group(function () {
    Route::post('/user/update-password/{id}', 'AuthController@update');
});
