<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Paten;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use PDF;

class PatenController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $instansi_id = $request->input('instansi_id');
        $kelurahan = $request->input('kelurahan');
        $periode = $request->input('periode');
        $is_verified = $request->input('is_verified');


         $paten = Paten::query();
        if (!$request->except('page')) {
            $paten = Paten::select('instansi.nama_instansi','db_rekapitulasi_paten.*')
                    ->leftJoin('instansi','instansi.id','=','db_rekapitulasi_paten.instansi_id')
                    ->orderBy('periode', 'DESC')
                    ->paginate(10);
            $count = Paten::select()->get()->count();
        } else {
             $paten = Paten::select('instansi.nama_instansi','db_rekapitulasi_paten.*')
                    ->leftJoin('instansi','instansi.id','=','db_rekapitulasi_paten.instansi_id')
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
                    ->paginate(10);
            $count = Paten::when($instansi_id, function ($query, $instansi_id) {
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
        return response(['data' => $paten, 'total' => $count], 200);
    }
    
    public function indexCamat(Request $request)
    { 
        $instansi_id = $request->input('instansi_id');
        $kelurahan = $request->input('kelurahan');
        $periode = $request->input('periode');
        $is_verified = $request->input('is_verified');

        $paten = Paten::query();
        if (!$request->except('page')) {
            $paten = Paten::select('instansi.nama_instansi','db_rekapitulasi_paten.*')
                    ->leftJoin('instansi','instansi.id','=','db_rekapitulasi_paten.instansi_id')
                    ->where('is_verified','!=', 3)
                    ->orderBy('periode', 'DESC')
                    ->paginate(10);
            $count = Paten::select()
                    ->where('is_verified','!=', 3)
                    ->get()
                    ->count();
        } else {
            $paten = Paten::select('instansi.nama_instansi','db_rekapitulasi_paten.*')
                    ->leftJoin('instansi','instansi.id','=','db_rekapitulasi_paten.instansi_id')
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
            $count = Paten::when($instansi_id, function ($query, $instansi_id) {
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
            //     $paten = Paten::where('instansi_id', '=', $request->get('instansi_id'))
            //         ->where('is_verified','!=', 2)
            //         ->orderBy('id', 'DESC')
            //         ->get();
            //     $count = Paten::where('instansi_id', '=', $request->get('instansi_id'))
            //         ->where('is_verified','!=', 2)
            //         ->get()->count();
            // }
            // if ($request->filled(['instansi_id', 'periode','is_verified'])) {
            //     $paten = Paten::where('instansi_id', '=', $request->get('instansi_id'))
            //         ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
            //         ->where('is_verified','=',$request->get('is_verified'))
            //         ->orderBy('id', 'DESC')
            //         ->get();
            //     $count = Paten::where('instansi_id', '=', $request->get('instansi_id'))
            //         ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
            //         ->where('is_verified','=',$request->get('is_verified'))
            //         ->orderBy('id', 'DESC')
            //         ->get()->count();
            // }
            // if ($request->filled(['instansi_id', 'periode'])) {
            //     $paten = Paten::where('instansi_id', '=', $request->get('instansi_id'))
            //         ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
            //         ->where('is_verified','!=', 2)
            //         ->orderBy('id', 'DESC')
            //         ->get();
            //     $count = Paten::where('instansi_id', '=', $request->get('instansi_id'))
            //         ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
            //         ->where('is_verified','!=', 2)
            //         ->orderBy('id', 'DESC')
            //         ->get()->count();
            // }
            // if ($request->filled(['periode','is_verified'])) {
            //     $paten = Paten::where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
            //     ->where('is_verified','=',$request->get('is_verified'))
            //     ->orderBy('id', 'DESC')
            //     ->get();
            //     $count = Paten::where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
            //     ->where('is_verified','=',$request->get('is_verified'))
            //     ->orderBy('id', 'DESC')
            //     ->get()->count();
            // }
            // if ($request->filled(['instansi_id', 'is_verified'])) {
            //     $paten = Paten::where('instansi_id', '=', $request->get('instansi_id'))
            //         ->where('is_verified', '=', $request->get('is_verified'))
            //         ->orderBy('id', 'DESC')
            //         ->get();
            //     $count = Paten::where('instansi_id', '=', $request->get('instansi_id'))
            //         ->where('is_verified', '=', $request->get('is_verified'))
            //         ->orderBy('id', 'DESC')
            //         ->get()->count();
            // }
        }

            return response(['data' => $paten, 'total' => $count], 200);

       
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function createPaten(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'instansi_id' => 'required',
        ]);
        $valid = Validator::make($request->all(), [
            'periode' =>  'unique_with:db_rekapitulasi_paten, kelurahan'
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()->all()], 422);
        }
        if ($valid->fails()) {
            return response()->json(['errors' => $valid->errors()->all()], 400);
        }

        Paten::create($request->all());
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
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $paten = Paten::find($id);
        return response(['message' => 'Success', 'data' => $paten], 200);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function updatePaten(Request $request, $id)
    {
        $paten = Paten::find($id);
        $paten->instansi_id = $request->input('instansi_id');
        $paten->kelurahan = $request->input('kelurahan');
        $paten->perekaman_ktp = $request->input('perekaman_ktp');
        $paten->pengantar_kk = $request->input('pengantar_kk');
        $paten->ket_pindah = $request->input('ket_pindah');
        $paten->ket_domisili = $request->input('ket_domisili');
        $paten->pengantar_akta_lahir = $request->input('pengantar_akta_lahir');
        $paten->pengantar_akta_mati = $request->input('pengantar_akta_mati');
        $paten->pencatatan_perkawinan = $request->input('pencatatan_perkawinan');
        $paten->pencatatan_perceraian = $request->input('pencatatan_perceraian');
        $paten->skck = $request->input('skck');
        $paten->sktm = $request->input('sktm');
        $paten->rekomendasi = $request->input('rekomendasi');
        $paten->legalisasi = $request->input('legalisasi');
        $paten->ket_lain = $request->input('ket_lain');
        $paten->imb = $request->input('imb');
        $paten->situ_siup = $request->input('situ_siup');
        $paten->izin_merobohkan_bangunan = $request->input('izin_merobohkan_bangunan');
        $paten->izin_keramaian = $request->input('izin_keramaian');
        $paten->izin_partai = $request->input('izin_partai');
        $paten->keterangan = $request->input('keterangan');
        $paten->periode = $request->input('periode');
        $paten->is_verified = $request->input('is_verified');

        $paten->save();
        $response = ["message"=>"Data Berhasil Diubah"];

        return response()->json($response);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function validasiPaten(Request $request, $id)
    {
        $paten = Paten::find($id);
        $paten->is_verified = $request->input('is_verified');
        $paten->save();
        $response = ["message"=>"Data Berhasil diverifikasi"];

        return response()->json($response);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        return Paten::destroy($id);
    }

    public function export(Request $request)
    {
        if ($request->filled('instansi_id', 'periode','kelurahan')) {

            $paten = DB::table('db_rekapitulasi_paten')
                ->select('kelurahan', DB::raw("DATE_FORMAT(db_rekapitulasi_paten.periode, '%b-%Y') as periode"), 
                'perekaman_ktp',
                'pengantar_kk', 'ket_pindah','ket_domisili',
                'pengantar_akta_lahir','pengantar_akta_mati',
                'pencatatan_perkawinan','pencatatan_perceraian',
                'skck','sktm','rekomendasi','legalisasi','ket_lain',
                'imb','situ_siup','izin_merobohkan_bangunan',
                'izin_keramaian','izin_partai','keterangan')
                ->where('instansi_id', '=', $request->get('instansi_id'))
                ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                ->where('kelurahan','=', $request->get('kelurahan'))
                ->where('is_verified','=',2)
                ->orderBy('id', 'DESC')
                ->get();
            $count = DB::table('db_rekapitulasi_paten')
                ->select(
                    DB::raw('SUM(perekaman_ktp) AS total_perekaman_ktp'),
                    DB::raw('SUM(pengantar_kk) AS total_pengantar_kk'),
                    DB::raw('SUM(ket_pindah) AS total_ket_pindah'),
                    DB::raw('SUM(ket_domisili) AS total_ket_domisili'),
                    DB::raw('SUM(pengantar_akta_lahir) AS total_pengantar_akta_lahir'),
                    DB::raw('SUM(pengantar_akta_mati) AS total_pengantar_akta_mati'),
                    DB::raw('SUM(pencatatan_perkawinan) AS total_pencatatan_perkawinan'),
                    DB::raw('SUM(pencatatan_perceraian) AS total_pencatatan_perceraian'),
                    DB::raw('SUM(skck) AS total_skck'),
                    DB::raw('SUM(sktm) AS total_sktm'),
                    DB::raw('SUM(rekomendasi) AS total_rekomendasi'),
                    DB::raw('SUM(legalisasi) AS total_legalisasi'),
                    DB::raw('SUM(ket_lain) AS total_ket_lain'),
                    DB::raw('SUM(imb) AS total_imb'),
                    DB::raw('SUM(situ_siup) AS total_situ_siup'),
                    DB::raw('SUM(izin_merobohkan_bangunan) AS total_izin_merobohkan_bangunan'),
                    DB::raw('SUM(izin_keramaian) AS total_izin_keramaian'),
                    DB::raw('SUM(izin_partai) AS total_izin_partai')
                    )
                ->where('instansi_id', '=', $request->get('instansi_id'))
                ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                ->where('kelurahan','=', $request->get('kelurahan'))
                ->where('is_verified','=',2)
                ->orderBy('id', 'DESC')
                ->get();
            $periode = DB::table('db_rekapitulasi_paten')
                ->select('periode')
                ->where('instansi_id', '=', $request->get('instansi_id'))
                ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                ->where('kelurahan','=', $request->get('kelurahan'))
                ->where('is_verified','=',2)
                ->orderBy('id', 'DESC')
                ->take(1)
                ->get();
            $instansi = DB::table('db_rekapitulasi_paten')
                ->select('db_rekapitulasi_paten.instansi_id','instansi.nama_instansi')
                ->leftJoin('instansi','instansi.id','db_rekapitulasi_paten.instansi_id')
                ->where('instansi_id', '=', $request->get('instansi_id'))
                ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                ->where('kelurahan','=', $request->get('kelurahan'))
                ->where('is_verified','=',2)
                ->take(1)
                ->get();

                foreach ($instansi as $kecamatan){

                    foreach ($periode as $per) {
                        
                        $pdf = PDF::loadView('reportPaten', ['paten' => $paten, 'count' => $count, 'periode' => $periode,'kecamatan' => $instansi])->setPaper([0, 0, 700, 1200], 'landscape');
                        return $pdf->stream('Laporan_PATEN_' . $kecamatan->nama_instansi . '_' . $per->periode . '.pdf');
                    }
                }               
        }
        if ($request->filled('instansi_id','periode')) {
            $paten = DB::table('db_rekapitulasi_paten')
                ->select('kelurahan', DB::raw("DATE_FORMAT(db_rekapitulasi_paten.periode, '%b-%Y') as periode"), 
                'perekaman_ktp',
                'pengantar_kk', 'ket_pindah','ket_domisili',
                'pengantar_akta_lahir','pengantar_akta_mati',
                'pencatatan_perkawinan','pencatatan_perceraian',
                'skck','sktm','rekomendasi','legalisasi','ket_lain',
                'imb','situ_siup','izin_merobohkan_bangunan',
                'izin_keramaian','izin_partai','keterangan')
                ->where('instansi_id', '=', $request->get('instansi_id'))
                ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                ->where('is_verified','=',2)
                ->orderBy('id', 'DESC')
                ->get();
            $count = DB::table('db_rekapitulasi_paten')
                ->select(
                    DB::raw('SUM(perekaman_ktp) AS total_perekaman_ktp'),
                    DB::raw('SUM(pengantar_kk) AS total_pengantar_kk'),
                    DB::raw('SUM(ket_pindah) AS total_ket_pindah'),
                    DB::raw('SUM(ket_domisili) AS total_ket_domisili'),
                    DB::raw('SUM(pengantar_akta_lahir) AS total_pengantar_akta_lahir'),
                    DB::raw('SUM(pengantar_akta_mati) AS total_pengantar_akta_mati'),
                    DB::raw('SUM(pencatatan_perkawinan) AS total_pencatatan_perkawinan'),
                    DB::raw('SUM(pencatatan_perceraian) AS total_pencatatan_perceraian'),
                    DB::raw('SUM(skck) AS total_skck'),
                    DB::raw('SUM(sktm) AS total_sktm'),
                    DB::raw('SUM(rekomendasi) AS total_rekomendasi'),
                    DB::raw('SUM(legalisasi) AS total_legalisasi'),
                    DB::raw('SUM(ket_lain) AS total_ket_lain'),
                    DB::raw('SUM(imb) AS total_imb'),
                    DB::raw('SUM(situ_siup) AS total_situ_siup'),
                    DB::raw('SUM(izin_merobohkan_bangunan) AS total_izin_merobohkan_bangunan'),
                    DB::raw('SUM(izin_keramaian) AS total_izin_keramaian'),
                    DB::raw('SUM(izin_partai) AS total_izin_partai')
                    )
                ->where('instansi_id', '=', $request->get('instansi_id'))
                ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                ->where('is_verified','=',2)
                ->orderBy('id', 'DESC')
                ->get();
            $periode = DB::table('db_rekapitulasi_paten')
                ->select('periode')
                ->where('instansi_id', '=', $request->get('instansi_id'))
                ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                ->where('is_verified','=',2)
                ->orderBy('id', 'DESC')
                ->take(1)
                ->get();
            $instansi = DB::table('db_rekapitulasi_paten')
                ->select('db_rekapitulasi_paten.instansi_id','instansi.nama_instansi')
                ->leftJoin('instansi','instansi.id','db_rekapitulasi_paten.instansi_id')
                ->where('instansi_id', '=', $request->get('instansi_id'))
                ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                ->where('is_verified','=',2)
                ->take(1)
                ->get();

                foreach ($instansi as $kecamatan){

                    foreach ($periode as $per) {
                        
                        $pdf = PDF::loadView('reportPaten', ['paten' => $paten, 'count' => $count, 'periode' => $periode,'kecamatan' => $instansi])->setPaper([0, 0, 700, 1200], 'landscape');
                        return $pdf->stream('Laporan_PATEN_' . $kecamatan->nama_instansi . '_' . $per->periode . '.pdf');
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
