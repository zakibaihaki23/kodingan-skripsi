<?php

namespace App\Http\Controllers;

use App\Exports\KependudukanExportAll;
use Illuminate\Http\Request;
use App\Kependudukan;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Maatwebsite\Excel\Facades\Excel;
use PDF;

class KependudukanController extends Controller
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


        $kependudukan = Kependudukan::query();
        if (!$request->except('page')) {
            $kependudukan = Kependudukan::select('instansi.nama_instansi','db_kependudukan.*')
                    ->leftJoin('instansi','instansi.id','=','db_kependudukan.instansi_id')
                    ->orderBy('periode', 'DESC')
                    ->paginate(10);
            $count = Kependudukan::select()->get()->count();
        } else {
             $kependudukan = Kependudukan::select('instansi.nama_instansi','db_kependudukan.*')
                    ->leftJoin('instansi','instansi.id','=','db_kependudukan.instansi_id')
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
            $count = Kependudukan::when($instansi_id, function ($query, $instansi_id) {
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
        
        return response(['data' => $kependudukan, 'total' => $count], 200);
    }

    public function indexCamat(Request $request)
    {
        $instansi_id = $request->input('instansi_id');
        $kelurahan = $request->input('kelurahan');
        $periode = $request->input('periode');
        $is_verified = $request->input('is_verified');

        $kependudukan = Kependudukan::query();
        if (!$request->except('page')) {
            $kependudukan = Kependudukan::select('instansi.nama_instansi','db_kependudukan.*')
                    ->leftJoin('instansi','instansi.id','=','db_kependudukan.instansi_id')
                    ->where('is_verified','!=', 3)
                    ->orderBy('periode', 'DESC')
                    ->paginate(10);
            $count = Kependudukan::select()
                    ->where('is_verified','!=', 3)
                    ->get()
                    ->count();
        } else {
            $kependudukan = Kependudukan::select('instansi.nama_instansi','db_kependudukan.*')
                    ->leftJoin('instansi','instansi.id','=','db_kependudukan.instansi_id')
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
            $count = Kependudukan::when($instansi_id, function ($query, $instansi_id) {
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
        }

            return response(['data' => $kependudukan, 'total' => $count], 200);

       
    }
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function createKependudukan(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'instansi_id' => 'required',
        ]);
        $valid = Validator::make($request->all(), [
            'periode' =>  'unique_with:db_kependudukan, kelurahan'
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()->all()], 422);
        }
        if ($valid->fails()) {
            return response()->json(['errors' => $valid->errors()->all()], 400);
        }

        DB::table('db_kependudukan')->insert([
            'instansi_id' => $request->input('instansi_id'),
            'kelurahan' => $request->input('kelurahan'),
            'jmlh_penduduk_bln_lalu_l' => $request->input('jmlh_penduduk_bln_lalu_l'),
            'jmlh_penduduk_bln_lalu_p' => $request->input('jmlh_penduduk_bln_lalu_p'),
            'total_penduduk_bln_lalu' => $request->input('jmlh_penduduk_bln_lalu_l') + $request->input('jmlh_penduduk_bln_lalu_p'),
            'lahir_l' => $request->input('lahir_l'),
            'lahir_p' => $request->input('lahir_p'),
            'total_lahir' => $request->input('lahir_l') + $request->input('lahir_p'),
            'meninggal_l' => $request->input('meninggal_l'),
            'meninggal_p' => $request->input('meninggal_p'),
            'total_meninggal' => $request->input('meninggal_l') + $request->input('meninggal_p'),
            'datang_l' => $request->input('datang_l'),
            'datang_p' => $request->input('datang_p'),
            'total_datang' => $request->input('datang_l') + $request->input('datang_p'),
            'pindah_l' => $request->input('pindah_l'),
            'pindah_p' => $request->input('pindah_p'),
            'total_pindah' => $request->input('pindah_l') + $request->input('pindah_p'),
            'jmlh_penduduk_bln_ini_l' => $request->input('jmlh_penduduk_bln_ini_l'),
            'jmlh_penduduk_bln_ini_p' => $request->input('jmlh_penduduk_bln_ini_p'),
            'total_penduduk_bln_ini' => $request->input('jmlh_penduduk_bln_ini_l') + $request->input('jmlh_penduduk_bln_ini_p'),
            'periode' => $request->input('periode')
        ]);
        $response = ["message" => "Data berhasil disimpan"];
        return response($response, 201);
    }

    public function export(Request $request)
    {
        if ($request->filled('instansi_id', 'periode')) {

            $kependudukan = DB::table('db_kependudukan')
                ->where('instansi_id', '=', $request->get('instansi_id'))
                ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                ->where('is_verified','=',2)
                ->orderBy('id', 'DESC')
                ->get();
            $count = DB::table('db_kependudukan')
                ->select(
                    DB::raw('SUM(jmlh_penduduk_bln_lalu_l) as total_penduduk_bln_lalu_l'),
                    DB::raw('SUM(jmlh_penduduk_bln_lalu_p) as total_penduduk_bln_lalu_p'),
                    DB::raw('SUM(total_penduduk_bln_lalu) as total_penduduk_bln_lalu'),
                    DB::raw('SUM(lahir_l) as total_lahir_l'),
                    DB::raw('SUM(lahir_p) as total_lahir_p'),
                    DB::raw('SUM(total_lahir) as total_lahir'),
                    DB::raw('SUM(meninggal_l) as total_meninggal_l'),
                    DB::raw('SUM(meninggal_p) as total_meninggal_p'),
                    DB::raw('SUM(total_meninggal) as total_meninggal'),
                    DB::raw('SUM(datang_l) as total_datang_l'),
                    DB::raw('SUM(datang_p) as total_datang_p'),
                    DB::raw('SUM(total_datang) as total_datang'),
                    DB::raw('SUM(pindah_l) as total_pindah_l'),
                    DB::raw('SUM(pindah_p) as total_pindah_p'),
                    DB::raw('SUM(total_pindah) as total_pindah'),
                    DB::raw('SUM(jmlh_penduduk_bln_ini_l) as total_penduduk_bln_ini_l'),
                    DB::raw('SUM(jmlh_penduduk_bln_ini_p) as total_penduduk_bln_ini_p'),
                    DB::raw('SUM(total_penduduk_bln_ini) as total_penduduk_bln_ini'),


                    
                    )
                ->where('instansi_id', '=', $request->get('instansi_id'))
                ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                ->where('is_verified','=',2)
                ->orderBy('id', 'DESC')
                ->get();
            $periode = DB::table('db_kependudukan')
                ->select('periode')
                ->where('instansi_id', '=', $request->get('instansi_id'))
                ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                ->where('is_verified','=',2)
                ->orderBy('id', 'DESC')
                ->take(1)
                ->get();
            $instansi = DB::table('db_kependudukan')
                ->select('db_kependudukan.instansi_id','instansi.nama_instansi')
                ->leftJoin('instansi','instansi.id','db_kependudukan.instansi_id')
                ->where('instansi_id', '=', $request->get('instansi_id'))
                ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                ->where('is_verified','=',2)
                ->take(1)
                ->get();

                foreach ($instansi as $kecamatan){

                    foreach ($periode as $per) {
                        
                        $pdf = PDF::loadView('reportKependudukan', ['kependudukan' => $kependudukan, 'count' => $count, 'periode' => $periode,'kecamatan' => $instansi])->setPaper([0, 0, 700, 1200], 'landscape');
                        return $pdf->stream('Laporan_Kependudukan_' . $kecamatan->nama_instansi . '_' . $per->periode . '.pdf');
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

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $kependudukan = Kependudukan::find($id);
        return response(['data' => $kependudukan], 200);
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

    public function updateKependudukan(Request $request, $id)
    {
        $kependudukan = Kependudukan::find($id);
        $kependudukan->instansi_id = $request->input('instansi_id');
        $kependudukan->kelurahan = $request->input('kelurahan');
        $kependudukan->jmlh_penduduk_bln_lalu_l = $request->input('jmlh_penduduk_bln_lalu_l');
        $kependudukan->jmlh_penduduk_bln_lalu_p = $request->input('jmlh_penduduk_bln_lalu_p');
        $kependudukan->total_penduduk_bln_lalu = $request->input('jmlh_penduduk_bln_lalu_l') + $request->input('jmlh_penduduk_bln_lalu_p');
        $kependudukan->lahir_l = $request->input('lahir_l');
        $kependudukan->lahir_p = $request->input('lahir_p');
        $kependudukan->total_lahir = $request->input('lahir_l') + $request->input('lahir_p');
        $kependudukan->meninggal_l = $request->input('meninggal_l');
        $kependudukan->meninggal_p = $request->input('meninggal_p');
        $kependudukan->total_meninggal = $request->input('meninggal_l') + $request->input('meninggal_p');
        $kependudukan->datang_l = $request->input('datang_l');
        $kependudukan->datang_p = $request->input('datang_p');
        $kependudukan->total_datang = $request->input('datang_l') + $request->input('datang_p');
        $kependudukan->pindah_l = $request->input('pindah_l');
        $kependudukan->pindah_p = $request->input('pindah_p');
        $kependudukan->total_pindah = $request->input('pindah_l') + $request->input('pindah_p');
        $kependudukan->jmlh_penduduk_bln_ini_l = $request->input('jmlh_penduduk_bln_ini_l');
        $kependudukan->jmlh_penduduk_bln_ini_p = $request->input('jmlh_penduduk_bln_ini_p');
        $kependudukan->total_penduduk_bln_ini = $request->input('jmlh_penduduk_bln_ini_l') + $request->input('jmlh_penduduk_bln_ini_p');
        $kependudukan->periode = $request->input('periode');
        $kependudukan->is_verified = $request->input('is_verified');

        $kependudukan->save();
        $response = ["message"=>"Data Berhasil Diubah"];

        return response()->json($response);
    }
    public function validasiKependudukan(Request $request, $id)
    {
        $kependudukan = Kependudukan::find($id);
        $kependudukan->is_verified = $request->input('is_verified');
        $kependudukan->save();
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
        return Kependudukan::destroy($id);
    }
}
