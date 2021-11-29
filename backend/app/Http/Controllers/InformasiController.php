<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Informasi;
use Illuminate\Support\Facades\Validator;

class InformasiController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
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

    public function addInformasi(Request $request) 
    {
         $validator = Validator::make($request->all(), [
            'informasi' => 'required|string',
            'waktu' => 'required',
        ],
        [
            'informasi.required' => 'Isi informasi yang ingin disampaikan',
            'waktu.required' => 'Tentukan tanggal informasi yang ingin disampaikan',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 400);
        }

        Informasi::create($request->all());
        $response = ["message" => "Data berhasil disimpan"];
        return response($response, 201);
    }
    public function filterInformasi(Request $request) 
    {
        
            if ($request->filled(['instansi_id'])) {
                $informasi = Informasi::where('instansi_id', '=', $request->get('instansi_id'))
                    ->take(5)
                    ->orderBy('waktu','DESC')
                    ->get();
                $count = Informasi::where('instansi_id', '=', $request->get('instansi_id'))
                    ->take(5)
                    ->count();
            } 
            // else {
            //         $informasi = Informasi::where('waktu', '=', $request->get('waktu'))->orderBy('id', 'DESC')
            //             ->get();
            //         $count = Informasi::where('waktu', '=', $request->get('waktu'))->orderBy('id', 'DESC')
            //             ->get()->count();
            // }
            
           
        
            return response(['data' => $informasi, 'total' => $count], 200);
            // if ($request->filled(['id_instansi', 'waktu', 'id_kelurahan'])) {
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
            // }
        
    }
}
