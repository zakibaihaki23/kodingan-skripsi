<?php

namespace App\Http\Controllers;

use App\Exports\KependudukanExportAll;
use Illuminate\Http\Request;
use App\Kependudukan;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Maatwebsite\Excel\Facades\Excel;

class KependudukanController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $kependudukan = Kependudukan::query();

        if ($request->has(['id_instansi', 'waktu'])) {
            $kependudukan = DB::table('db_kependudukan')
                ->select(
                    'id_instansi',
                    'id_kelurahan',
                    'kelurahan',
                    'waktu',
                    'jmlh_penduduk_bln_lalu_l',
                    'jmlh_penduduk_bln_lalu_p',
                    DB::raw('sum(jmlh_penduduk_bln_lalu_l + jmlh_penduduk_bln_lalu_p) as total_penduduk_bln_lalu'),
                    'lahir_l',
                    'lahir_p',
                    DB::raw('sum(lahir_l + lahir_p) as total_lahir'),
                    'meninggal_l',
                    'meninggal_p',
                    DB::raw('sum(meninggal_l + meninggal_p) as total_meninggal'),
                    'datang_l',
                    'datang_p',
                    DB::raw('sum(datang_l + datang_p) as total_datang'),
                    'pindah_l',
                    'pindah_p',
                    DB::raw('sum(pindah_l + pindah_p) as total_pindah'),
                    'jmlh_penduduk_bln_ini_l',
                    'jmlh_penduduk_bln_ini_p',
                    DB::raw('sum(jmlh_penduduk_bln_ini_l + jmlh_penduduk_bln_ini_p) as total_penduduk_bln_ini'),
                )
                ->groupBy('id')->orderBy('id', 'DESC')
                ->where('id_instansi', '=', $request->get('id_instansi'))
                ->where('waktu', '=', $request->get('waktu'))
                ->orderBy('id', 'DESC')
                ->get();
            $count = Kependudukan::where('id_instansi', '=', $request->get('id_instansi'))
                ->where('waktu', '=', $request->get('waktu'))
                ->orderBy('id', 'DESC')
                ->get()->count();
        }
        if (!$request->input()) {
            $kependudukan = DB::table('db_kependudukan')
                ->select(
                    'id_instansi',
                    'id_kelurahan',
                    'kelurahan',
                    'waktu',
                    'jmlh_penduduk_bln_lalu_l',
                    'jmlh_penduduk_bln_lalu_p',
                    DB::raw('sum(jmlh_penduduk_bln_lalu_l + jmlh_penduduk_bln_lalu_p) as total_penduduk_bln_lalu'),
                    'lahir_l',
                    'lahir_p',
                    DB::raw('sum(lahir_l + lahir_p) as total_lahir'),
                    'meninggal_l',
                    'meninggal_p',
                    DB::raw('sum(meninggal_l + meninggal_p) as total_meninggal'),
                    'datang_l',
                    'datang_p',
                    DB::raw('sum(datang_l + datang_p) as total_datang'),
                    'pindah_l',
                    'pindah_p',
                    DB::raw('sum(pindah_l + pindah_p) as total_pindah'),
                    'jmlh_penduduk_bln_ini_l',
                    'jmlh_penduduk_bln_ini_p',
                    DB::raw('sum(jmlh_penduduk_bln_ini_l + jmlh_penduduk_bln_ini_p) as total_penduduk_bln_ini'),
                )
                ->groupBy('id')->orderBy('id', 'DESC')->get();
            $count = DB::table('db_kependudukan')->get()->count();
        } else {
            if ($request->isNotFilled('id_instansi')) {
                $kependudukan = DB::table('db_kependudukan')
                    ->select(
                        'id_instansi',
                        'id_kelurahan',
                        'kelurahan',
                        'waktu',
                        'jmlh_penduduk_bln_lalu_l',
                        'jmlh_penduduk_bln_lalu_p',
                        DB::raw('sum(jmlh_penduduk_bln_lalu_l + jmlh_penduduk_bln_lalu_p) as total_penduduk_bln_lalu'),
                        'lahir_l',
                        'lahir_p',
                        DB::raw('sum(lahir_l + lahir_p) as total_lahir'),
                        'meninggal_l',
                        'meninggal_p',
                        DB::raw('sum(meninggal_l + meninggal_p) as total_meninggal'),
                        'datang_l',
                        'datang_p',
                        DB::raw('sum(datang_l + datang_p) as total_datang'),
                        'pindah_l',
                        'pindah_p',
                        DB::raw('sum(pindah_l + pindah_p) as total_pindah'),
                        'jmlh_penduduk_bln_ini_l',
                        'jmlh_penduduk_bln_ini_p',
                        DB::raw('sum(jmlh_penduduk_bln_ini_l + jmlh_penduduk_bln_ini_p) as total_penduduk_bln_ini'),
                    )
                    ->where('waktu', '=', $request->get('waktu'))->groupBy('id')->orderBy('id', 'DESC')
                    ->get();
                $count = Kependudukan::where('waktu', '=', $request->get('waktu'))->orderBy('id', 'DESC')
                    ->get()->count();
            }
            if ($request->isNotFilled('waktu')) {
                $kependudukan = DB::table('db_kependudukan')
                    ->select(
                        'id_instansi',
                        'id_kelurahan',
                        'kelurahan',
                        'waktu',
                        'jmlh_penduduk_bln_lalu_l',
                        'jmlh_penduduk_bln_lalu_p',
                        DB::raw('sum(jmlh_penduduk_bln_lalu_l + jmlh_penduduk_bln_lalu_p) as total_penduduk_bln_lalu'),
                        'lahir_l',
                        'lahir_p',
                        DB::raw('sum(lahir_l + lahir_p) as total_lahir'),
                        'meninggal_l',
                        'meninggal_p',
                        DB::raw('sum(meninggal_l + meninggal_p) as total_meninggal'),
                        'datang_l',
                        'datang_p',
                        DB::raw('sum(datang_l + datang_p) as total_datang'),
                        'pindah_l',
                        'pindah_p',
                        DB::raw('sum(pindah_l + pindah_p) as total_pindah'),
                        'jmlh_penduduk_bln_ini_l',
                        'jmlh_penduduk_bln_ini_p',
                        DB::raw('sum(jmlh_penduduk_bln_ini_l + jmlh_penduduk_bln_ini_p) as total_penduduk_bln_ini'),
                    )
                    ->where('id_instansi', '=', $request->get('id_instansi'))->orderBy('id', 'DESC')
                    ->get();
                $count = Kependudukan::where('id_instansi', '=', $request->get('id_instansi'))->orderBy('id', 'DESC')
                    ->get()->count();
            }
            if ($request->filled('instansi')) {
                $kependudukan = DB::table('db_kependudukan')
                    ->select(
                        'id_instansi',
                        'id_kelurahan',
                        'kelurahan',
                        'waktu',
                        'jmlh_penduduk_bln_lalu_l',
                        'jmlh_penduduk_bln_lalu_p',
                        DB::raw('sum(jmlh_penduduk_bln_lalu_l + jmlh_penduduk_bln_lalu_p) as total_penduduk_bln_lalu'),
                        'lahir_l',
                        'lahir_p',
                        DB::raw('sum(lahir_l + lahir_p) as total_lahir'),
                        'meninggal_l',
                        'meninggal_p',
                        DB::raw('sum(meninggal_l + meninggal_p) as total_meninggal'),
                        'datang_l',
                        'datang_p',
                        DB::raw('sum(datang_l + datang_p) as total_datang'),
                        'pindah_l',
                        'pindah_p',
                        DB::raw('sum(pindah_l + pindah_p) as total_pindah'),
                        'jmlh_penduduk_bln_ini_l',
                        'jmlh_penduduk_bln_ini_p',
                        DB::raw('sum(jmlh_penduduk_bln_ini_l + jmlh_penduduk_bln_ini_p) as total_penduduk_bln_ini'),
                    )
                    ->where('instansi', 'like', '%' . $request->get('instansi') . '%')->get();
            }
        }






        // $kependudukan = Kependudukan::query();

        // if ($request->has(['id_instansi', 'waktu'])) {
        //     $kependudukan = Kependudukan::where('id_instansi', '=', $request->get('id_instansi'))
        //         ->where('waktu', '=', $request->get('waktu'))
        //         ->orderBy('id', 'DESC')
        //         ->get();
        //     $count = Kependudukan::where('id_instansi', '=', $request->get('id_instansi'))
        //         ->where('waktu', '=', $request->get('waktu'))
        //         ->orderBy('id', 'DESC')
        //         ->get()->count();
        // }
        // if (!$request->input()) {
        //     $kependudukan = DB::table('db_kependudukan')->get();
        //     $count = DB::table('db_kependudukan')->get()->count();
        // } else {
        //     if ($request->isNotFilled('id_instansi')) {
        //         $kependudukan = Kependudukan::where('waktu', '=', $request->get('waktu'))->orderBy('id', 'DESC')
        //             ->get();
        //         $count = Kependudukan::where('waktu', '=', $request->get('waktu'))->orderBy('id', 'DESC')
        //             ->get()->count();
        //     }
        //     if ($request->isNotFilled('waktu')) {
        //         $kependudukan = Kependudukan::where('id_instansi', '=', $request->get('id_instansi'))->orderBy('id', 'DESC')
        //             ->get();
        //         $count = Kependudukan::where('id_instansi', '=', $request->get('id_instansi'))->orderBy('id', 'DESC')
        //             ->get()->count();
        //     }
        //     if ($request->filled('instansi')) {
        //         $kependudukan = Kependudukan::where('instansi', 'like', '%' . $request->get('instansi') . '%')->get();
        //     }
        // }

        // $kependudukan = DB::table('db_kependudukan')
        //     ->select(
        //         'kelurahan',
        //         'waktu',
        //         'jmlh_penduduk_bln_lalu_l',
        //         'jmlh_penduduk_bln_lalu_p',
        //         DB::raw('sum(jmlh_penduduk_bln_lalu_l + jmlh_penduduk_bln_lalu_p) as total_penduduk_bln_lalu'),
        //         'lahir_l',
        //         'lahir_p',
        //         DB::raw('sum(lahir_l + lahir_p) as total_lahir'),
        //         'meninggal_l',
        //         'meninggal_p',
        //         DB::raw('sum(meninggal_l + meninggal_p) as total_meninggal'),
        //         'datang_l',
        //         'datang_p',
        //         DB::raw('sum(datang_l + datang_p) as total_datang'),
        //         'pindah_l',
        //         'pindah_p',
        //         DB::raw('sum(pindah_l + pindah_p) as total_pindah'),
        //         'jmlh_penduduk_bln_ini_l',
        //         'jmlh_penduduk_bln_ini_p',
        //         DB::raw('sum(jmlh_penduduk_bln_ini_l + jmlh_penduduk_bln_ini_p) as total_jumlah_penduduk_bln_ini'),
        //     )
        //     ->groupBy('id')->orderBy('id', 'DESC')->get();
        // return response(['data' => $kependudukan], 200);
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
            'id_instansi' => 'required',
            'id_kelurahan' => 'required',
            'instansi' => 'required|string',
            'kelurahan' => 'required|string',
            'jmlh_penduduk_bln_lalu_l' => 'required',
            'jmlh_penduduk_bln_lalu_p' => 'required',
            'jmlh_penduduk_bln_lalu_l_p' => 'required',
            'lahir_l' => 'required',
            'lahir_p' => 'required',
            'lahir_l_p' => 'required',
            'meninggal_l' => 'required',
            'meninggal_p' => 'required',
            'meninggal_l_p' => 'required',
            'datang_l' => 'required',
            'datang_p' => 'required',
            'datang_l_p' => 'required',
            'pindah_l' => 'required',
            'pindah_p' => 'required',
            'pindah_l_p' => 'required',
            'jmlh_penduduk_bln_ini_l' => 'required',
            'jmlh_penduduk_bln_ini_p' => 'required',
            'jmlh_penduduk_bln_ini_l_p' => 'required',
            'waktu' => 'required',
        ]);

        if ($validator->fails()) {
            return response(['errors' => $validator->errors()->all()], 400);
        }

        $response = Kependudukan::create($request->all());
        return response($response, 201);
    }

    public function export(Request $request)
    {
        if (!$request->input()) {
            return Excel::download(new KependudukanExportAll, 'Rekapitulasi_Laporan_Kependudukan_' . date('d_m_Y_H_m', time() + 7 * 60 * 60) . '.xlsx');
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
        //
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
