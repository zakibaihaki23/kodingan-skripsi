<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <title>Download Laporan PATEN - SIMAK Kabupaten Pandeglang</title>
</head>
<body>
    <style type="text/css">
.table {
  table-layout: fixed;
  border: solid 1p;
  border-collapse: collapse;
  border-spacing: 0;
}
table tr:not(:first-child) th {
  display: inline-block;
  -webkit-writing-mode: vertical-rl;
  -ms-writing-mode: tb-rl;
  writing-mode: vertical-rl;
}


.table thead th {
  border: solid 1px;
  /*padding: 30px;*/
  text-align: center;
  vertical-align: middle;
  font-size: 10pt;
  width: 1px;
  font-weight: normal;
  white-space: nowrap;
 
}
th span {
    transform: rotate(-90deg)
}

.table tbody td {
  border: solid 1px;
  font-size: 10pt;
  width: 1px;
  white-space: nowrap;
}
td.item {
    text-align: center;
    white-space: nowrap;
}
@font-face {
    font-family: Arial, Helvetica, sans-serif
}
#rotate
{
  height:200px;
  width: 30px
}

#vertical
{
    -webkit-transform:rotate(-90deg);
    -moz-transform:rotate(-90deg);
    -o-transform: rotate(-90deg);
    margin-left: -50px;
    margin-right: -50px;
}

	</style>
	<div>
        <center>
        @foreach ($periode as $waktu => $per)
                <li style="list-style-type: none;">Rekapitulasi Pelayanan Administrasi Terpadu Kecamatan (PATEN)</li>
                <li style="list-style-type: none;">Bulan  {{ \Carbon\Carbon::parse($per->periode)->translatedFormat('F') }} 
                    Tahun {{ \Carbon\Carbon::parse($per->periode)->translatedFormat('Y') }}
                </li>
                <p></p>
                
        </center>
        <br/>
        <div style="list-style-type: none; font-size: 12px">
            @foreach ($kecamatan as $kec)
            <li>Pemerintah Kabupaten Pandeglang</li>
            <li>{{$kec->nama_instansi}}</li>

    </div>
<div class="table-responsive" style="margin-top: 20px">
    <table class="table table-bordered table-sm" align="center" style="width: 100%">
        <thead>
            <tr>
                <th rowspan="2">No</th>
                <th rowspan="2" style="white-space: normal">Desa / Kelurahan</th>
                <th colspan="13">Jumlah Pelayanan Non Perizinan</th>
                <th colspan="5">Jumlah Pelayanan Perizinan</th>
                <th rowspan="2">Keterangan</th>
                
            </tr>
            <tr>
               <th id="rotate"> <div id="vertical"> Perekaman Data KTP-E </div></th>
               <th id="rotate"> <div id="vertical"> Pengantar Kartu Keluraga (KK) </div></th>
               <th id="rotate"> <div id="vertical"> Keterangan Pindah </div></th>
               <th id="rotate"> <div id="vertical"> Keterangan Domisili </div></th>
               <th id="rotate"> <div id="vertical"> Pengantar Akte Kelahiran </div></th>
               <th id="rotate"> <div id="vertical"> Pencatatan Lahir/Mati </div></th>
               <th id="rotate"> <div id="vertical"> Pencatatan Perkawinan </div></th>
               <th id="rotate"> <div id="vertical"> Pencatatan Perceraian </div></th>
               <th id="rotate"> <div id="vertical"> Pengantar Catatan Kepolisian<br>(SKCK) </div></th>
               <th id="rotate"> <div id="vertical"> Keterangan Tidak Mampu<br>(SKTM) </div></th>
               <th id="rotate"> <div id="vertical"> Rekomendasi </div></th>
               <th id="rotate"> <div id="vertical"> Legalisasi Umum </div></th>
               <th id="rotate"> <div id="vertical"> Keterangan/Pengantar Lainnya </div></th>
               <th id="rotate"> <div id="vertical"> Izin Mendirikan Bangunan (IMB), <br> Luas &lt;100 m2  </div></th>
               <th id="rotate"> <div id="vertical"> Izin Usaha Perdagangan<br>(SITU/SIUP), Modal &lt;50.000.000 </div></th>
               <th id="rotate"> <div id="vertical"> Izin Merobohkan Bangunan,<br> Luas &lt;100 m2 </div></th>
               <th id="rotate"> <div id="vertical"> Izin Keramaian </div></th>
               <th id="rotate"> <div id="vertical"> Izin Domisili Partai </div></th>
               

            </tr>
        </thead>
        <tbody>
            @php $i=1 @endphp
            @foreach($paten as $item)
            <tr>
                
                @if($item->kelurahan == null) {
                    <td style="font-weight: bold; font-size: 20pt" 
                      colspan="21" 
                      class="text-center">
                      NIHIL
                    </td>
                } @else {
                    <td style="text-align: center">{{ $i++ }}</td>
                    <td style="width: 15%">{{$item->kelurahan}}</td>
                    <td class="item">{{number_format($item->perekaman_ktp)}}</td>
                    <td class="item">{{number_format($item->pengantar_kk)}}</td>
                    <td class="item">{{number_format($item->ket_pindah)}}</td>
                    <td class="item">{{number_format($item->ket_domisili)}}</td>
                    <td class="item">{{number_format($item->pengantar_akta_lahir)}}</td>
                    <td class="item">{{number_format($item->pengantar_akta_mati)}}</td>
                    <td class="item">{{number_format($item->pencatatan_perkawinan)}}</td>
                    <td class="item">{{number_format($item->pencatatan_perceraian)}}</td>
                    <td class="item">{{number_format($item->skck)}}</td>
                    <td class="item">{{number_format($item->sktm)}}</td>
                    <td class="item">{{number_format($item->rekomendasi)}}</td>
                    <td class="item">{{number_format($item->legalisasi)}}</td>
                    <td class="item">{{number_format($item->ket_lain)}}</td>
                    <td class="item">{{number_format($item->imb)}}</td>
                    <td class="item">{{number_format($item->situ_siup)}}</td>
                    <td class="item">{{number_format($item->izin_merobohkan_bangunan)}}</td>
                    <td class="item">{{number_format($item->izin_keramaian)}}</td>
                    <td class="item">{{number_format($item->izin_partai)}}</td>
                    <td style="width: 15%; white-space: nowrap; text-align: left">{{$item->keterangan}}</td>
                }
                @endif

            </tr>
            @endforeach
        </tbody>
        <tbody>
            @foreach ($count as $cnt)

            <tr style="text-align: center; font-weight: bold">
                <td colspan="2" >Jumlah</td>
                <td>{{number_format($cnt->total_perekaman_ktp)}}</td>
                <td>{{number_format($cnt->total_pengantar_kk)}}</td>
                <td>{{number_format($cnt->total_ket_pindah)}}</td>
                <td>{{number_format($cnt->total_ket_domisili)}}</td>
                <td>{{number_format($cnt->total_pengantar_akta_lahir)}}</td>
                <td>{{number_format($cnt->total_pengantar_akta_mati)}}</td>
                <td>{{number_format($cnt->total_pencatatan_perkawinan)}}</td>
                <td>{{number_format($cnt->total_pencatatan_perceraian)}}</td>
                <td>{{number_format($cnt->total_skck)}}</td>
                <td>{{number_format($cnt->total_sktm)}}</td>
                <td>{{number_format($cnt->total_rekomendasi)}}</td>
                <td>{{number_format($cnt->total_legalisasi)}}</td>
                <td>{{number_format($cnt->total_ket_lain)}}</td>
                <td>{{number_format($cnt->total_imb)}}</td>
                <td>{{number_format($cnt->total_situ_siup)}}</td>
                <td>{{number_format($cnt->total_izin_merobohkan_bangunan)}}</td>
                <td>{{number_format($cnt->total_izin_keramaian)}}</td>
                <td>{{number_format($cnt->total_izin_partai)}}</td>
                <td></td>
            </tr>
            @endforeach
        </tbody>
    </table>
</div>

</div>
    <div style="clear:both; position:relative;">
    <div style="position:absolute; left:0pt; width:192pt; font-size: 13px" class="text-center">
            <p>Mengetahui</p>
            <p>Camat {{$kec->nama_instansi}}</p>
        <br>
        <p style="text-decoration: underline;margin-top: 20px;">
        ..................................................
        </p>
        <div class="text-center">
        <p>
        NIP..................................................
        </p>
        </div>
        </div>
        <div class="col text-right" style="font-size: 13px">
            <p>{{$kec->nama_instansi}}, 
                {{ \Carbon\Carbon::now()->translatedFormat('d F Y') }} 
            </p>
            <p style="margin-right: 30px">Sekretaris Kecamatan</p>
            <br>
            <p style="margin-top: 20px; text-decoration: underline; margin-right: 4px">
            ..................................................
            </p>
        <div class="text-right">
        <p style="margin-right: 8px">
        NIP..................................................
        </p>
        </div>
    </div>
    @endforeach
            @endforeach
</body>
</html>
