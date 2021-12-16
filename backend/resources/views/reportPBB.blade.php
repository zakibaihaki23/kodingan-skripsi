<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <title>Download Laporan PBB - SIMAK Kabupaten Pandeglang</title>
</head>
<body>
    <style type="text/css">
.table {
  border: solid 1p;
  border-collapse: collapse;
  border-spacing: 0;
}

.table thead th {
  border: solid 1px;
  /*padding: 30px;*/
  text-align: center;
  vertical-align: middle;
}

.table tbody td {
  border: solid 1px;
  font-size: 10pt;
}
@font-face {
    font-family: Arial, Helvetica, sans-serif
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

                <li style="font-weight: bolder; font-size: 18px; list-style-type: none;">Laporan Realisasi PBB Tahun {{$per->tahun}}</li>
                <li style="font-weight: bolder; font-size: 18px; list-style-type: none;">Bulan  {{$bln[$per->bulan]}}</li>
                <p></p>


		</center>
		<br/>
        <div style="list-style-type: none; font-weight: bold; ">
            @foreach ($kecamatan as $kec)
            <li>Pemerintah Kabupaten Pandeglang</li>
            <li>{{$kec->nama_instansi}}</li>

    </div>
<div class="table-responsive" style="margin-top: 20px">
    <table class="table table-bordered table-sm" align="center">
        <thead>
            <tr>
                <th>No</th>
                <th>Kelurahan</th>
                <th>Target PBB (Rp)</th>
                <th>Realisasi Bulan yang Lalu</th>
                <th>Realisasi Bulan ini</th>
                <th>Jumlah Realisasi s/d Bulan ini</th>
                <th>Sisa Target</th>
                <th>Keterangan (%)</th>

            </tr>
            <tr style="text-align: center; background-color: #A9A9A9">
                <th>1</th>
                <th>2</th>
                <th>3</th>
                <th>4</th>
                <th>5</th>
                <th>6</th>
                <th>7</th>
                <th>8</th>
            </tr>
        </thead>
        <tbody>
            @php $i=1 @endphp
            @foreach($pbb as $item)
            <tr>
                <td style="text-align: center">{{ $i++ }}</td>
                <td style="width: 20%">{{$item->kelurahan}}</td>
                <td>Rp. {{number_format($item->target_pbb)}}</td>
                <td>Rp. {{number_format($item->realisasi_bln_lalu)}}</td>
                <td>Rp. {{number_format($item->realisasi_bln_ini)}}</td>
                <td>{{$item->jmlh_realisasi}}</td>
                <td>Rp. {{number_format($item->sisa_target)}}</td>
                <td>{{$item->keterangan}}</td>

            </tr>
            @endforeach
        </tbody>
        <tbody>
            @foreach ($count as $cnt)

            <tr style="font-weight: bold;text-align: center">
                <td colspan="2" >Jumlah</td>
                <td>Rp. {{number_format($cnt->total_target)}}</td>
                <td>Rp. {{number_format($cnt->total_bln_lalu)}}</td>
                <td>Rp. {{number_format($cnt->total_bln_ini)}}</td>
                <td>{{$cnt->total_realisasi}}</td>
                <td>Rp. {{number_format($cnt->total_sisa)}}</td>
                <td></td>
            </tr>
            @endforeach
        </tbody>
    </table>
</div>
<div></div>
</div>
    <div style="clear:both; position:relative;">
    <div style="position:absolute; left:0pt; width:192pt" class="text-center">
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
        <div class="col text-right">
            <p>{{$kec->nama_instansi}}, {{$bln[$per->bulan]}} {{$per->tahun}}</p>
            <p style="margin-right: 100px">PAD</p>
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
@endif
@endforeach
</body>
</html>
