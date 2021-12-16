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


        $pbb = PBB::query();
        if (!$request->input()) {
            $pbb = PBB::select()->get();
            $count = PBB::select()->get()->count();
        } else {
            if ($request->filled('instansi_id')) {
                $pbb = PBB::where('instansi_id', '=', $request->get('instansi_id'))->orderBy('id', 'DESC')
                    ->get();
                $count = PBB::where('instansi_id', '=', $request->get('instansi_id'))->orderBy('id', 'DESC')
                    ->get()->count();
            }
            if ($request->filled('periode')) {
                $pbb = PBB::where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))->orderBy('id', 'DESC')
                    ->get();
                $count = PBB::where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))->orderBy('id', 'DESC')
                    ->get()->count();
            }
            if ($request->filled('is_verified')) {
                $pbb = PBB::where('is_verified', '=', $request->get('is_verified'))->orderBy('id', 'DESC')
                    ->get();
                $count = PBB::where('is_verified', '=', $request->get('is_verified'))->orderBy('id', 'DESC')
                    ->get()->count();
            }
            if ($request->filled(['instansi_id', 'periode','is_verified'])) {
                $pbb = PBB::where('instansi_id', '=', $request->get('instansi_id'))
                    ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                    ->where('is_verified','=',$request->get('is_verified'))
                    ->orderBy('id', 'DESC')
                    ->get();
                $count = PBB::where('instansi_id', '=', $request->get('instansi_id'))
                    ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                    ->where('is_verified','=',$request->get('is_verified'))
                    ->orderBy('id', 'DESC')
                    ->get()->count();
            }
             else {
             
            if ($request->filled(['instansi_id', 'periode'])) {
                $pbb = PBB::where('instansi_id', '=', $request->get('instansi_id'))
                    ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                    ->orderBy('id', 'DESC')
                    ->get();
                $count = PBB::where('instansi_id', '=', $request->get('instansi_id'))
                    ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                    ->orderBy('id', 'DESC')
                    ->get()->count();
            }
            if ($request->filled(['periode','is_verified'])) {
                $pbb = PBB::where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                ->where('is_verified','=',$request->get('is_verified'))
                ->orderBy('id', 'DESC')
                ->get();
                $count = PBB::where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                ->where('is_verified','=',$request->get('is_verified'))
                ->orderBy('id', 'DESC')
                ->get()->count();
            }
            if ($request->filled(['instansi_id', 'is_verified'])) {
                $pbb = PBB::where('instansi_id', '=', $request->get('instansi_id'))
                    ->where('is_verified', '=', $request->get('is_verified'))
                    ->orderBy('id', 'DESC')
                    ->get();
                $count = PBB::where('instansi_id', '=', $request->get('instansi_id'))
                    ->where('is_verified', '=', $request->get('is_verified'))
                    ->orderBy('id', 'DESC')
                    ->get()->count();
            }
             }
        }
        return response(['data' => $pbb, 'total' => $count], 200);
    }
    public function indexCamat(Request $request)
    {
        $pbb = PBB::query();
        if (!$request->input()) {
            $pbb = PBB::select()
                    ->where('is_verified','!=', 2)
                    ->get();
            $count = PBB::select()
                    ->where('is_verified','!=', 2)
                    ->get()
                    ->count();
        } else {
            if ($request->filled('instansi_id')) {
                $pbb = PBB::where('instansi_id', '=', $request->get('instansi_id'))
                    ->where('is_verified','!=', 2)
                    ->orderBy('id', 'DESC')
                    ->get();
                $count = PBB::where('instansi_id', '=', $request->get('instansi_id'))
                    ->where('is_verified','!=', 2)
                    ->get()->count();
            }
            if ($request->filled(['instansi_id', 'periode','is_verified'])) {
                $pbb = PBB::where('instansi_id', '=', $request->get('instansi_id'))
                    ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                    ->where('is_verified','=',$request->get('is_verified'))
                    ->orderBy('id', 'DESC')
                    ->get();
                $count = PBB::where('instansi_id', '=', $request->get('instansi_id'))
                    ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                    ->where('is_verified','=',$request->get('is_verified'))
                    ->orderBy('id', 'DESC')
                    ->get()->count();
            }
            if ($request->filled(['instansi_id', 'periode'])) {
                $pbb = PBB::where('instansi_id', '=', $request->get('instansi_id'))
                    ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                    ->orderBy('id', 'DESC')
                    ->get();
                $count = PBB::where('instansi_id', '=', $request->get('instansi_id'))
                    ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                    ->orderBy('id', 'DESC')
                    ->get()->count();
            }
            if ($request->filled(['periode','is_verified'])) {
                $pbb = PBB::where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                ->where('is_verified','=',$request->get('is_verified'))
                ->orderBy('id', 'DESC')
                ->get();
                $count = PBB::where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                ->where('is_verified','=',$request->get('is_verified'))
                ->orderBy('id', 'DESC')
                ->get()->count();
            }
            if ($request->filled(['instansi_id', 'is_verified'])) {
                $pbb = PBB::where('instansi_id', '=', $request->get('instansi_id'))
                    ->where('is_verified', '=', $request->get('is_verified'))
                    ->orderBy('id', 'DESC')
                    ->get();
                $count = PBB::where('instansi_id', '=', $request->get('instansi_id'))
                    ->where('is_verified', '=', $request->get('is_verified'))
                    ->orderBy('id', 'DESC')
                    ->get()->count();
            }
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
            'kelurahan' => 'required|string',

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

        PBB::create($request->all());
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
        if ($request->input('instansi_id', 'periode')) {

            $pbb = DB::table('db_realisasi_pbb')
                ->select( 'kelurahan', DB::raw("DATE_FORMAT(db_realisasi_pbb.periode, '%b-%Y') as periode"), 'target_pbb', 'realisasi_bln_lalu', 'realisasi_bln_ini', 'jmlh_realisasi', 'sisa_target', 'keterangan')
                ->where('instansi_id', '=', $request->get('instansi_id'))
                ->where('periode', '=', $request->get('periode'))
                ->orderBy('id', 'DESC')
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
                ->where('periode', '=', $request->get('periode'))
                ->orderBy('id', 'DESC')
                ->get();
            $periode = DB::table('db_realisasi_pbb')
                ->select(
                    DB::raw("DATE_FORMAT(periode, '%Y') as tahun"),
                    DB::raw("DATE_FORMAT(periode, '%m') as bulan"),
                    DB::raw("DATE_FORMAT(periode, '%b_%Y') as periode")
                )
                ->where('instansi_id', '=', $request->get('instansi_id'))
                ->where('periode', '=', $request->get('periode'))
                ->orderBy('id', 'DESC')
                ->take(1)
                ->get();
            $instansi = PBB::select('db_realisasi_pbb.instansi_id','instansi.nama_instansi')
                ->leftJoin('instansi','instansi.id','db_realisasi_pbb.instansi_id')
                ->where('db_realisasi_pbb.is_verified','=','1')
                ->take(1)
                ->get();

            foreach ($instansi as $kecamatan) {
                foreach ($periode as $per) {
                    
                    $pdf = PDF::loadView('reportPbb', ['pbb' => $pbb, 'count' => $count, 'periode' => $periode,'kecamatan' => $instansi])->setPaper('letter', 'landscape');
                    return $pdf->stream('Laporan_PBB_' . $kecamatan->kecamatan . '_' . $per->periode . '.pdf');
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
         if($request->filled(['periode','instansi_id'])) {
            $pbbInvalid = DB::table('db_realisasi_pbb')
                ->select(
                    DB::raw('count(*) as pbb_invalid')
                )
                ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                ->where('instansi_id','=',$request->instansi_id)
                ->where('is_verified', '=', '0')
                ->get();
                $pbbValid = DB::table('db_realisasi_pbb')
                ->select(
                    DB::raw('count(*) as pbb_valid')
                )
                ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                ->where('instansi_id','=',$request->instansi_id)
                ->where('is_verified', '=', '1')
                ->get();
                $patenInvalid = DB::table('db_rekapitulasi_paten')
                ->select(
                    DB::raw('count(*) as paten_invalid')
                )
                ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                ->where('instansi_id','=',$request->instansi_id)
                ->where('is_verified','=','0')
                ->get();
                $patenValid = DB::table('db_rekapitulasi_paten')
                ->select(
                    DB::raw('count(*) as paten_valid')
                )
                ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                ->where('instansi_id','=',$request->instansi_id)
                ->where('is_verified','=','1')
                ->get();
                $kependudukanInvalid = DB::table('db_kependudukan')
                ->select(
                    DB::raw('count(*) as kependudukan_invalid')
                )
                ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                ->where('instansi_id','=',$request->instansi_id)
                ->where('is_verified','=','0')
                ->get();
                $kependudukanValid = DB::table('db_kependudukan')
                ->select(
                    DB::raw('count(*) as kependudukan_valid')
                )
                ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                ->where('instansi_id','=',$request->instansi_id)
                ->where('is_verified','=','1')
                ->get();
                $bencanaInvalid = DB::table('db_bencana_alam')
                ->select(
                    DB::raw('count(*) as bencana_invalid')
                )
                ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                ->where('instansi_id','=',$request->instansi_id)
                ->where('is_verified','=','0')
                ->get();
                $bencanaValid = DB::table('db_bencana_alam')
                ->select(
                    DB::raw('count(*) as bencana_valid')
                )
                ->where(DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode'))
                ->where('instansi_id','=',$request->instansi_id)
                ->where('is_verified','=','1')
                ->get();
                $realisasi = $pbbInvalid->merge($pbbValid)->merge($patenInvalid)->merge($patenValid)->merge($kependudukanInvalid)
                ->merge($kependudukanValid)->merge($bencanaInvalid)->merge($bencanaValid);
                return response()->json(['data' => $realisasi]);
        } else if ($request->filled('periode')){
            // $pbbInvalid = DB::table('db_realisasi_pbb')
            // ->select(
            //     DB::raw('count(*) as pbb_invalid')
            // )
            // ->where(DB::raw('YEAR(periode)'), '=', $request->periode)
            // ->where('is_verified', '=', '0')
            // ->get();
            // $pbbValid = DB::table('db_realisasi_pbb')
            // ->select(
            //     DB::raw('count(*) as pbb_valid')
            // )
            // ->where(DB::raw('YEAR(periode)'), '=', $request->periode)
            // ->where('is_verified', '=', '1')
            // ->get();
            // $patenInvalid = DB::table('db_rekapitulasi_paten')
            // ->select(
            //     DB::raw('count(*) as paten_invalid')
            // )
            // ->where(DB::raw('YEAR(periode)'), '=', $request->periode)
            // ->where('is_verified','=','0')
            // ->get();
            // $patenValid = DB::table('db_rekapitulasi_paten')
            // ->select(
            //     DB::raw('count(*) as paten_valid')
            // )
            // ->where(DB::raw('YEAR(periode)'), '=', $request->periode)
            // ->where('is_verified','=','1')
            // ->get();
            // $realisasi = $pbbInvalid->merge($pbbValid)->merge($patenInvalid)->merge($patenValid);
            // return response()->json(['data' => $realisasi]);
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
            PBB::where([['is_verified', 0],[DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode')],['instansi_id', $request->instansi_id]])->count() + 
            Paten::where([['is_verified', 0],[DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode')],['instansi_id', $request->instansi_id]])->count() +
            Kependudukan::where([['is_verified', 0],[DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode')],['instansi_id', $request->instansi_id]])->count() +
            Bencana::where([['is_verified', 0],[DB::raw("DATE_FORMAT(periode, '%Y-%m')"), '=', $request->get('periode')],['instansi_id', $request->instansi_id]])->count();
            
            return response()->json(['data' => $realisasi]);
        }
    }
}
