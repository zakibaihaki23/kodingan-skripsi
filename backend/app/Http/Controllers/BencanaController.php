<?php

namespace App\Http\Controllers;

use App\Bencana;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;
use PDF;

class BencanaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $bencana = Bencana::query();
        if (!$request->input()) {
            $bencana = Bencana::select()->get();
            $count = Bencana::select()->get()->count();
        } else {
            if ($request->filled('instansi_id')) {
                $bencana = Bencana::where('instansi_id', '=', $request->get('instansi_id'))->orderBy('id', 'DESC')
                    ->get();
                $count = Bencana::where('instansi_id', '=', $request->get('instansi_id'))->orderBy('id', 'DESC')
                    ->get()->count();
            }
            if ($request->filled('periode')) {
                $bencana = Bencana::where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))->orderBy('id', 'DESC')
                    ->get();
                $count = Bencana::where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))->orderBy('id', 'DESC')
                    ->get()->count();
            }
            if ($request->filled('is_verified')) {
                $bencana = Bencana::where('is_verified', '=', $request->get('is_verified'))->orderBy('id', 'DESC')
                    ->get();
                $count = Bencana::where('is_verified', '=', $request->get('is_verified'))->orderBy('id', 'DESC')
                    ->get()->count();
            }
            if ($request->filled(['instansi_id', 'periode','is_verified'])) {
                $bencana = Bencana::where('instansi_id', '=', $request->get('instansi_id'))
                    ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                    ->where('is_verified','=',$request->get('is_verified'))
                    ->orderBy('id', 'DESC')
                    ->get();
                $count = Bencana::where('instansi_id', '=', $request->get('instansi_id'))
                    ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                    ->where('is_verified','=',$request->get('is_verified'))
                    ->orderBy('id', 'DESC')
                    ->get()->count();
            }
             else {
             
            if ($request->filled(['instansi_id', 'periode'])) {
                $bencana = Bencana::where('instansi_id', '=', $request->get('instansi_id'))
                    ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                    ->orderBy('id', 'DESC')
                    ->get();
                $count = Bencana::where('instansi_id', '=', $request->get('instansi_id'))
                    ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                    ->orderBy('id', 'DESC')
                    ->get()->count();
            }
            if ($request->filled(['periode','is_verified'])) {
                $bencana = Bencana::where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                ->where('is_verified','=',$request->get('is_verified'))
                ->orderBy('id', 'DESC')
                ->get();
                $count = Bencana::where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                ->where('is_verified','=',$request->get('is_verified'))
                ->orderBy('id', 'DESC')
                ->get()->count();
            }
            if ($request->filled(['instansi_id', 'is_verified'])) {
                $bencana = Bencana::where('instansi_id', '=', $request->get('instansi_id'))
                    ->where('is_verified', '=', $request->get('is_verified'))
                    ->orderBy('id', 'DESC')
                    ->get();
                $count = Bencana::where('instansi_id', '=', $request->get('instansi_id'))
                    ->where('is_verified', '=', $request->get('is_verified'))
                    ->orderBy('id', 'DESC')
                    ->get()->count();
            }
             }
        }
        return response(['data' => $bencana, 'total' => $count], 200);
    }

    public function indexCamat(Request $request)
    {
        $bencana = Bencana::query();
        if (!$request->input()) {
            $bencana = Bencana::select()
                    ->where('is_verified','!=', 2)
                    ->get();
            $count = Bencana::select()
                    ->where('is_verified','!=', 2)
                    ->get()
                    ->count();
        } else {
            if ($request->filled('instansi_id')) {
                $bencana = Bencana::where('instansi_id', '=', $request->get('instansi_id'))
                    ->where('is_verified','!=', 2)
                    ->orderBy('id', 'DESC')
                    ->get();
                $count = Bencana::where('instansi_id', '=', $request->get('instansi_id'))
                    ->where('is_verified','!=', 2)
                    ->get()->count();
            }
            if ($request->filled(['instansi_id', 'periode','is_verified'])) {
                $bencana = Bencana::where('instansi_id', '=', $request->get('instansi_id'))
                    ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                    ->where('is_verified','=',$request->get('is_verified'))
                    ->orderBy('id', 'DESC')
                    ->get();
                $count = Bencana::where('instansi_id', '=', $request->get('instansi_id'))
                    ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                    ->where('is_verified','=',$request->get('is_verified'))
                    ->orderBy('id', 'DESC')
                    ->get()->count();
            }
            if ($request->filled(['instansi_id', 'periode'])) {
                $bencana = Bencana::where('instansi_id', '=', $request->get('instansi_id'))
                    ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                    ->orderBy('id', 'DESC')
                    ->get();
                $count = Bencana::where('instansi_id', '=', $request->get('instansi_id'))
                    ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                    ->orderBy('id', 'DESC')
                    ->get()->count();
            }
            if ($request->filled(['periode','is_verified'])) {
                $bencana = Bencana::where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                ->where('is_verified','=',$request->get('is_verified'))
                ->orderBy('id', 'DESC')
                ->get();
                $count = Bencana::where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                ->where('is_verified','=',$request->get('is_verified'))
                ->orderBy('id', 'DESC')
                ->get()->count();
            }
            if ($request->filled(['instansi_id', 'is_verified'])) {
                $bencana = Bencana::where('instansi_id', '=', $request->get('instansi_id'))
                    ->where('is_verified', '=', $request->get('is_verified'))
                    ->orderBy('id', 'DESC')
                    ->get();
                $count = Bencana::where('instansi_id', '=', $request->get('instansi_id'))
                    ->where('is_verified', '=', $request->get('is_verified'))
                    ->orderBy('id', 'DESC')
                    ->get()->count();
            }
        }

            return response(['data' => $bencana, 'total' => $count], 200);

       
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function createBencana(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'instansi_id' => 'required',
            'kelurahan' => 'string|required',
            'jmlh_kk' => 'numeric',
            'jmlh_jiwa' => 'numeric',
            'rumah_rusak_berat' => 'numeric',
            'rumah_rusak_sedang' => 'numeric',
            'rumah_rusak_ringan' => 'numeric',
            'kantor_rusak_berat' => 'numeric',
            'kantor_rusak_sedang' => 'numeric',
            'kantor_rusak_ringan' => 'numeric',
            'pendidikan_rusak_berat' => 'numeric',
            'pendidikan_rusak_sedang' => 'numeric',
            'pendidikan_rusak_ringan' => 'numeric',
            'ibadah_rusak_berat' => 'numeric',
            'ibadah_rusak_sedang' => 'numeric',
            'ibadah_rusak_ringan' => 'numeric',
            'jembatan_rusak_berat' => 'numeric',
            'jembatan_rusak_sedang' => 'numeric',
            'jembatan_rusak_ringan' => 'numeric',
            'lainnya_rusak_berat' => 'numeric',
            'lainnya_rusak_sedang' => 'numeric',
            'lainnya_rusak_ringan' => 'numeric',
            'korban_menderita' => 'numeric',
            'korban_luka' => 'numeric',
            'korban_meninggal' => 'numeric', 
        ]);
        $valid = Validator::make($request->all(), [
            'periode' =>  'required|unique_with:db_bencana_alam, kelurahan'
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()->all()], 422);
        }
        if ($valid->fails()) {
            return response()->json(['errors' => $valid->errors()->all()], 400);
        }

        Bencana::create($request->all());
        $response = ["message" => "Data berhasil disimpan"];
        return response($response, 201);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Bencana  $bencana
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $bencana = Bencana::find($id);
        return response(['data' => $bencana], 200);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Bencana  $bencana
     * @return \Illuminate\Http\Response
     */
    public function edit(Bencana $bencana)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Bencana  $bencana
     * @return \Illuminate\Http\Response
     */
    public function updateBencana(Request $request, $id)
    {
        $bencana = Bencana::find($id);
        $bencana->instansi_id = $request->input('instansi_id');
        $bencana->kelurahan = $request->input('kelurahan');
        $bencana->jmlh_kk = $request->input('jmlh_kk');
        $bencana->jmlh_jiwa = $request->input('jmlh_jiwa');
        $bencana->rumah_rusak_berat = $request->input('rumah_rusak_berat');
        $bencana->rumah_rusak_sedang = $request->input('rumah_rusak_sedang');
        $bencana->rumah_rusak_ringan = $request->input('rumah_rusak_ringan');
        $bencana->kantor_rusak_berat = $request->input('kantor_rusak_berat');
        $bencana->kantor_rusak_sedang = $request->input('kantor_rusak_sedang');
        $bencana->kantor_rusak_ringan = $request->input('kantor_rusak_ringan');
        $bencana->pendidikan_rusak_berat = $request->input('pendidikan_rusak_berat');
        $bencana->pendidikan_rusak_sedang = $request->input('pendidikan_rusak_sedang');
        $bencana->pendidikan_rusak_ringan = $request->input('pendidikan_rusak_ringan');
        $bencana->ibadah_rusak_berat = $request->input('ibadah_rusak_berat');
        $bencana->ibadah_rusak_sedang = $request->input('ibadah_rusak_sedang');
        $bencana->ibadah_rusak_ringan = $request->input('ibadah_rusak_ringan');
        $bencana->jembatan_rusak_berat = $request->input('jembatan_rusak_berat');
        $bencana->jembatan_rusak_sedang = $request->input('jembatan_rusak_sedang');
        $bencana->jembatan_rusak_ringan = $request->input('jembatan_rusak_ringan');
        $bencana->lainnya_rusak_berat = $request->input('lainnya_rusak_berat');
        $bencana->lainnya_rusak_sedang = $request->input('lainnya_rusak_sedang');
        $bencana->lainnya_rusak_ringan = $request->input('lainnya_rusak_ringan');
        $bencana->korban_menderita = $request->input('korban_menderita');
        $bencana->korban_luka = $request->input('korban_luka');
        $bencana->korban_meninggal = $request->input('korban_meninggal');
        $bencana->kerugian = $request->input('kerugian');
        $bencana->periode = $request->input('periode');
        $bencana->is_verified = $request->input('is_verified');

        $bencana->save();
        $response = ["message"=>"Data Berhasil Diubah"];

        return response()->json($response);
    }

    public function validasiBencana(Request $request, $id)
    {
        $bencana = Bencana::find($id);
        $bencana->is_verified = $request->input('is_verified');
        $bencana->save();
        $response = ["message"=>"Data Berhasil diverifikasi"];

        return response()->json($response);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Bencana  $bencana
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        return Bencana::destroy($id);
    }

    public function export(Request $request)
    {
        if ($request->filled('instansi_id', 'periode')) {

            $bencana = DB::table('db_bencana_alam')
                ->select('kelurahan', DB::raw("DATE_FORMAT(db_bencana_alam.periode, '%b-%Y') as periode"), 
                'jmlh_kk','jmlh_jiwa','rumah_rusak_berat','rumah_rusak_sedang','rumah_rusak_ringan','kantor_rusak_berat',
                'kantor_rusak_sedang','kantor_rusak_ringan','pendidikan_rusak_berat','pendidikan_rusak_sedang','pendidikan_rusak_ringan',
                'ibadah_rusak_berat','ibadah_rusak_sedang','ibadah_rusak_ringan','jembatan_rusak_berat','jembatan_rusak_sedang',
                'jembatan_rusak_ringan','lainnya_rusak_berat','lainnya_rusak_sedang','lainnya_rusak_ringan','korban_menderita','korban_luka', 'korban_meninggal',
                'kerugian')
                ->where('instansi_id', '=', $request->get('instansi_id'))
                ->where('periode', '=', $request->get('periode'))
                ->where('is_verified','=','1')
                ->orderBy('id', 'DESC')
                ->get();
            $count = DB::table('db_bencana_alam')
                ->select(
                    DB::raw('SUM(jmlh_kk) AS total_kk'),
                    DB::raw('SUM(jmlh_jiwa) AS total_jiwa'),
                    DB::raw('SUM(rumah_rusak_berat) AS total_rumah_rusak_berat'),
                    DB::raw('SUM(rumah_rusak_sedang) AS total_rumah_rusak_sedang'),
                    DB::raw('SUM(rumah_rusak_ringan) AS total_rumah_rusak_ringan'),
                    DB::raw('SUM(kantor_rusak_berat) AS total_kantor_rusak_berat'),
                    DB::raw('SUM(kantor_rusak_sedang) AS total_kantor_rusak_sedang'),
                    DB::raw('SUM(kantor_rusak_ringan) AS total_kantor_rusak_ringan'),
                    DB::raw('SUM(pendidikan_rusak_berat) AS total_pendidikan_rusak_berat'),
                    DB::raw('SUM(pendidikan_rusak_sedang) AS total_pendidikan_rusak_sedang'),
                    DB::raw('SUM(pendidikan_rusak_ringan) AS total_pendidikan_rusak_ringan'),
                    DB::raw('SUM(ibadah_rusak_berat) AS total_ibadah_rusak_berat'),
                    DB::raw('SUM(ibadah_rusak_sedang) AS total_ibadah_rusak_sedang'),
                    DB::raw('SUM(ibadah_rusak_ringan) AS total_ibadah_rusak_ringan'),
                    DB::raw('SUM(jembatan_rusak_berat) AS total_jembatan_rusak_berat'),
                    DB::raw('SUM(jembatan_rusak_sedang) AS total_jembatan_rusak_sedang'),
                    DB::raw('SUM(jembatan_rusak_ringan) AS total_jembatan_rusak_ringan'),
                    DB::raw('SUM(lainnya_rusak_berat) AS total_lainnya_rusak_berat'),
                    DB::raw('SUM(lainnya_rusak_sedang) AS total_lainnya_rusak_sedang'),
                    DB::raw('SUM(lainnya_rusak_ringan) AS total_lainnya_rusak_ringan'),
                    DB::raw('SUM(korban_menderita) AS total_korban_menderita'),
                    DB::raw('SUM(korban_luka) AS total_korban_luka'),
                    DB::raw('SUM(korban_meninggal) AS total_korban_meninggal'),
                    DB::raw('SUM(kerugian) AS total_kerugian')
                    )
                ->where('instansi_id', '=', $request->get('instansi_id'))
                ->where('periode', '=', $request->get('periode'))
                ->where('is_verified','=','1')
                ->orderBy('id', 'DESC')
                ->get();
            $periode = DB::table('db_bencana_alam')
                ->select(
                    DB::raw("DATE_FORMAT(periode, '%Y') as tahun"),
                    DB::raw("DATE_FORMAT(periode, '%m') as bulan"),
                    DB::raw("DATE_FORMAT(periode, '%b_%Y') as periode")
                )
                ->where('instansi_id', '=', $request->get('instansi_id'))
                ->where('periode', '=', $request->get('periode'))
                ->where('is_verified','=','1')
                ->orderBy('id', 'DESC')
                ->take(1)
                ->get();
            $instansi = Bencana::select('db_bencana_alam.instansi_id','instansi.nama_instansi')
                ->leftJoin('instansi','instansi.id','db_bencana_alam.instansi_id')
                ->where('db_bencana_alam.is_verified','=','1')
                ->take(1)
                ->get();

                foreach ($instansi as $kecamatan){

                    foreach ($periode as $per) {
                        
                        $pdf = PDF::loadView('reportBencana', ['bencana' => $bencana, 'count' => $count, 'periode' => $periode,'kecamatan' => $instansi])->setPaper([0, 0, 600, 1500], 'landscape');
                        return $pdf->stream('Laporan_Bencana_Alam_' . $kecamatan->nama_instansi . '_' . $per->periode . '.pdf');
                    }
                }               
        }
        if (!$request->filled('instansi_id')) {
            $response = ["message" => 'Harap Pilih Instansi Terlebih Dahulu'];
            return response($response, 400);
        }
        if (!$request->filled('periode')) {
            $response = ["message" => 'Harap Pilih Periode Terlebih Dahulu'];
            return response($response, 400);
        }
    }
}
