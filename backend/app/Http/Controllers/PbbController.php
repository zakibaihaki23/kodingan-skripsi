<?php

namespace App\Http\Controllers;

use App\Exports\PbbExport;
use App\Exports\PbbExportAll;
use App\Exports\PbbIdExport;
use App\Exports\PbbWaktuExport;
use Illuminate\Http\Request;
use App\PBB;
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
            $pbb = DB::table('db_realisasi_pbb')->get();
            $count = DB::table('db_realisasi_pbb')->get()->count();
        } else {
            if ($request->filled('instansi_id')) {
                $pbb = PBB::where('instansi_id', '=', $request->get('instansi_id'))->orderBy('id', 'DESC')
                    ->get();
                $count = PBB::where('instansi_id', '=', $request->get('instansi_id'))->orderBy('id', 'DESC')
                    ->get()->count();
            }
            if ($request->filled('waktu')) {
                $pbb = PBB::where('waktu', '=', $request->get('waktu'))->orderBy('id', 'DESC')
                    ->get();
                $count = PBB::where('waktu', '=', $request->get('waktu'))->orderBy('id', 'DESC')
                    ->get()->count();
            }
            if ($request->filled('id_kelurahan')) {
                $pbb = PBB::where('id_kelurahan', '=', $request->get('id_kelurahan'))->orderBy('id', 'DESC')
                    ->get();
                $count = PBB::where('id_kelurahan', '=', $request->get('id_kelurahan'))->orderBy('id', 'DESC')
                    ->get()->count();
            }
            if ($request->filled(['instansi_id', 'waktu'])) {
                $pbb = PBB::where('instansi_id', '=', $request->get('instansi_id'))
                    ->where('waktu', '=', $request->get('waktu'))
                    ->orderBy('id', 'DESC')
                    ->get();
                $count = PBB::where('instansi_id', '=', $request->get('instansi_id'))
                    ->where('waktu', '=', $request->get('waktu'))
                    ->orderBy('id', 'DESC')
                    ->get()->count();
            }
            if ($request->filled(['instansi_id', 'waktu', 'id_kelurahan'])) {
                $pbb = PBB::where('instansi_id', '=', $request->get('instansi_id'))
                    ->where('waktu', '=', $request->get('waktu'))
                    ->where('id_kelurahan', '=', $request->get('id_kelurahan'))
                    ->orderBy('id', 'DESC')
                    ->get();
                $count = PBB::where('instansi_id', '=', $request->get('instansi_id'))
                    ->where('waktu', '=', $request->get('waktu'))
                    ->where('id_kelurahan', '=', $request->get('id_kelurahan'))
                    ->orderBy('id', 'DESC')
                    ->get()->count();
            }
        }
        // if ($request->has(['id_instansi', 'waktu', 'id_kelurahan'])) {
        //     $pbb = PBB::where('id_instansi', '=', $request->get('id_instansi'))
        //         ->where('waktu', '=', $request->get('waktu'))
        //         ->where('id_kelurahan', '=', $request->get('id_kelurahan'))
        //         ->orderBy('id', 'DESC')
        //         ->get();
        //     $count = PBB::where('id_instansi', '=', $request->get('id_instansi'))
        //         ->where('waktu', '=', $request->get('waktu'))
        //         ->where('id_kelurahan', '=', $request->get('id_kelurahan'))
        //         ->orderBy('id', 'DESC')
        //         ->get()->count();
        // } else {
        //     if ($request->isNotFilled('waktu')) {
        //         $pbb = PBB::where('id_kelurahan', '=', $request->get('id_kelurahan'))->orderBy('id', 'DESC')
        //             ->get();
        //         $count = PBB::where('id_kelurahan', '=', $request->get('id_kelurahan'))->orderBy('id', 'DESC')
        //             ->get()->count();
        //     }
        //     if ($request->isNotFilled('waktu')) {
        //         $pbb = PBB::where('id_instansi', '=', $request->get('id_instansi'))->orderBy('id', 'DESC')
        //             ->get();
        //         $count = PBB::where('id_instansi', '=', $request->get('id_instansi'))->orderBy('id', 'DESC')
        //             ->get()->count();
        //     }
        //     // if ($request->isNotFilled('id_kelurahan')) {
        //     //     $pbb = PBB::where('id_instansi', '=', $request->get('id_instansi'))->where('waktu', '=', $request->get('waktu'))
        //     //         ->orderBy('id', 'DESC')->get();
        //     //     $count = PBB::where('id_instansi', '=', $request->get('id_instansi'))->where('waktu', '=', $request->get('waktu'))
        //     //         ->orderBy('id', 'DESC')->get()->count();
        //     // }
        //     if ($request->filled('instansi')) {
        //         $pbb = PBB::where('instansi', 'like', '%' . $request->get('instansi') . '%')->get();
        //     }
        // }

        return response(['data' => $pbb, 'total' => $count], 200);

        // if ($request->isNotFilled('id_instansi')) {
        //     $pbb = PBB::where('waktu', '=', $request->get('waktu'))->orderBy('id', 'DESC')
        //         ->get();
        // }
        // if ($request->isNotFilled('waktu')) {
        //     $pbb = PBB::where('id_instansi', '=', $request->get('id_instansi'))->orderBy('id', 'DESC')
        //         ->get();
        // }


    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function createPbb(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'id_instansi' => 'required',
            'id_kelurahan' => 'required',
            'instansi' => 'required|string',
            'kelurahan' => 'required|string',
            'target_pbb' => 'required',
            'realisasi_bln_lalu' => 'required',
            'realisasi_bln_ini' => 'required',
            'jmlh_realisasi' => 'required',
            'keterangan' => 'string',

        ]);
        $valid = Validator::make($request->all(), [
            'waktu' =>  'required|unique_with:db_realisasi_pbb, id_kelurahan'
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
        $pbb->id_instansi = $request->input('id_instansi');
        $pbb->id_kelurahan = $request->input('id_kelurahan');
        $pbb->instansi = $request->input('instansi');
        $pbb->kelurahan = $request->input('kelurahan');
        $pbb->target_pbb = $request->input('target_pbb');
        $pbb->realisasi_bln_lalu = $request->input('realisasi_bln_lalu');
        $pbb->realisasi_bln_ini = $request->input('realisasi_bln_ini');
        $pbb->jmlh_realisasi = $request->input('jmlh_realisasi');
        $pbb->sisa_target = $request->input('sisa_target');
        $pbb->keterangan = $request->input('keterangan');
        $pbb->waktu = $request->input('waktu');

        $pbb->save();

        return response()->json($pbb);
    }


    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
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
        if ($request->input('id_instansi', 'waktu')) {

            $pbb = DB::table('db_realisasi_pbb')
                ->select('instansi', 'kelurahan', DB::raw("DATE_FORMAT(db_realisasi_pbb.waktu, '%b-%Y') as waktu"), 'target_pbb', 'realisasi_bln_lalu', 'realisasi_bln_ini', 'jmlh_realisasi', 'sisa_target', 'keterangan')
                ->where('id_instansi', '=', $request->get('id_instansi'))
                ->where('waktu', '=', $request->get('waktu'))
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
                ->where('id_instansi', '=', $request->get('id_instansi'))
                ->where('waktu', '=', $request->get('waktu'))
                ->orderBy('id', 'DESC')
                ->get();
            $periode = DB::table('db_realisasi_pbb')
                ->select(
                    DB::raw("DATE_FORMAT(waktu, '%Y') as tahun"),
                    DB::raw("DATE_FORMAT(waktu, '%m') as bulan"),
                    DB::raw("DATE_FORMAT(waktu, '%b_%Y') as periode")
                )
                ->where('id_instansi', '=', $request->get('id_instansi'))
                ->where('waktu', '=', $request->get('waktu'))
                ->orderBy('id', 'DESC')
                ->take(1)
                ->get();
            $kecamatan = DB::table('db_realisasi_pbb')
                ->select('instansi')
                ->where('id_instansi', '=', $request->get('id_instansi'))
                ->take(1)
                ->get();

            foreach ($kecamatan as $instansi) {
                foreach ($periode as $per) {
                    
                    $pdf = PDF::loadView('reportPBB', ['pbb' => $pbb, 'count' => $count, 'periode' => $periode])->setPaper('letter', 'landscape');
                    return $pdf->stream('Laporan_PBB_' . $instansi->instansi . '_' . $per->periode . '.pdf');
                }
            }
        }
        if (!$request->filled('id_instansi')) {
            $response = ["message" => 'Harap Pilih Instansi Terlebih Dahulu'];
            return response($response, 400);
        }
        if (!$request->filled('waktu')) {
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
            $notvalid = DB::table('db_realisasi_pbb')
                ->select(
                    DB::raw('count(*) as not_valid')
                )
                ->where('periode', '=', $request->periode)
                ->where('instansi_id','=',$request->instansi_id)
                ->where('is_verified', '=', '0')
                ->get();
                $valid = DB::table('db_realisasi_pbb')
                ->select(
                    DB::raw('count(*) as valid')
                )
                ->where('periode', '=', $request->periode)
                ->where('instansi_id','=',$request->instansi_id)
                ->where('is_verified', '=', '1')
                ->get();
                $valid2 = DB::table('rekapitulasi_paten')
                ->select(
                    DB::raw('count(*) as lidva')
                )
                ->where('periode', '=', $request->periode)
                ->where('instansi_id','=',$request->instansi_id)
                ->get();
                $realisasi = $notvalid->merge($valid)->merge($valid2);
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
}
