<?php

namespace App\Http\Controllers;

use App\Akta;
use Illuminate\Http\Request;

class AktaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
       
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
    public function createAkta(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'instansi_id' => 'required',
            'kelurahan' => 'string|required',
            'nomor_ppat' => 'string|required',
            'tanggal_ppat' => 'required',
            'nama_ppat' => 'string',
            'npwp' => 'string',
            'nomor_akta' => 'string',
            'tanggal_akta' => 'required',
            'letak_tanah' => 'string',
            'status_hak' => 'string',
            'nama_pengalih' => 'string',
            'nama_peroleh' => 'string',
            'nama_perolahan' => 'string',
            'luas_tanah' => 'string',
            'luas_bangunan' => 'string',
            'pbb_nop' => 'string',
            'pbb_njop' => 'string',
            'harga_transaksi' => 'string',
            'sbb_tanggal' => 'string',
            'sbb_rp' => 'string',
            'ssp_tanggal' => 'string',
            'ssp_rp' => 'string',
            'keterangan' => 'string',
            

        ]);
        $valid = Validator::make($request->all(), [
            'periode' =>  'required|unique_with:db_pembuatan_akta, instansi_id'
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()->all()], 422);
        }
        if ($valid->fails()) {
            return response()->json(['errors' => $valid->errors()->all()], 400);
        }

        Akta::create($request->all());
        $response = ["message" => "Data berhasil disimpan"];
        return response($response, 201);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Akta  $akta
     * @return \Illuminate\Http\Response
     */
    public function show(Akta $akta)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Akta  $akta
     * @return \Illuminate\Http\Response
     */
    public function edit(Akta $akta)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Akta  $akta
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Akta $akta)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Akta  $akta
     * @return \Illuminate\Http\Response
     */
    public function destroy(Akta $akta)
    {
        //
    }
}
