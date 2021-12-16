<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <title>Download Laporan Keadaan Bencana Alam - SIMAK Kabupaten Pandeglang</title>
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
  font-size: 11pt;
  width: 1px;
  font-weight: normal;
  white-space: nowrap;
 
}
th span {
    transform: rotate(-90deg)
}

.table tbody td {
  border: solid 1px;
  font-size: 11pt;
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

                <li style="list-style-type: none; font-size: 16pt; font-weight: bold">Laporan Keadaan Bencana Alam</li>
                <li style="list-style-type: none; font-size: 16pt; font-weight: bold">Bulan  {{$bln[$per->bulan]}} Tahun {{$per->tahun}}</li>
                <p></p>
                
        </center>
        <br/>
        <div style="list-style-type: none; font-size: 14pt; font-weight: bold">
            @foreach ($kecamatan as $kec)
            <li>Pemerintah Kabupaten Pandeglang</li>
            <li>{{$kec->nama_instansi}}</li>

    </div>
<div class="table-responsive" style="margin-top: 20px">
    <table class="table table-bordered table-sm" align="center" style="width: 100%">
        <thead>
        <tr>
            <th rowspan="3" style="border-left: 2px black; border-top: 2px black; border: black">No</th>
            <th rowspan="3" style="white-space: nowrap; border-top: 2px black; border: black">Desa/Kelurahan</th>
            <th colspan="2" style="white-space: nowrap; border-top: 2px black; border-bottom: 1px black; border: black">Jumlah<br>Penduduk</th>
            <th colspan="3" style="white-space: nowrap; border-top: 2px black; border-bottom: 1px black; border: black">Rumah<br>Tinggal</th>
            <th colspan="15" style="white-space: nowrap; border-top: 2px black; border-bottom: 1px black; border: black">Jenis Bangunan</th>
            <th colspan="3" style="white-space: nowrap; border-top: 2px black; border-bottom: 1px black; border: black">Korban Manusia</th>
            <th rowspan="3" style="white-space: nowrap; border-top: 2px black; border-bottom: 1px black; border-right: 2px black; border: black">Perkiraan <br> Kerugian (Rp)</th>
          </tr>
          <tr>
            <th rowspan="2" style="border: black">KK</th>
            <th rowspan="2" style="border: black">Jiwa</th>
            <th rowspan="2" style="border: black">RB</th>
            <th rowspan="2" style="border: black">RS</th>
            <th rowspan="2" style="border: black">RR</th>
            <th colspan="3" style="border: black">Kantor</th>
            <th colspan="3" style="border: black">
              Sarana <br />
              Pendidikan
            </th>
            <th colspan="3" style="border: black">
              Tempat <br />
              Ibadah
            </th>
            <th colspan="3" style="border: black">Jembatan</th>
            <th colspan="3" style="border: black">Lainnya</th>
            <th rowspan="2" style="border: black">Mende<br>rita</th>
            <th rowspan="2" style="border: black">Luka<br>Ringan</th>
            <th rowspan="2" style="border: black">Mening<br>gal</th>
          </tr>
          <tr>
            <th style="border: black">RB</th>
            <th style="border: black">RS</th>
            <th style="border: black">RR</th>
            <th style="border: black">RB</th>
            <th style="border: black">RS</th>
            <th style="border: black">RR</th>
            <th style="border: black">RB</th>
            <th style="border: black">RS</th>
            <th style="border: black">RR</th>
            <th style="border: black">RB</th>
            <th style="border: black">RS</th>
            <th style="border: black">RR</th>
            <th style="border: black">RB</th>
            <th style="border: black">RS</th>
            <th style="border: black">RR</th>
          </tr>
          <tr style="text-align: center; background-color: #A9A9A9">
                <th style="border: black">1</th>
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
                <th style="border: black">13</th>
                <th style="border: black">14</th>
                <th style="border: black">15</th>
                <th style="border: black">16</th>
                <th style="border: black">17</th>
                <th style="border: black">18</th>
                <th style="border: black">19</th>
                <th style="border: black">20</th>
                <th style="border: black">21</th>
                <th style="border: black">22</th>
                <th style="border: black">23</th>
                <th style="border: black">24</th>
                <th style="border: black">25</th>
                <th style="border: black">26</th>
            </tr>
        </thead>
        <tbody>
            @php $i=1 @endphp
            @foreach($bencana as $item)
            <tr>
                <td style="text-align: center; border-left: 2px black; border: black">{{ $i++ }}</td>
                <td style="width: 12%; border: black">{{$item->kelurahan}}</td>
                <td class="item" style="text-align: center; border: black">{{$item->jmlh_kk}}</td>
                <td class="item" style="text-align: center; border: black">{{$item->jmlh_jiwa}}</td>
                <td class="item" style="text-align: center; border: black">{{$item->rumah_rusak_berat}}</td>
                <td class="item" style="text-align: center; border: black">{{$item->rumah_rusak_sedang}}</td>
                <td class="item" style="text-align: center; border: black">{{$item->rumah_rusak_ringan}}</td>
                <td class="item" style="text-align: center; border: black">{{$item->kantor_rusak_berat}}</td>
                <td class="item" style="text-align: center; border: black">{{$item->kantor_rusak_sedang}}</td>
                <td class="item" style="text-align: center; border: black">{{$item->kantor_rusak_ringan}}</td>
                <td class="item" style="text-align: center; border: black">{{$item->pendidikan_rusak_berat}}</td>
                <td class="item" style="text-align: center; border: black">{{$item->pendidikan_rusak_sedang}}</td>
                <td class="item" style="text-align: center; border: black">{{$item->pendidikan_rusak_ringan}}</td>
                <td class="item" style="text-align: center; border: black">{{$item->ibadah_rusak_berat}}</td>
                <td class="item" style="text-align: center; border: black">{{$item->ibadah_rusak_sedang}}</td>
                <td class="item" style="text-align: center; border: black">{{$item->ibadah_rusak_ringan}}</td>
                <td class="item" style="text-align: center; border: black">{{$item->jembatan_rusak_berat}}</td>
                <td class="item" style="text-align: center; border: black">{{$item->jembatan_rusak_sedang}}</td>
                <td class="item" style="text-align: center; border: black">{{$item->jembatan_rusak_ringan}}</td>
                <td class="item" style="text-align: center; border: black">{{$item->lainnya_rusak_berat}}</td>
                <td class="item" style="text-align: center; border: black">{{$item->lainnya_rusak_sedang}}</td>
                <td class="item" style="text-align: center; border: black">{{$item->lainnya_rusak_ringan}}</td>
                <td class="item" style="text-align: center; border: black">{{$item->korban_menderita}}</td>
                <td class="item" style="text-align: center; border: black">{{$item->korban_luka}}</td>
                <td class="item" style="text-align: center; border: black">{{$item->korban_meninggal}}</td>
                <td style="width: 10%; text-align: center; border: black; border-right: 2px black">Rp. {{number_format($item->kerugian)}}</td>
            </tr>
            @endforeach
        </tbody>
        <tbody>
            @foreach ($count as $cnt)

            <tr style="text-align: center; font-weight: bold">
                <td colspan="2" style="border: 2px black">Jumlah</td>
                <td style="text-align: center; border: 2px black">{{$cnt->total_kk}}</td>
                <td style="text-align: center; border: 2px black">{{$cnt->total_jiwa}}</td>
                <td style="text-align: center; border: 2px black">{{$cnt->total_rumah_rusak_berat}}</td>
                <td style="text-align: center; border: 2px black">{{$cnt->total_rumah_rusak_sedang}}</td>
                <td style="text-align: center; border: 2px black">{{$cnt->total_rumah_rusak_ringan}}</td>
                <td style="text-align: center; border: 2px black">{{$cnt->total_kantor_rusak_berat}}</td>
                <td style="text-align: center; border: 2px black">{{$cnt->total_kantor_rusak_sedang}}</td>
                <td style="text-align: center; border: 2px black">{{$cnt->total_kantor_rusak_ringan}}</td>
                <td style="text-align: center; border: 2px black">{{$cnt->total_pendidikan_rusak_berat}}</td>
                <td style="text-align: center; border: 2px black">{{$cnt->total_pendidikan_rusak_sedang}}</td>
                <td style="text-align: center; border: 2px black">{{$cnt->total_pendidikan_rusak_ringan}}</td>
                <td style="text-align: center; border: 2px black">{{$cnt->total_ibadah_rusak_berat}}</td>
                <td style="text-align: center; border: 2px black">{{$cnt->total_ibadah_rusak_sedang}}</td>
                <td style="text-align: center; border: 2px black">{{$cnt->total_ibadah_rusak_ringan}}</td>
                <td style="text-align: center; border: 2px black">{{$cnt->total_jembatan_rusak_berat}}</td>
                <td style="text-align: center; border: 2px black">{{$cnt->total_jembatan_rusak_sedang}}</td>
                <td style="text-align: center; border: 2px black">{{$cnt->total_jembatan_rusak_ringan}}</td>
                <td style="text-align: center; border: 2px black">{{$cnt->total_lainnya_rusak_berat}}</td>
                <td style="text-align: center; border: 2px black">{{$cnt->total_lainnya_rusak_sedang}}</td>
                <td style="text-align: center; border: 2px black">{{$cnt->total_lainnya_rusak_ringan}}</td>
                <td style="text-align: center; border: 2px black">{{$cnt->total_korban_menderita}}</td>
                <td style="text-align: center; border: 2px black">{{$cnt->total_korban_luka}}</td>
                <td style="text-align: center; border: 2px black">{{$cnt->total_korban_meninggal}}</td>
                <td style="text-align: center; border: 2px black">Rp. {{number_format($cnt->total_kerugian)}}</td>
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
    <div style="position:absolute; left:0pt; width:300pt; font-size: 13pt" class="text-center">
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
        <div class="text-center" style="position:absolute; right:0pt; width:300pt; font-size: 13pt">
            <p>{{$kec->nama_instansi}}, {{$bln[$per->bulan]}} {{$per->tahun}}</p>
            <p>KASI TRANTIB</p>
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
    @endforeach
            @endif
            @endforeach
</body>
</html>
