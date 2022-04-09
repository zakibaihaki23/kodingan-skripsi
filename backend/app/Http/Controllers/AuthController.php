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

        $user = User::with('instansi')
        ->with('kelurahan')
        ->where('users.username','=', $request->username)
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
            'email' => 'required|string|email|max:255',
            'password' => 'required|string|min:6|confirmed',
            'role' => 'unique_with:users, username'
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
    public function update(Request $request, $id)
    {
        $this->validate($request, [
            "name" => "required|string",
            "username" => "required|unique:users,username," . $id,
            "email" => "required",
            "password" => "sometimes|confirmed",
        ]);
        
        $user = User::findOrFail($id);

        if ($request->filled(['password','password_confirmation'])) {
            $user->update([
                "name" => $request->name,
                "username" => $request->username,
                "email" => $request->email,
                "password" => Hash::make($request->password),
                "password_confirmation" => Hash::make($request->password)
            ]);
        } else {
            // Jika user tidak mengganti passwordnya

            $user->update([
                "name" => $request->name,
                "username" => $request->username,
                "email" => $request->email,
            ]);
        }
        // if (!Hash::check($request->current_password, $user->password)) {
        //     $response = ['message' => 'Password yang anda masukkan salah'];
        //     return response($response, 422);
        // }
        // $user->password = Hash::make($request->password);
        // $user->save();

        $response = ['message' => 'Profile Berhasil diubah'];

        return response($response, 201);
    }
    public function profile(Request $request)
    {
        $user = $request->user();
        $response = $user;
        return response($response, 200);
    }
    
    public function show($id)
    {
        $user = DB::table('users')
        ->select('users.id','users.instansi_id','users.name','users.username','users.email','users.role','instansi.nama_instansi')
        ->join('instansi','instansi.id','=', 'users.instansi_id')
        ->where('users.id','=',$id)
        ->first();
        // $user = User::where('users.id', $id)
        // ->join('instansi','instansi.id' , '=', 'users.instansi_id')->first();

        return response()->json(['data' => $user,],200);
    }

    public function index(Request $request)
    {
    if (!$request->input()) {
    $instansi = User::select('users.id','users.instansi_id','users.name','users.username','users.email','users.role','instansi.nama_instansi')
    ->leftJoin('instansi','instansi.id','users.instansi_id')
    ->where('role','=','User')
    ->orWhere('role','=','Camat')
    ->orderBy('id','DESC')
    ->get();

    $all = DB::table('users')
    ->where('role','!=','Admin')
    ->count();
    } else {
       if($request->filled('instansi_id')) {
           $instansi = User::select('users.id','users.instansi_id','users.name','users.username','users.email','users.role','instansi.nama_instansi')
           ->leftJoin('instansi','instansi.id','users.instansi_id')
           ->where('role','!=','Admin')
           ->where('instansi_id','=', $request->get('instansi_id'))
           ->get();
       }
       if($request->filled('role')) {
        $instansi = User::select('users.id','users.instansi_id','users.name','users.username','users.email','users.role','instansi.nama_instansi')
        ->leftJoin('instansi','instansi.id','users.instansi_id')
        ->where('role','=',$request->get('role'))
        ->get();
    } 
    if($request->filled('instansi_id','role')) {
        $instansi = User::select('users.id','users.instansi_id','users.name','users.username','users.email','users.role','instansi.nama_instansi')
        ->leftJoin('instansi','instansi.id','users.instansi_id')
        ->where('instansi_id','=', $request->get('instansi_id'))
        ->where('role','=',$request->get('role'))
        ->get();
    } 
    }     

        return response(['data' => $instansi], 200);
    }
    public function destroy($id)
    {
        return User::destroy($id);
    }

    public function role() {
        
        // $data = User::select('role', DB::raw('count(*) as total'))
        //     ->where('role','!=','Admin')
        //     ->groupBy('role')
        //     ->get();
        // $total = DB::table('users')
        // ->where('role','!=','Admin')
        // ->count();
        $user = User::select('role', DB::raw('count(*) as total'))
            ->where('role','=','User')
            ->get();
        $camat = User::select('role', DB::raw('count(*) as total'))
            ->where('role','=','Camat')
            ->get();

        return response(['user' => $user, 'camat' => $camat], 200);
    }
    public function roleKecamatan(Request $request) {
        
        // $data = User::select('role', DB::raw('count(*) as total'))
        //     ->where('role','!=','Admin')
        //     ->groupBy('role')
        //     ->get();
        // $total = DB::table('users')
        // ->where('role','!=','Admin')
        // ->count();
        $kelurahan = User::select('role', DB::raw('count(*) as total'))
            ->where('instansi_id','=', $request->input('instansi_id'))
            ->where('role','=','Kelurahan')
            ->get();
        $lurah = User::select('role', DB::raw('count(*) as total'))
            ->where('instansi_id','=', $request->input('instansi_id'))
            ->where('role','=','Lurr')
            ->get();

        return response(['user' => $kelurahan, 'camat' => $lurah], 200);
    }
    public function indexKecamatan(Request $request)
    {
        $instansi_id = $request->input('instansi_id');
        $role = $request->input('role');
        $kelurahan = $request->input('kelurahan');

    
       if($request->filled('instansi_id','role','kelurahan')) {
           $instansi = User::select('users.id','users.instansi_id','users.name','users.username','users.email','users.role','kelurahan.nama_kelurahan')
           ->leftJoin('kelurahan','kelurahan.id','users.kelurahan_id')
           ->when($instansi_id, function ($query, $instansi_id) {
               return $query->where('users.instansi_id', $instansi_id);
           })
           ->when($role, function ($query, $role) {
               return $query->where('users.role', $role);
           })
           ->when($kelurahan, function ($query, $role) {
            return $query->where('kelurahan.nama_kelurahan', $role);
             })
           ->orderBy('users.role','ASC')
           ->paginate(10);
           
       } else {
        $instansi = User::select('users.id','users.instansi_id','users.name','users.username','users.email','users.role','kelurahan.nama_kelurahan')
        ->leftJoin('kelurahan','kelurahan.id','users.kelurahan_id')
        ->when($instansi_id, function ($query, $instansi_id) {
            return $query->where('users.instansi_id', $instansi_id);
        })
        ->when($kelurahan, function ($query, $role) {
            return $query->where('kelurahan.nama_kelurahan', $role);
        })
        ->where(
            function($query) {
              return $query
                     ->where('users.role', '=', 'Kelurahan')
                     ->orWhere('users.role', '=', 'Lurr');
             })
        ->orderBy('users.role','ASC')
        ->paginate(10);
       }
        return response(['data' => $instansi], 200);
    }
}
