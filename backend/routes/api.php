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
    Route::put('/user/update/{id}', 'AuthController@update');
    Route::get('/user/{id}', 'AuthController@show');
    Route::delete('/user/{id}', 'AuthController@destroy');


    

    //INFORMASI
    Route::post('/informasi', 'InformasiController@addInformasi');
    Route::get('/informasi', 'InformasiController@filterInformasi');
    Route::get('/informasi/all', 'InformasiController@index');


    // INSTANSI
    Route::post('/kecamatan', 'InstansiController@addInstansi');
    Route::post('/kelurahan', 'InstansiController@addKelurahan');
    Route::get('/kelurahan', 'InstansiController@kelurahan');
    Route::get('/kecamatan', 'InstansiController@index');
    Route::get('/result', 'InstansiController@totalData');
    Route::get('/notvalid','PbbController@totalData');
    Route::get('/total', 'InstansiController@totalSemua');
    Route::get('/chart', 'PbbController@dataBelumValid');

    //PBB
    Route::get('/pbb', 'PbbController@index');
    Route::post('/pbb', 'PbbController@createPbb');
    Route::get('/pbb/{id}', 'PbbController@show');
    Route::delete('/pbb/{id}', 'PbbController@destroy');
    Route::put('/pbb/{id}', 'PbbController@updatePBB');
    Route::put('/valid/pbb/{id}', 'PbbController@validasiPbb');
    Route::get('/camat/pbb','PbbController@indexCamat');

    
    //PATEN
    Route::get('/paten', 'PatenController@index');
    Route::post('/paten', 'PatenController@createPaten');
    Route::delete('/paten/{id}', 'PatenController@destroy');
    Route::get('/paten/{id}', 'PatenController@show');
    Route::put('/paten/{id}', 'PatenController@updatePaten');
    Route::put('/valid/paten/{id}', 'PatenController@ValidasiPaten');
    Route::get('/camat/paten','PatenController@indexCamat');



    //KEPENDUDUKAN
    Route::get('/kependudukan', 'KependudukanController@index');
    Route::post('/kependudukan', 'KependudukanController@createKependudukan');
    Route::delete('/kependudukan/{id}', 'KependudukanController@destroy');
    Route::get('/kependudukan/{id}', 'KependudukanController@show');
    Route::put('/kependudukan/{id}', 'KependudukanController@updateKependudukan');
    Route::put('/valid/kependudukan/{id}', 'KependudukanController@ValidasiKependudukan');
    Route::get('/camat/kependudukan','KependudukanController@indexCamat');

     //AKTA
     Route::get('/akta', 'AktaController@index');
     Route::post('/akta', 'AktaController@createAkta');
     Route::delete('/akta/{id}', 'AktaController@destroy');
     Route::get('/akta/{id}', 'AktaController@show');
     Route::put('/akta/{id}', 'AktaController@updateAkta');

    //BENCANA
    Route::get('/bencana', 'BencanaController@index');
    Route::post('/bencana', 'BencanaController@createBencana');
    Route::delete('/bencana/{id}', 'BencanaController@destroy');
    Route::get('/bencana/{id}', 'BencanaController@show');
    Route::put('/bencana/{id}', 'BencanaController@updateBencana');
    Route::put('/valid/bencana/{id}', 'BencanaController@validasiBencana');
    Route::get('/camat/bencana','BencanaController@indexCamat');

    
});

Route::middleware('auth:api')->group(function () {
    ;
});
