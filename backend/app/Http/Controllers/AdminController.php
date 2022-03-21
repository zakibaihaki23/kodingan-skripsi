<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Log;

use App\Admin;
use App\Person;


class AdminController extends Controller
{
    public function adminlogin(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'username' => 'required|string|max:255',
            'password' => 'required|string|min:6',
        ]);

        if ($validator->fails()) {
            return response(['errors' => $validator->errors()->all()], 401); //402?
        }

        $admin = Admin::where('username', $request->username)->first();

        if ($admin) {
            if (Hash::check($request->password, $admin->password)) {
                $token = $admin->createToken('Laravel Password Grant Client')->accessToken;
                $response = [
                    'token' => $token,
                    'admin' => $admin
                ];
                return response($response, 200);
            } else {
                $response = ["message" => "Password salah"];
                return response($response, 421);
            }
        } else {
            $response = ["message" => 'Username tidak ditemukan'];
            return response($response, 422);
        }
    }

    public function adminregister(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'id_instansi' => 'required',
            'name' => 'required|string|max:255',
            'username' => 'required|string|unique:admin',
            'email' => 'required|string|email|max:255|unique:admin',
            'password' => 'required|string|min:6|confirmed',
            'instansi' => 'required|string'
        ]);

        if ($validator->fails()) {
            return response(['errors' => $validator->errors()->all()], 401); //402?
        }

        $request['password'] = Hash::make($request['password']);

        $admin = Admin::create($request->toArray());
        $token = $admin->createToken('Laravel Password Grant Client')->accessToken;

        $response = ['token' => $token];
        return response($response, 200);
    }

    public function index(Request $request)
    {

        $admin = Admin::where('role', '=', $request->role)->get();

        return response(['data' => $admin], 200);
    }
}
