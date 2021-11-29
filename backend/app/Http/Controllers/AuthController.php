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

use App\User;
use App\Person;
use App\Rules\MatchOldPassword;
use Illuminate\Support\Facades\Auth as FacadesAuth;

class AuthController extends Controller
{
    public function login(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'username' => 'required|string|max:255',
            'password' => 'required|string|min:6',
        ]);

        if ($validator->fails()) {
            return response(['errors' => $validator->errors()->all()], 401); //402?
        }

        $user = User::where('username', $request->username)
        ->select()
        ->join('instansi','instansi.id' , '=', 'users.instansi_id')
        ->first();


        if ($user) {
            if (Hash::check($request->password, $user->password)) {
                $token = $user->createToken('Token')->accessToken;

                $response = [
                    'user' => $user,
                    'token' => $token,

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

    public function logout(Request $request)
    {
        $token = $request->user()->token();
        $token->revoke();
        $response = ['message' => 'You have been successfully logged out!'];
        return response($response, 200);
    }

    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'instansi_id' => 'required',
            'name' => 'required|string|max:255',
            'username' => 'required|string|unique:users',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:6|confirmed',
        ]);

        if ($validator->fails()) {
            return response($validator->errors(), 401); //402?
        }

        $request['password'] = Hash::make($request['password']);

        $user = User::create($request->toArray());
        // $token = $user->createToken('Laravel Password Grant Client')->accessToken;

        $response = ['User berhasil disimpan'];
        return response($response, 200);
    }
    public function update(Request $request)
    {
        $request->validate([
            'current_password' => 'required',
            'password' => 'required|string|min:8|confirmed',
            'password_confirmation' => 'required',
        ]);
        $user = FacadesAuth::user();

        if (!Hash::check($request->current_password, $user->password)) {
            $response = ['message' => 'Password yang anda masukkan salah'];
            return response($response, 422);
        }
        $user->password = Hash::make($request->password);
        $user->save();

        $response = ['message' => 'Password Berhasil diubah'];

        return response($response, 201);
    }
    public function profile(Request $request)
    {
        $user = $request->user();
        $response = $user;
        return response($response, 200);
    }

    public function index()
    {
    //     $user = DB::table('users')
    //     ->select(
    //         'instansi_id',
    //         'name',
    //         'username',
    //         'email',
    //         'role'

    //     );
    // $instansi = DB::table('instansi')
    //     ->select(
    //         'instansi.id',
    //         'instansi.nama_instansi',
    //         'user.name',
    //         'user.username',
    //         'user.email',
    //         'user.role'
    //     )
    //     ->leftJoinSub($user, 'user', function ($join) {
    //         $join->on('instansi.id', 'user.instansi_id');
    //     })
    //     ->where('role','=','User')
    //     ->orWhere('role','=','Camat')
    //     ->get();

    $instansi = User::select('users.id','users.instansi_id','users.name','users.username','users.email','users.role','instansi.nama_instansi')
    ->leftJoin('instansi','instansi.id','users.instansi_id')
    ->where('role','=','User')
    ->orWhere('role','=','Camat')
    ->get();
        // $user = User::join('instansi','instansi.id' , '=', 'users.instansi_id')
        // ->where('role','=','User')
        // ->orWhere('role','=','Camat')
        // ->get();
            
        
        $count = User::select('role', DB::raw('count(*) as total'))
            ->where('role','!=','Admin')
            ->groupBy('role')
            ->get();
        $all = DB::table('users')
        ->where('role','!=','Admin')
        ->count();
            
        // $count = DB::table('users')
        // ->where('role','=','User')
        // ->orWhere('role','=','Camat')
        //     ->count();
        // $user = User::where('name', '=', $request->name)->get();

        return response(['data' => $instansi, 'total' => $count, 'all' => $all], 200);
    }
   
}
