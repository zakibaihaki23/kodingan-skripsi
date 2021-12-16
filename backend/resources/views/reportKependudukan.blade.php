<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <title>Download Laporan Kependudukan - SIMAK Kabupaten Pandeglang</title>
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
.column {
  float: left;
  width: 33.33%;
 
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

	</style>
	<div>
        <center>
       

                
                <p></p>
                
        </center>
    <div class="row"> 
    @foreach ($periode as $waktu => $per)
            @php
            $bln = array (
                '01' => 'Januari',
                '02' => 'Februari',
                '03' => 'Maret',
                '04' => 'April',
                '05' => 'Mei',
                '06' => 'Juni',
                '07' => 'Juli',
                '08' => 'Agustus',
                '09' => 'September',
                '10' => 'Oktober',
                '11' => 'November',
                '12' => 'Desember'
        );
                        @endphp
                @if ($waktu == 0)
        @foreach ($kecamatan as $kec)  
        <div class="column" style="list-style-type: none;vertical-align: bottom; font-weight: bold; margin-top: 40px">
            <li>Pemerintah Kabupaten Pandeglang</li>
            <li>{{$kec->nama_instansi}}</li>
        </div>
        <div class="column text-center" style="list-style-type: none; font-weight: bold; font-size: 18pt; margin-top: 20px">
        <li>Laporan Kependudukan</li>
                <li>Bulan  {{$bln[$per->bulan]}} Tahun {{$per->tahun}}</li>
        </div>
        <div class="column text-right" style="list-style-type: none; font-weight: bold; margin-top: 35px; margin-right: 60px">
            <li style="border: 1px solid black; margin-left: 300px;" class="text-center">Lampiran B 5</li>
            <li style="border: 1px solid black; margin-left: 300px;" class="text-center">WNI + WNA</li>
         </div>
    </div>
<div class="table-responsive" style="margin-top: 20px">
    <table class="table table-bordered table-sm" align="center" style="width: 100%">
        <thead>
            <tr>
                <th rowspan="2" style="border-left: 2px black; border-top: 2px black; border: black">No</th>
                <th rowspan="2" style="white-space: nowrap; border-top: 2px black; border: black">Desa/Kelurahan</th>
                <th colspan="3" style="white-space: nowrap; border-top: 2px black; border-bottom: 2px black; border: black">Jumlah Penduduk Awal Bulan Lalu</th>
                <th colspan="3" style="white-space: nowrap; border-top: 2px black; border-bottom: 2px black; border: black">Lahir</th>
                <th colspan="3" style="white-space: nowrap; border-top: 2px black; border-bottom: 2px black; border: black">Meninggal</th>
                <th colspan="3" style="white-space: nowrap; border-top: 2px black; border-bottom: 2px black; border: black">Datang</th>
                <th colspan="3" style="white-space: nowrap; border-top: 2px black; border-bottom: 2px black; border: black">Pindah</th>
                <th colspan="3" style="white-space: nowrap; border-top: 2px black; border-bottom: 2px black; border-right: 2px black">Jumlah Penduduk Bulan Ini</th>
                
            </tr>
            <tr>
               <th style="border: black">L</th>
               <th style="border: black">P</th>
               <th style="border: black">L + P</th>
               <th style="border: black">L</th>
               <th style="border: black">P</th>
               <th style="border: black">L + P</th>
               <th style="border: black">L</th>
               <th style="border: black">P</th>
               <th style="border: black">L + P</th>
               <th style="border: black">L</th>
               <th style="border: black">P</th>
               <th style="border: black">L + P</th>
               <th style="border: black">L</th>
               <th style="border: black">P</th>
               <th style="border: black">L + P</th>
               <th style="border: black">L</th>
               <th style="border: black">P</th>
               <th style="border-right: 2px black; border: black">L + P</th>
            </tr>
            <tr style="text-align: center; background-color: #A9A9A9">
                <th style="border-left: 2px black; border: black">1</th>
                <th style="border: black">2</th>
                <th style="border: black">3</th>
                <th style="border: black">4</th>
                <th style="border: black">5</th>
                <th style="border: black">6</th>
                <th style="border: black">7</th>
                <th style="border: black">8</th>
                <th style="border: black">9</th>
                <th style="border: black">10</th>
                <th style="border: black">11</th>
                <th style="border: black">12</th>
                <th style="border: black">12</th>
                <th style="border: black">14</th>
                <th style="border: black">15</th>
                <th style="border: black">16</th>
                <th style="border: black">17</th>
                <th style="border: black">18</th>
                <th style="border: black">19</th>
                <th style="border-right: 2px black; border: black">20</th>
            </tr>
        </thead>
        <tbody>
            @php $i=1 @endphp
            @foreach($kependudukan as $item)
            <tr>
                <td style="text-align: center; border-left: 2px black; border: black">{{ $i++ }}</td>
                <td style="width: 15%; border: black">{{$item->kelurahan}}</td>
                <td style="text-align: center; width: 5%; border: black">{{$item->jmlh_penduduk_bln_lalu_l}}</td>
                <td style="text-align: center; width: 5%; border: black">{{$item->jmlh_penduduk_bln_lalu_p}}</td>
                <td style="text-align: center; width: 5%; border: black">{{$item->total_penduduk_bln_lalu}}</td>
                <td style="text-align: center; border: black">{{$item->lahir_l}}</td>
                <td style="text-align: center; border: black">{{$item->lahir_p}}</td>
                <td style="text-align: center; border: black">{{$item->total_lahir}}</td>
                <td style="text-align: center; border: black">{{$item->meninggal_l}}</td>
                <td style="text-align: center; border: black">{{$item->meninggal_p}}</td>
                <td style="text-align: center; border: black">{{$item->total_meninggal}}</td>
                <td style="text-align: center; border: black">{{$item->datang_l}}</td>
                <td style="text-align: center; border: black">{{$item->datang_p}}</td>
                <td style="text-align: center; border: black">{{$item->total_datang}}</td>
                <td style="text-align: center; border: black">{{$item->pindah_l}}</td>
                <td style="text-align: center; border: black">{{$item->pindah_p}}</td>
                <td style="text-align: center; border: black">{{$item->total_pindah}}</td>
                <td style="text-align: center; border: black">{{$item->jmlh_penduduk_bln_ini_l}}</td>
                <td style="text-align: center; border: black">{{$item->jmlh_penduduk_bln_ini_p}}</td>
                <td style="text-align: center; border: black; border-right: 2px black">{{$item->total_penduduk_bln_ini}}</td>
            </tr>
            @endforeach
        </tbody>
        <tbody>
            @foreach ($count as $cnt)

            <tr style="text-align: center; font-weight: bold">
                <td colspan="2" style="border: 2px black">Jumlah</td>
                <td style="text-align: center; border: 2px black">{{$cnt->total_penduduk_bln_lalu_l}}</td>
                <td style="text-align: center; border: 2px black">{{$cnt->total_penduduk_bln_lalu_p}}</td>
                <td style="text-align: center; border: 2px black">{{$cnt->total_penduduk_bln_lalu}}</td>
                <td style="text-align: center; border: 2px black">{{$cnt->total_lahir_l}}</td>
                <td style="text-align: center; border: 2px black">{{$cnt->total_lahir_p}}</td>
                <td style="text-align: center; border: 2px black">{{$cnt->total_lahir}}</td>
                <td style="text-align: center; border: 2px black">{{$cnt->total_meninggal_l}}</td>
                <td style="text-align: center; border: 2px black">{{$cnt->total_meninggal_p}}</td>
                <td style="text-align: center; border: 2px black">{{$cnt->total_meninggal}}</td>
                <td style="text-align: center; border: 2px black">{{$cnt->total_datang_l}}</td>
                <td style="text-align: center; border: 2px black">{{$cnt->total_datang_p}}</td>
                <td style="text-align: center; border: 2px black">{{$cnt->total_datang}}</td>
                <td style="text-align: center; border: 2px black">{{$cnt->total_pindah_l}}</td>
                <td style="text-align: center; border: 2px black">{{$cnt->total_pindah_p}}</td>
                <td style="text-align: center; border: 2px black">{{$cnt->total_pindah}}</td>
                <td style="text-align: center; border: 2px black">{{$cnt->total_penduduk_bln_ini_l}}</td>
                <td style="text-align: center; border: 2px black">{{$cnt->total_penduduk_bln_ini_p}}</td>
                <td style="text-align: center; border: 2px black">{{$cnt->total_penduduk_bln_ini}}</td>
            </tr>
            @endforeach
        </tbody>
    </table>
</div>
<!-- <div class="row">
    <div class="col-2 text-center">

        <ul style="font-size: 12px;list-style-type: none;margin-left: 30px">
            <li>Mengetahui,</li>
        </ul>
        <p style="font-size: 12px;margin-left: 30px; margin-bottom: 30px">Camat {{$kec->nama_instansi}}</p>
        <br>
        <ul style="list-style-type: none; margin-left: 15px; font-size: 12px">
            <li>{{$kec->pimpinan}}</li>
            <li>NIP 198918291829128</li>

           
        </ul>
    </div>
    <div class="col-10">
        
    </div>
    
    </div> -->
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
            <p>{{$kec->nama_instansi}}, {{$bln[$per->bulan]}} {{$per->tahun}}</p>
            <p style="margin-right: 40px">Kasi Pemerintahan</p>
            <br>
            <p style="margin-top: 20px; text-decoration: underline; margin-right: 4px">
            ..................................................
            </p>
        <div class="text-right">
        <p>
        NIP..................................................
        </p>
        </div>
    </div>
    @endforeach
            @endif
            @endforeach
</body>
</html>
