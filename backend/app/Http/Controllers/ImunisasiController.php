<?php

namespace App\Http\Controllers;

use App\Imunisasi;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;
use PDF;

class ImunisasiController extends Controller
{
    public function index(Request $request)
    {
        $instansi_id = $request->input('instansi_id');
        $kelurahan = $request->input('kelurahan');
        $periode = $request->input('periode');
        $is_verified = $request->input('is_verified');


        $imunisasi = Imunisasi::query();
        if (!$request->except('page')) {
            $imunisasi = Imunisasi::select('instansi.nama_instansi','db_imunisasi.*')
                    ->leftJoin('instansi','instansi.id','=','db_imunisasi.instansi_id')
                    ->orderBy('periode', 'DESC')
                    ->orderBy('is_verified', 'DESC')
                    ->paginate(10);
            $count = Imunisasi::select()->get()->count();
        } else {
             $imunisasi = Imunisasi::select('instansi.nama_instansi','db_imunisasi.*')
                    ->leftJoin('instansi','instansi.id','=','db_imunisasi.instansi_id')
                    ->when($instansi_id, function ($query, $instansi_id) {
                        return $query->where('instansi_id',$instansi_id);
                    })
                    ->when($kelurahan, function ($query, $kelurahan) {
                        return $query->where('kelurahan', $kelurahan);
                    })
                    ->when($periode, function ($query, $periode) {
                        return $query->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), $periode);
                    })
                    ->when($is_verified, function ($query, $is_verified) {
                        return $query->where('is_verified', $is_verified);
                    })
                    ->orderBy('periode', 'DESC')
                    ->orderBy('is_verified', 'ASC')
                    ->paginate(10);
            $count = Imunisasi::when($instansi_id, function ($query, $instansi_id) {
                        return $query->where('instansi_id',$instansi_id);
                    })
                    ->when($kelurahan, function ($query, $kelurahan) {
                        return $query->where('kelurahan', $kelurahan);
                    })
                    ->when($periode, function ($query, $periode) {
                        return $query->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), $periode);
                    })
                    ->when($is_verified, function ($query, $is_verified) {
                        return $query->where('is_verified', $is_verified);
                    })
                    ->get()->count();
        }
        return response(['data' => $imunisasi, 'total' => $count], 200);
    }

    public function indexCamat(Request $request)
    { 
        $instansi_id = $request->input('instansi_id');
        $kelurahan = $request->input('kelurahan');
        $periode = $request->input('periode');
        $is_verified = $request->input('is_verified');

        $imunisasi = Imunisasi::query();
        if (!$request->except('page')) {
            $imunisasi = Imunisasi::select('instansi.nama_instansi','db_imunisasi.*')
                    ->leftJoin('instansi','instansi.id','=','db_imunisasi.instansi_id')
                    ->where('is_verified','!=', 3)
                    ->orderBy('periode', 'DESC')
                    ->paginate(10);
            $count = Imunisasi::select()
                    ->where('is_verified','!=', 3)
                    ->get()
                    ->count();
        } else {
            $imunisasi = Imunisasi::select('instansi.nama_instansi','db_imunisasi.*')
                    ->leftJoin('instansi','instansi.id','=','db_imunisasi.instansi_id')
                    ->when($instansi_id, function ($query, $instansi_id) {
                        return $query->where('instansi_id',$instansi_id)
                        ->where('is_verified','!=',3);
                    })
                    ->when($kelurahan, function ($query, $kelurahan) {
                        return $query->where('kelurahan',$kelurahan)
                        ->where('is_verified','!=',3);
                    })
                    ->when($periode, function ($query, $periode) {
                        return $query->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"),$periode)
                        ->where('is_verified','!=',3);
                    })
                    ->when($is_verified, function ($query, $is_verified) {
                        return $query->where('is_verified', $is_verified);
                    })
                    ->orderBy('periode', 'DESC')
                    ->paginate(10);
            $count = Imunisasi::when($instansi_id, function ($query, $instansi_id) {
                        return $query->where('instansi_id',$instansi_id)
                        ->where('is_verified','!=',3);
                    })
                    ->when($kelurahan, function ($query, $kelurahan) {
                        return $query->where('kelurahan', $kelurahan)
                        ->where('is_verified','!=',3);
                    })
                    ->when($periode, function ($query, $periode) {
                        return $query->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), $periode)
                        ->where('is_verified','!=',3);
                    })
                    ->when($is_verified, function ($query, $is_verified) {
                        return $query->where('is_verified', $is_verified);
                    })
                    ->get()->count();
            // if ($request->filled('instansi_id')) {
            //     $imunisasi = Imunisasi::where('instansi_id', '=', $request->get('instansi_id'))
            //         ->where('is_verified','!=', 2)
            //         ->orderBy('id', 'DESC')
            //         ->get();
            //     $count = Imunisasi::where('instansi_id', '=', $request->get('instansi_id'))
            //         ->where('is_verified','!=', 2)
            //         ->get()->count();
            // }
            // if ($request->filled(['instansi_id', 'periode','is_verified'])) {
            //     $imunisasi = Imunisasi::where('instansi_id', '=', $request->get('instansi_id'))
            //         ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
            //         ->where('is_verified','=',$request->get('is_verified'))
            //         ->orderBy('id', 'DESC')
            //         ->get();
            //     $count = Imunisasi::where('instansi_id', '=', $request->get('instansi_id'))
            //         ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
            //         ->where('is_verified','=',$request->get('is_verified'))
            //         ->orderBy('id', 'DESC')
            //         ->get()->count();
            // }
            // if ($request->filled(['instansi_id', 'periode'])) {
            //     $imunisasi = Imunisasi::where('instansi_id', '=', $request->get('instansi_id'))
            //         ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
            //         ->where('is_verified','!=', 2)
            //         ->orderBy('id', 'DESC')
            //         ->get();
            //     $count = Imunisasi::where('instansi_id', '=', $request->get('instansi_id'))
            //         ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
            //         ->where('is_verified','!=', 2)
            //         ->orderBy('id', 'DESC')
            //         ->get()->count();
            // }
            // if ($request->filled(['periode','is_verified'])) {
            //     $imunisasi = Imunisasi::where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
            //     ->where('is_verified','=',$request->get('is_verified'))
            //     ->orderBy('id', 'DESC')
            //     ->get();
            //     $count = Imunisasi::where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
            //     ->where('is_verified','=',$request->get('is_verified'))
            //     ->orderBy('id', 'DESC')
            //     ->get()->count();
            // }
            // if ($request->filled(['instansi_id', 'is_verified'])) {
            //     $imunisasi = Imunisasi::where('instansi_id', '=', $request->get('instansi_id'))
            //         ->where('is_verified', '=', $request->get('is_verified'))
            //         ->orderBy('id', 'DESC')
            //         ->get();
            //     $count = Imunisasi::where('instansi_id', '=', $request->get('instansi_id'))
            //         ->where('is_verified', '=', $request->get('is_verified'))
            //         ->orderBy('id', 'DESC')
            //         ->get()->count();
            // }
        }

            return response(['data' => $imunisasi, 'total' => $count], 200);

       
    }

    public function createImunisasi(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'instansi_id' => 'required',
            
        ]);
        $valid = Validator::make($request->all(), [
            'periode' =>  'unique_with:db_imunisasi, kelurahan'
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()->all()], 422);
        }
        if ($valid->fails()) {
            return response()->json(['errors' => $valid->errors()->all()], 400);
        }

        Imunisasi::create($request->all());
        $response = ["message" => "Data berhasil disimpan"];
        return response($response, 201);
    }

    public function show($id)
    {
        $imunisasi = Imunisasi::find($id);
        return response(['data' => $imunisasi], 200);
    }

    public function updateImunisasi(Request $request, $id)
    {
       $imunisasi = Imunisasi::find($id);
       $imunisasi->instansi_id = $request->input('instansi_id');
       $imunisasi->kelurahan = $request->input('kelurahan');
       $imunisasi->bcg = $request->input('bcg');
       $imunisasi->dpt_1 = $request->input('dpt_1');
       $imunisasi->dpt_2 = $request->input('dpt_2');
       $imunisasi->dpt_3 = $request->input('dpt_3');
       $imunisasi->polio_1 = $request->input('polio_1');
       $imunisasi->polio_2 = $request->input('polio_2');
       $imunisasi->polio_3 = $request->input('polio_3');
       $imunisasi->polio_4 = $request->input('polio_4');
       $imunisasi->cmp = $request->input('cmp');
       $imunisasi->ibu_hamil_1 = $request->input('ibu_hamil_1');
       $imunisasi->ibu_hamil_2 = $request->input('ibu_hamil_2');
       $imunisasi->anak_sd_1 = $request->input('anak_sd_1');
       $imunisasi->anak_sd_2 = $request->input('anak_sd_2');
       $imunisasi->cp_1 = $request->input('cp_1');
       $imunisasi->cp_2 = $request->input('cp_2');
       $imunisasi->keterangan = $request->input('keterangan');
       $imunisasi->periode = $request->input('periode');
       $imunisasi->is_verified = $request->input('is_verified');

       $imunisasi->save();
       $response = ["message"=>"Data Berhasil Diubah"];

        return response()->json($response);
    }

    public function validasiImunisasi(Request $request, $id)
    {
        $imunisasi = Imunisasi::find($id);
        $imunisasi->is_verified = $request->input('is_verified');
        $imunisasi->save();
        $response = ["message"=>"Data Berhasil diverifikasi"];

        return response()->json($response);
    }

    public function destroy($id)
    {
        return Imunisasi::destroy($id);
    }

    public function export(Request $request)
    {
        if ($request->filled('instansi_id', 'periode','kelurahan')) {

            $imunisasi = DB::table('db_imunisasi')
                ->select('kelurahan', DB::raw("DATE_FORMAT(db_imunisasi.periode, '%b-%Y') as periode"), 
                'bcg','dpt_1','dpt_2','dpt_3', 'polio_1','polio_2','polio_3','polio_4', 
                'cmp','ibu_hamil_1','ibu_hamil_2', 'anak_sd_1','anak_sd_2','cp_1','cp_2', 'keterangan')
                ->where('instansi_id', '=', $request->get('instansi_id'))
                ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                ->where('kelurahan','=', $request->get('kelurahan'))
                ->where('is_verified','=',2)
                ->orderBy('id', 'DESC')
                ->get();
            $count = DB::table('db_imunisasi')
                ->select(
                    DB::raw('SUM(bcg) AS total_bcg'),
                    DB::raw('SUM(dpt_1) AS total_dpt_1'),
                    DB::raw('SUM(dpt_2) AS total_dpt_2'),
                    DB::raw('SUM(dpt_3) AS total_dpt_3'),
                    DB::raw('SUM(polio_1) AS total_polio_1'),
                    DB::raw('SUM(polio_2) AS total_polio_2'),
                    DB::raw('SUM(polio_3) AS total_polio_3'),
                    DB::raw('SUM(polio_4) AS total_polio_4'),
                    DB::raw('SUM(cmp) AS total_cmp'),
                    DB::raw('SUM(ibu_hamil_1) AS total_ibu_hamil_1'),
                    DB::raw('SUM(ibu_hamil_2) AS total_ibu_hamil_2'),
                    DB::raw('SUM(anak_sd_1) AS total_anak_sd_1'),
                    DB::raw('SUM(anak_sd_2) AS total_anak_sd_2'),
                    DB::raw('SUM(cp_1) AS total_cp_1'),
                    DB::raw('SUM(cp_2) AS total_cp_2'),
                )
                ->where('instansi_id', '=', $request->get('instansi_id'))
                ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                ->where('kelurahan','=', $request->get('kelurahan'))
                ->where('is_verified','=',2)
                ->orderBy('id', 'DESC')
                ->get();
            $periode = DB::table('db_imunisasi')
                ->select('periode')
                ->where('instansi_id', '=', $request->get('instansi_id'))
                ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                ->where('kelurahan','=', $request->get('kelurahan'))
                ->where('is_verified','=',2)
                ->orderBy('id', 'DESC')
                ->take(1)
                ->get();
            $instansi = DB::table('db_imunisasi')
                ->select('db_imunisasi.instansi_id','instansi.nama_instansi')
                ->leftJoin('instansi','instansi.id','db_imunisasi.instansi_id')
                ->where('instansi_id', '=', $request->get('instansi_id'))
                ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                ->where('kelurahan','=', $request->get('kelurahan'))
                ->where('is_verified','=',2)
                ->take(1)
                ->get();

                foreach ($instansi as $kecamatan){

                    foreach ($periode as $per) {
                        
                        $pdf = PDF::loadView('reportImunisasi', ['imunisasi' => $imunisasi, 'count' => $count, 'periode' => $periode,'kecamatan' => $instansi])->setPaper([0, 0, 600, 1500], 'landscape');
                        return $pdf->stream('Laporan_Imunisasi_' . $kecamatan->nama_instansi . '_' . $per->periode . '.pdf');
                    }
                }               
        }
        if ($request->filled('instansi_id', 'periode')) {

            $imunisasi = DB::table('db_imunisasi')
                ->select('kelurahan', DB::raw("DATE_FORMAT(db_imunisasi.periode, '%b-%Y') as periode"), 
                'bcg','dpt_1','dpt_2','dpt_3', 'polio_1','polio_2','polio_3','polio_4', 
                'cmp','ibu_hamil_1','ibu_hamil_2', 'anak_sd_1','anak_sd_2','cp_1','cp_2', 'keterangan')
                ->where('instansi_id', '=', $request->get('instansi_id'))
                ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                ->where('is_verified','=',2)
                ->orderBy('id', 'DESC')
                ->get();
            $count = DB::table('db_imunisasi')
                ->select(
                    DB::raw('SUM(bcg) AS total_bcg'),
                    DB::raw('SUM(dpt_1) AS total_dpt_1'),
                    DB::raw('SUM(dpt_2) AS total_dpt_2'),
                    DB::raw('SUM(dpt_3) AS total_dpt_3'),
                    DB::raw('SUM(polio_1) AS total_polio_1'),
                    DB::raw('SUM(polio_2) AS total_polio_2'),
                    DB::raw('SUM(polio_3) AS total_polio_3'),
                    DB::raw('SUM(polio_4) AS total_polio_4'),
                    DB::raw('SUM(cmp) AS total_cmp'),
                    DB::raw('SUM(ibu_hamil_1) AS total_ibu_hamil_1'),
                    DB::raw('SUM(ibu_hamil_2) AS total_ibu_hamil_2'),
                    DB::raw('SUM(anak_sd_1) AS total_anak_sd_1'),
                    DB::raw('SUM(anak_sd_2) AS total_anak_sd_2'),
                    DB::raw('SUM(cp_1) AS total_cp_1'),
                    DB::raw('SUM(cp_2) AS total_cp_2'),
                )
                ->where('instansi_id', '=', $request->get('instansi_id'))
                ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                ->where('is_verified','=',2)
                ->orderBy('id', 'DESC')
                ->get();
            $periode = DB::table('db_imunisasi')
                ->select('periode')
                ->where('instansi_id', '=', $request->get('instansi_id'))
                ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                ->where('is_verified','=',2)
                ->orderBy('id', 'DESC')
                ->take(1)
                ->get();
            $instansi = DB::table('db_imunisasi')
                ->select('db_imunisasi.instansi_id','instansi.nama_instansi')
                ->leftJoin('instansi','instansi.id','db_imunisasi.instansi_id')
                ->where('instansi_id', '=', $request->get('instansi_id'))
                ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                ->where('is_verified','=',2)
                ->take(1)
                ->get();

                foreach ($instansi as $kecamatan){

                    foreach ($periode as $per) {
                        
                        $pdf = PDF::loadView('reportImunisasi', ['imunisasi' => $imunisasi, 'count' => $count, 'periode' => $periode,'kecamatan' => $instansi])->setPaper([0, 0, 600, 1500], 'landscape');
                        return $pdf->stream('Laporan_Imunisasi_' . $kecamatan->nama_instansi . '_' . $per->periode . '.pdf');
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
