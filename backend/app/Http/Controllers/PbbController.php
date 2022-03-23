<?php

namespace App\Http\Controllers;

use App\Exports\PbbExport;
use App\Exports\PbbExportAll;
use App\Exports\PbbIdExport;
use App\Exports\PbbWaktuExport;
use Illuminate\Http\Request;
use App\PBB;
use App\Paten;
use App\Kependudukan;
use App\Imunisasi;
use App\Bencana;
use App\Rules\PBBRule;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use Maatwebsite\Excel\Facades\Excel;
use PDF;
use PdfReport;


use function GuzzleHttp\Promise\all;

class PbbController extends Controller
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


        $pbb = PBB::query();
        if (!$request->except('page')) {
            $pbb = PBB::select('instansi.nama_instansi','db_realisasi_pbb.*')
                    ->leftJoin('instansi','instansi.id','=','db_realisasi_pbb.instansi_id')
                    ->orderBy('periode', 'DESC')
                    ->paginate(10);
            $count = PBB::select()->get()->count();
        } else {
             $pbb = PBB::select('instansi.nama_instansi','db_realisasi_pbb.*')
                    ->leftJoin('instansi','instansi.id','=','db_realisasi_pbb.instansi_id')
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
            $count = PBB::when($instansi_id, function ($query, $instansi_id) {
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
        return response(['data' => $pbb,'total' => $count], 200);
    }
    public function indexKelurahan(Request $request)
    {
        $instansi_id = $request->input('instansi_id');
        $kelurahan = $request->input('kelurahan');
        $periode = $request->input('periode');
        $is_verified = $request->input('is_verified');

        $pbb = PBB::query();
        if (!$request->except('page')) {
            $pbb = PBB::select('instansi.nama_instansi','db_realisasi_pbb.*')
                    ->leftJoin('instansi','instansi.id','=','db_realisasi_pbb.instansi_id')
                    ->where('is_verified','!=', 3)
                    ->orderBy('periode', 'DESC')
                    ->paginate(10);
            $count = PBB::select()
                    ->where('is_verified','!=', 3)
                    ->get()
                    ->count();
        } else {
            $pbb = PBB::select('instansi.nama_instansi','db_realisasi_pbb.*')
                    ->leftJoin('instansi','instansi.id','=','db_realisasi_pbb.instansi_id')
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
            $count = PBB::when($instansi_id, function ($query, $instansi_id) {
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

            return response(['data' => $pbb, 'total' => $count], 200);

       
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function createPbb(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'instansi_id' => 'required',
            
        ]);
        $valid = Validator::make($request->all(), [
            'periode' =>  'required|unique_with:db_realisasi_pbb, kelurahan'
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()->all()], 422);
        }
        if ($valid->fails()) {
            return response()->json(['errors' => $valid->errors()->all()], 400);
        }

        DB::table('db_realisasi_pbb')->insert([
            'instansi_id' => $request->input('instansi_id'),
            'kelurahan' => $request->input('kelurahan'),
            'target_pbb' => $request->input('target_pbb'),
            'realisasi_bln_lalu' => $request->input('realisasi_bln_lalu'),
            'realisasi_bln_ini' => $request->input('realisasi_bln_ini'),
            'jmlh_realisasi' => $request->get('realisasi_bln_lalu') + $request->get('realisasi_bln_ini'),
            'sisa_target' => DB::raw('target_pbb - jmlh_realisasi'),
            'keterangan' => DB::raw('jmlh_realisasi / target_pbb * 100'),
            'periode' => $request->input('periode')

        ]);
        $response = ["message" => "Data berhasil disimpan"];
        return response($response, 201);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function updatePBB(Request $request, $id)
    {
        $pbb = PBB::find($id);
        $pbb->instansi_id = $request->input('instansi_id');
        $pbb->kelurahan = $request->input('kelurahan');
        $pbb->target_pbb = $request->input('target_pbb');
        $pbb->realisasi_bln_lalu = $request->input('realisasi_bln_lalu');
        $pbb->realisasi_bln_ini = $request->input('realisasi_bln_ini');
        $pbb->jmlh_realisasi = $request->input('jmlh_realisasi');
        $pbb->sisa_target = $request->input('sisa_target');
        $pbb->keterangan = $request->input('keterangan');
        $pbb->periode = $request->input('periode');
        $pbb->is_verified = $request->input('is_verified');

        $pbb->save();
        $response = ["message"=>"Data Berhasil Diubah"];

        return response()->json($response);
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function validasiPbb(Request $request, $id)
    {
        $pbb = PBB::find($id);
        $pbb->is_verified = $request->input('is_verified');
        $pbb->save();
        $response = ["message"=>"Data Berhasil diverifikasi"];

        return response()->json($response);
    }

    public function destroy($id)
    {
        return PBB::destroy($id);
    }
    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $pbb = PBB::find($id);
        return response(['message' => 'Success', 'data' => $pbb], 200);
    }


    public function export(Request $request)
    {
        // $filename = "Laporan PBB " . date('d_m_Y_H_m', time() + 7 * 60 * 60) . ".pdf";


        // if ($request->filled('waktu', 'id_instansi')) {
        //     return Excel::download(new PbbExport((int)$request->id_instansi, $request->waktu), $filename);
        // }
        // if (!$request->input()) {
        //     return Excel::download(new PbbExportAll, $filename);
        // } else {
        //     if ($request->input('waktu')) {
        //         return Excel::download(new PbbWaktuExport($request->waktu), $filename);
        //     }
        //     if ($request->input('id_instansi')) {
        //         return Excel::download(new PbbIdExport((int)$request->id_instansi), $filename);
        //     }
        // }


        //USING DOMPDF FOR EXPORT PDF
        if ($request->filled('instansi_id', 'periode','kelurahan')) {

            $pbb = PBB::select()
                ->where('instansi_id', '=', $request->get('instansi_id'))
                ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                ->where('kelurahan','=', $request->get('kelurahan'))
                ->where('is_verified','=', 2)
                ->orderBy('db_realisasi_pbb.id', 'DESC')
                ->get();
            $count = DB::table('db_realisasi_pbb')
                ->select(
                    DB::raw('SUM(target_pbb) AS total_target'),
                    DB::raw('SUM(realisasi_bln_lalu) AS total_bln_lalu'),
                    DB::raw('SUM(realisasi_bln_ini) AS total_bln_ini'),
                    DB::raw('SUM(jmlh_realisasi) AS total_realisasi'),
                    DB::raw('SUM(sisa_target) AS total_sisa')
                )
                ->where('instansi_id', '=', $request->get('instansi_id'))
                ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                ->where('kelurahan','=', $request->get('kelurahan'))
                ->where('is_verified','=', 2)
                ->orderBy('id', 'DESC')
                ->get();
            $periode = DB::table('db_realisasi_pbb')
                ->select('periode')
                ->where('instansi_id', '=', $request->get('instansi_id'))
                ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                ->where('kelurahan','=', $request->get('kelurahan'))
                ->where('is_verified','=', 2)
                ->orderBy('id', 'DESC')
                ->take(1)
                ->get();
            $instansi = DB::table('db_realisasi_pbb')
                ->select('db_realisasi_pbb.instansi_id','instansi.nama_instansi')
                ->leftJoin('instansi','instansi.id','db_realisasi_pbb.instansi_id')
                ->where('instansi_id', '=', $request->get('instansi_id'))
                ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                ->where('kelurahan','=', $request->get('kelurahan'))
                ->where('is_verified','=',2)
                ->take(1)
                ->get();

            foreach ($instansi as $kecamatan) {
                foreach ($periode as $per) {
                    
                    $pdf = PDF::loadView('reportPbb', ['pbb' => $pbb, 'count' => $count, 'periode' => $periode,'kecamatan' => $instansi])->setPaper([0, 0, 600, 1000], 'landscape');
                    return $pdf->stream('Laporan_PBB_' . $kecamatan->nama_instansi . '_' . $per->periode . '.pdf');
                }
            }
        }
        if ($request->filled('instansi_id', 'periode')) {

            $pbb = PBB::select()
                ->where('instansi_id', '=', $request->get('instansi_id'))
                ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))

                ->where('is_verified','=', 2)
                ->orderBy('db_realisasi_pbb.id', 'DESC')
                ->get();
            $count = DB::table('db_realisasi_pbb')
                ->select(
                    DB::raw('SUM(target_pbb) AS total_target'),
                    DB::raw('SUM(realisasi_bln_lalu) AS total_bln_lalu'),
                    DB::raw('SUM(realisasi_bln_ini) AS total_bln_ini'),
                    DB::raw('SUM(jmlh_realisasi) AS total_realisasi'),
                    DB::raw('SUM(sisa_target) AS total_sisa')
                )
                ->where('instansi_id', '=', $request->get('instansi_id'))
                ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                
                ->where('is_verified','=', 2)
                ->orderBy('id', 'DESC')
                ->get();
            $periode = DB::table('db_realisasi_pbb')
                ->select('periode')
                ->where('instansi_id', '=', $request->get('instansi_id'))
                ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                
                ->where('is_verified','=', 2)
                ->orderBy('id', 'DESC')
                ->take(1)
                ->get();
            $instansi = DB::table('db_realisasi_pbb')
                ->select('db_realisasi_pbb.instansi_id','instansi.nama_instansi')
                ->leftJoin('instansi','instansi.id','db_realisasi_pbb.instansi_id')
                ->where('instansi_id', '=', $request->get('instansi_id'))
                ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                
                ->where('is_verified','=',2)
                ->take(1)
                ->get();

            foreach ($instansi as $kecamatan) {
                foreach ($periode as $per) {
                    
                    $pdf = PDF::loadView('reportPbb', ['pbb' => $pbb, 'count' => $count, 'periode' => $periode,'kecamatan' => $instansi])->setPaper([0, 0, 600, 1000], 'landscape');
                    return $pdf->stream('Laporan_PBB_' . $kecamatan->nama_instansi . '_' . $per->periode . '.pdf');
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





        //using WKHTMLPDF

        // $instansi = $request->input('id_instansi');
        // $periode = $request->input('waktu');
        // $title = 'Laporan PBB';


        // if ($instansi) {
        //     $meta = [
        //         'Kecamatan' => $instansi,
        //         'Kabupaten' => 'Pandeglang'
        //     ];
        // } else {
        //     $meta = [
        //         'Kecamatan' => '-',
        //         'Kabupaten' => 'Pandeglang'
        //     ];
        // }
        // if ($instansi && $periode) {

        //     $queryBuilder = PBB::select('instansi', 'kelurahan', PBB::raw("DATE_FORMAT(db_realisasi_pbb.waktu, '%b-%Y') as waktu"), 'target_pbb', 'realisasi_bln_lalu', 'realisasi_bln_ini', 'jmlh_realisasi', 'sisa_target', 'keterangan')
        //         ->where('id_instansi',  $instansi)->where('waktu', $periode)->orderBy('instansi', 'DESC');
        // }
        // if (!$instansi && !$periode) {

        //     $queryBuilder = PBB::select('instansi', 'kelurahan', PBB::raw("DATE_FORMAT(db_realisasi_pbb.waktu, '%b-%Y') as waktu"), 'target_pbb', 'realisasi_bln_lalu', 'realisasi_bln_ini', 'jmlh_realisasi', 'sisa_target', 'keterangan')
        //         ->orderBy('waktu', 'DESC');
        // }
        // if (!$instansi && $periode) {
        //     $queryBuilder = PBB::select('instansi', 'kelurahan', PBB::raw("DATE_FORMAT(db_realisasi_pbb.waktu, '%b-%Y') as waktu"), 'target_pbb', 'realisasi_bln_lalu', 'realisasi_bln_ini', 'jmlh_realisasi', 'sisa_target', 'keterangan')
        //         ->where('waktu',  $periode)->orderBy('instansi', 'DESC');
        // }
        // if ($instansi && !$periode) {
        //     $queryBuilder = PBB::select('instansi', 'kelurahan', PBB::raw("DATE_FORMAT(db_realisasi_pbb.waktu, '%b-%Y') as waktu"), 'target_pbb', 'realisasi_bln_lalu', 'realisasi_bln_ini', 'jmlh_realisasi', 'sisa_target', 'keterangan')
        //         ->where('id_instansi',  $instansi)->orderBy('instansi', 'DESC');
        // }

        // $columns = [
        //     'Kecamatan' => 'instansi',
        //     'Kelurahan' => 'kelurahan',
        //     'Periode' => 'waktu',
        //     'Target PBB' => 'target_pbb',
        //     'Realisasi Bulan yang Lalu' => 'realisasi_bln_lalu',
        //     'Realisasi Bulan Ini' => 'realisasi_bln_ini',
        //     'Jumlah Realisasi' => 'jmlh_realisasi',
        //     'Sisa Target' => 'sisa_target',
        //     'Keterangan' => 'keterangan'


        // ];

        // return PdfReport::of($title, $meta, $queryBuilder, $columns)
        //     ->groupBy('Kecamatan')
        //     ->setPaper('letter')
        //     ->setOrientation('landscape')
        //     ->withoutManipulation()
        //     ->stream();
    }

    public function dataBelumValid(Request $request) {
         if($request->filled(['periode','instansi_id','kelurahan'])) {
            $pbbInvalid = DB::table('db_realisasi_pbb')
                ->select(
                    DB::raw('count(*) as pbb_invalid')
                )
                ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                ->where('instansi_id','=',$request->instansi_id)
                ->where('kelurahan','=',$request->input('kelurahan'))
                ->where('is_verified', '=', 1)
                ->get();
            $pbbValid = DB::table('db_realisasi_pbb')
                ->select(
                    DB::raw('count(*) as pbb_valid')
                )
                ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                ->where('instansi_id','=',$request->instansi_id)
                ->where('kelurahan','=',$request->input('kelurahan'))
                ->where('is_verified', '=', 2)
                ->get();
            $pbbTolak = DB::table('db_realisasi_pbb')
                ->select(DB::raw('count(*) as pbb_tolak'))
                ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                ->where('instansi_id','=',$request->instansi_id)
                ->where('kelurahan','=',$request->input('kelurahan'))
                ->where('is_verified', '=', 3)
                ->get();
            $patenInvalid = DB::table('db_rekapitulasi_paten')
                ->select(
                    DB::raw('count(*) as paten_invalid')
                )
                ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                ->where('instansi_id','=',$request->instansi_id)
                ->where('kelurahan','=',$request->input('kelurahan'))
                ->where('is_verified','=',1)
                ->get();
            $patenValid = DB::table('db_rekapitulasi_paten')
                ->select(
                    DB::raw('count(*) as paten_valid')
                )
                ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                ->where('instansi_id','=',$request->instansi_id)
                ->where('kelurahan','=',$request->input('kelurahan'))
                ->where('is_verified','=',2)
                ->get();
            $patenTolak = DB::table('db_rekapitulasi_paten')
                ->select(DB::raw('count(*) as paten_tolak'))
                ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                ->where('instansi_id','=',$request->instansi_id)
                ->where('kelurahan','=',$request->input('kelurahan'))
                ->where('is_verified', '=', 3)
                ->get();
            $kependudukanInvalid = DB::table('db_kependudukan')
                ->select(
                    DB::raw('count(*) as kependudukan_invalid')
                )
                ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                ->where('instansi_id','=',$request->instansi_id)
                ->where('kelurahan','=',$request->input('kelurahan'))
                ->where('is_verified','=',1)
                ->get();
            $kependudukanValid = DB::table('db_kependudukan')
                ->select(
                    DB::raw('count(*) as kependudukan_valid')
                )
                ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                ->where('instansi_id','=',$request->instansi_id)
                ->where('kelurahan','=',$request->input('kelurahan'))
                ->where('is_verified','=',2)
                ->get();
            $kependudukanTolak = DB::table('db_kependudukan')
                ->select(DB::raw('count(*) as kependudukan_tolak'))
                ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                ->where('instansi_id','=',$request->instansi_id)
                ->where('kelurahan','=',$request->input('kelurahan'))
                ->where('is_verified', '=', 3)
                ->get();
            $imunisasiInvalid = DB::table('db_imunisasi')
                ->select(
                    DB::raw('count(*) as imunisasi_invalid')
                )
                ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                ->where('instansi_id','=',$request->instansi_id)
                ->where('kelurahan','=',$request->input('kelurahan'))
                ->where('is_verified','=',1)
                ->get();
            $imunisasiValid = DB::table('db_imunisasi')
                ->select(
                    DB::raw('count(*) as imunisasi_valid')
                )
                ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                ->where('instansi_id','=',$request->instansi_id)
                ->where('kelurahan','=',$request->input('kelurahan'))
                ->where('is_verified','=',2)
                ->get();
            $imunisasiTolak = DB::table('db_imunisasi')
                ->select(DB::raw('count(*) as imunisasi_tolak'))
                ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                ->where('instansi_id','=',$request->instansi_id)
                ->where('kelurahan','=',$request->input('kelurahan'))
                ->where('is_verified', '=', 3)
                ->get();
            $bencanaInvalid = DB::table('db_bencana_alam')
                ->select(
                    DB::raw('count(*) as bencana_invalid')
                )
                ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                ->where('instansi_id','=',$request->instansi_id)
                ->where('kelurahan','=',$request->input('kelurahan'))
                ->where('is_verified','=',1)
                ->get();
            $bencanaValid = DB::table('db_bencana_alam')
                ->select(
                    DB::raw('count(*) as bencana_valid')
                )
                ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                ->where('instansi_id','=',$request->instansi_id)
                ->where('kelurahan','=',$request->input('kelurahan'))
                ->where('is_verified','=',2)
                ->get();
            $bencanaTolak = DB::table('db_bencana_alam')
                ->select(DB::raw('count(*) as bencana_tolak'))
                ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                ->where('instansi_id','=',$request->instansi_id)
                ->where('kelurahan','=',$request->input('kelurahan'))
                ->where('is_verified', '=', 3)
                ->get();
            $realisasi = $pbbInvalid->merge($pbbValid)->merge($pbbTolak)
                ->merge($patenInvalid)->merge($patenValid)->merge($patenTolak)
                ->merge($kependudukanInvalid)->merge($kependudukanValid)->merge($kependudukanTolak)
                ->merge($imunisasiInvalid)->merge($imunisasiValid)->merge($imunisasiTolak)
                ->merge($bencanaInvalid)->merge($bencanaValid)->merge($bencanaTolak);
                return response()->json(['data' => $realisasi]);
           
        } else {
            $pbbInvalid = DB::table('db_realisasi_pbb')
                ->select(
                    DB::raw('count(*) as pbb_invalid')
                )
                ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                ->where('instansi_id','=',$request->instansi_id)
                ->where('is_verified', '=', 1)
                ->get();
            $pbbValid = DB::table('db_realisasi_pbb')
                ->select(
                    DB::raw('count(*) as pbb_valid')
                )
                ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                ->where('instansi_id','=',$request->instansi_id)
                ->where('is_verified', '=', 2)
                ->get();
            $pbbTolak = DB::table('db_realisasi_pbb')
                ->select(DB::raw('count(*) as pbb_tolak'))
                ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                ->where('instansi_id','=',$request->instansi_id)
                ->where('is_verified', '=', 3)
                ->get();
            $patenInvalid = DB::table('db_rekapitulasi_paten')
                ->select(
                    DB::raw('count(*) as paten_invalid')
                )
                ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                ->where('instansi_id','=',$request->instansi_id)
                ->where('is_verified','=',1)
                ->get();
            $patenValid = DB::table('db_rekapitulasi_paten')
                ->select(
                    DB::raw('count(*) as paten_valid')
                )
                ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                ->where('instansi_id','=',$request->instansi_id)
                ->where('is_verified','=',2)
                ->get();
            $patenTolak = DB::table('db_rekapitulasi_paten')
                ->select(DB::raw('count(*) as paten_tolak'))
                ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                ->where('instansi_id','=',$request->instansi_id)
                ->where('is_verified', '=', 3)
                ->get();
            $kependudukanInvalid = DB::table('db_kependudukan')
                ->select(
                    DB::raw('count(*) as kependudukan_invalid')
                )
                ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                ->where('instansi_id','=',$request->instansi_id)
                ->where('is_verified','=',1)
                ->get();
            $kependudukanValid = DB::table('db_kependudukan')
                ->select(
                    DB::raw('count(*) as kependudukan_valid')
                )
                ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                ->where('instansi_id','=',$request->instansi_id)
                ->where('is_verified','=',2)
                ->get();
            $kependudukanTolak = DB::table('db_kependudukan')
                ->select(DB::raw('count(*) as kependudukan_tolak'))
                ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                ->where('instansi_id','=',$request->instansi_id)
                ->where('is_verified', '=', 3)
                ->get();
            $imunisasiInvalid = DB::table('db_imunisasi')
                ->select(
                    DB::raw('count(*) as imunisasi_invalid')
                )
                ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                ->where('instansi_id','=',$request->instansi_id)
                ->where('is_verified','=',1)
                ->get();
            $imunisasiValid = DB::table('db_imunisasi')
                ->select(
                    DB::raw('count(*) as imunisasi_valid')
                )
                ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                ->where('instansi_id','=',$request->instansi_id)
                ->where('is_verified','=',2)
                ->get();
            $imunisasiTolak = DB::table('db_imunisasi')
                ->select(DB::raw('count(*) as imunisasi_tolak'))
                ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                ->where('instansi_id','=',$request->instansi_id)
                ->where('is_verified', '=', 3)
                ->get();
            $bencanaInvalid = DB::table('db_bencana_alam')
                ->select(
                    DB::raw('count(*) as bencana_invalid')
                )
                ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                ->where('instansi_id','=',$request->instansi_id)
                ->where('is_verified','=',1)
                ->get();
            $bencanaValid = DB::table('db_bencana_alam')
                ->select(
                    DB::raw('count(*) as bencana_valid')
                )
                ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                ->where('instansi_id','=',$request->instansi_id)
                ->where('is_verified','=',2)
                ->get();
            $bencanaTolak = DB::table('db_bencana_alam')
                ->select(DB::raw('count(*) as bencana_tolak'))
                ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                ->where('instansi_id','=',$request->instansi_id)
                ->where('is_verified', '=', 3)
                ->get();
            $realisasi = $pbbInvalid->merge($pbbValid)->merge($pbbTolak)
                ->merge($patenInvalid)->merge($patenValid)->merge($patenTolak)
                ->merge($kependudukanInvalid)->merge($kependudukanValid)->merge($kependudukanTolak)
                ->merge($imunisasiInvalid)->merge($imunisasiValid)->merge($imunisasiTolak)
                ->merge($bencanaInvalid)->merge($bencanaValid)->merge($bencanaTolak);
                return response()->json(['data' => $realisasi]);
        }

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

    public function totalData(Request $request)
    {
        if($request->filled(['periode','instansi_id'])) {
            $realisasi = 
            PBB::where([['is_verified', 1],[DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode')],['instansi_id', $request->instansi_id]])->count() + 
            Paten::where([['is_verified', 1],[DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode')],['instansi_id', $request->instansi_id]])->count() +
            Kependudukan::where([['is_verified', 1],[DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode')],['instansi_id', $request->instansi_id]])->count() +
            Imunisasi::where([['is_verified', 1],[DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode')],['instansi_id', $request->instansi_id]])->count() +
            Bencana::where([['is_verified', 1],[DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode')],['instansi_id', $request->instansi_id]])->count();
            
            return response()->json(['data' => $realisasi]);
        }
    }

    public function dataDitolak(Request $request)
    {
        if($request->filled(['periode','instansi_id'])) {
            $realisasi = 
            PBB::where([['is_verified', 3],[DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode')],['instansi_id', $request->instansi_id],['kelurahan',$request->kelurahan]])->count() + 
            Paten::where([['is_verified', 3],[DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode')],['instansi_id', $request->instansi_id],['kelurahan',$request->kelurahan]])->count() +
            Kependudukan::where([['is_verified', 3],[DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode')],['instansi_id', $request->instansi_id],['kelurahan',$request->kelurahan]])->count() +
            Imunisasi::where([['is_verified', 3],[DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode')],['instansi_id', $request->instansi_id],['kelurahan',$request->kelurahan]])->count() +
            Bencana::where([['is_verified', 3],[DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode')],['instansi_id', $request->instansi_id],['kelurahan',$request->kelurahan]])->count();
            
            return response()->json(['data' => $realisasi]);
        }
    }
}
