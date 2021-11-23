<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Instansi;
use App\Kelurahan;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class InstansiController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $instansi = Instansi::select()
            ->where('role', '=', 'User')
            ->orderBy('instansi', 'asc')
            ->get();
        $count = Instansi::select()
            ->where('role', '=', 'User')
            ->count();
        return response(['data' => $instansi, 'total' => $count], 200);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function addInstansi(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'instansi' => 'required|string'
        ]);

        if ($validator->fails()) {
            return response(['errors' => $validator->errors()->all()], 400);
        }

        $response = Instansi::create($request->all());
        return response($response, 200);
    }

    public function addKelurahan(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'id_instansi' => 'required',
            'kelurahan' => 'required|string'
        ]);

        if ($validator->fails()) {
            return response(['errors' => $validator->errors()->all()], 400);
        }

        $response = Kelurahan::create($request->all());
        return response($response, 200);
    }
    public function viewCount(Request $request)
    {
        if ($request->filled('waktu')) {
            $realisasi = DB::table('db_realisasi_pbb')
                ->select(
                    'id_instansi',
                    DB::raw('COUNT(db_realisasi_pbb.id) as total_pbb')
                )
                ->where('waktu', '=', $request->waktu)
                ->groupBy(
                    'id_instansi'
                );
            $penduduk = DB::table('db_kependudukan')
                ->select('id_instansi', DB::raw('COUNT(db_kependudukan.id) as total_penduduk'))
                ->where('waktu', '=', $request->waktu)
                ->groupBy(
                    'id_instansi'
                );
            $instansi = DB::table('instansi')
                ->select(
                    'instansi.id',
                    'instansi.instansi',
                    'lat',
                    'lng',
                    'realisasi.total_pbb',
                    'penduduk.total_penduduk'
                )
                ->leftJoinSub($realisasi, 'realisasi', function ($join) {
                    $join->on('instansi.id', 'realisasi.id_instansi');
                })
                ->leftJoinSub($penduduk, 'penduduk', function ($join) {
                    $join->on('instansi.id', 'penduduk.id_instansi');
                })
                ->where('role', '=', 'User')
                ->get();
            // $instansi = DB::table('instansi')
            //     ->select(
            //         'instansi',
            //         'instansi.instansi',
            //         'lat',
            //         'lng',
            //         DB::raw("count(distinct db_realisasi_pbb.id) as total_pbb")
            //     )
            //     ->leftJoinSub('db_realisasi_pbb', 'instansi.id', '=', 'db_realisasi_pbb.id_instansi')
            //     ->where('role', '=', 'User')
            //     ->where('waktu', '=', '2021-11-01')
            //     ->get();

            // $pbb = DB::table('db_realisasi_pbb')
            //     ->select('instansi.id', 'instansi.instansi', 'instansi.lat', 'instansi.lng')
            //     ->selectRaw(DB::raw("count(distinct db_realisasi_pbb.id) as total_pbb"))
            //     ->join('instansi', 'db_realisasi_pbb.id_instansi', '=', 'instansi.id')
            //     ->groupBy('instansi.id')
            //     // ->where('id_instansi', '=', $request->id_instansi)
            //     ->where('waktu', '=', '2021-11-01')
            //     ->get();
            // $pbb = DB::table('db_realisasi_pbb')
            //     ->select('id_instansi', DB::raw("count(distinct db_realisasi_pbb.id) as total_pbb"))
            //     ->join('instansi', 'db_realisasi_pbb.id_instansi', '=', 'instansi.id')
            //     ->groupBy('instansi.id')
            //     ->get();
            return response()->json(['data' => $instansi]);
        }
        // if (!$request->filled('waktu')) {
        //     $kelurahan = DB::table('kelurahan')
        //         ->select(DB::raw("count(distinct kelurahan.id) as total_kelurahan"))
        //         ->groupBy('id_instansi')
        //         ->where('id_instansi', '=', $request->id_instansi)
        //         ->count();
        //     return response()->json(['kelurahan' => $kelurahan]);
        // }
        // if ($request->filled('id_instansi', 'waktu')) {
        //     // $kelurahan = DB::table('instansi')
        //     //     ->join('db_realisasi_pbb', 'instansi.id', '=', 'db_realisasi_pbb.id_instansi')
        //     //     ->join('db_kependudukan', 'instansi.id', '=', 'db_kependudukan.id_instansi')
        //     //     ->where('instansi.id', '=', $request->id_instansi)
        //     //     ->where('waktu', '=', $request->waktu)
        //     //     ->count();

        //     $pbb = DB::table('db_realisasi_pbb')
        //         ->select(DB::raw("count(distinct db_realisasi_pbb.id) as total_pbb"))
        //         ->groupBy('id_instansi')
        //         ->where('id_instansi', '=', $request->id_instansi)
        //         ->where('waktu', '=', $request->waktu)
        //         ->count();
        //     $kep = DB::table('db_kependudukan')
        //         ->select(DB::raw("count(distinct db_kependudukan.id) as total_kep"))
        //         ->groupBy('id_instansi')
        //         ->where('id_instansi', '=', $request->id_instansi)
        //         ->where('waktu', '=', $request->waktu)
        //         ->count();
        //     $paten = DB::table('db_paten')
        //         ->select(DB::raw("count(distinct db_paten.id) as total_paten"))
        //         ->groupBy('id_instansi')
        //         ->where('id_instansi', '=', $request->id_instansi)
        //         ->where('waktu', '=', $request->waktu)
        //         ->count();
        //     // $akta = DB::table('db_akta')
        //     //     ->select(DB::raw("count(distinct db_akta.id) as total_akta"))
        //     //     ->groupBy('id_instansi')
        //     //     ->where('id_instansi', '=', $request->id_instansi)
        //     //     ->where('waktu', '=', $request->waktu)
        //     //     ->count();
        //     // $bencana = DB::table('db_bencana')
        //     //     ->select(DB::raw("count(distinct db_bencana.id) as total_akta"))
        //     //     ->groupBy('id_instansi')
        //     //     ->where('id_instansi', '=', $request->id_instansi)
        //     //     ->where('waktu', '=', $request->waktu)
        //     //     ->count();
        //     return response()->json(['pbb' => $pbb, 'kependudukan' => $kep, 'paten' => $paten]);
        // }
    }

    public function kelurahan(Request $request)
    {
        $kelurahan = Kelurahan::query();
        if ($request->input()) {

            $kelurahan = Kelurahan::where('id_instansi', '=', $request->id_instansi)->get();
            $count = Kelurahan::where('id_instansi', '=', $request->id_instansi)->get()->count();
        } else {
            $kelurahan = DB::table('kelurahan')->get();
            $count = DB::table('kelurahan')->get()->count();
        }

        return response(['data' => $kelurahan, 'total' => $count], 200);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
