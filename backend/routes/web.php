<?php

use Illuminate\Support\Facades\Route;

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

Route::get('/', function () {
    return view('welcome');
});


Route::get('/api/report/pbb', 'PbbController@export')->name('reportPbb');
Route::get('/api/report/paten', 'PatenController@export')->name('reportPaten');
Route::get('/api/report/kependudukan', 'KependudukanController@export')->name('reportKependudukan');
Route::get('/api/report/bencana', 'BencanaController@export')->name('reportBencana');


