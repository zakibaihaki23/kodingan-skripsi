<?php

namespace App\Exports;

use App\Kependudukan;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use Maatwebsite\Excel\Concerns\WithColumnFormatting;
use Maatwebsite\Excel\Concerns\WithColumnWidths;
use Maatwebsite\Excel\Concerns\WithEvents;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithMapping;
use Maatwebsite\Excel\Events\AfterSheet;
use PhpOffice\PhpSpreadsheet\Shared\Date;
use PhpOffice\PhpSpreadsheet\Style\Alignment;
use PhpOffice\PhpSpreadsheet\Style\NumberFormat;
use PhpOffice\PhpSpreadsheet\Worksheet\Worksheet;

class KependudukanExportAll implements
    FromCollection,
    WithHeadings,
    ShouldAutoSize,
    WithEvents,
    WithColumnWidths
{


    /**
     * @return \Illuminate\Support\Collection
     */
    public function collection()
    {
        return DB::table('db_kependudukan')
            ->select(
                'instansi',
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
            ->groupBy('id')
            ->orderBy('id', 'DESC')->get();
    }

    public function headings(): array
    {
        return [
            ['Laporan Kependudukan'],

            ['Kecamatan', 'Kelurahan', 'Periode', 'Jumlah Penduduk Awal Bulan Lalu', '', '', 'Lahir', '', '', 'Meninggal', '', '', 'Datang', '', '', 'Pindah', '', '', 'Jumlah Penduduk Bulan Ini', '', ''],
            [' ', ' ', ' ', 'L', 'P', 'L+P', 'L', 'P', 'L+P', 'L', 'P', 'L+P', 'L', 'P', 'L+P', 'L', 'P', 'L+P', 'L', 'P', 'L+P']

        ];
    }
    public function registerEvents(): array
    {
        return [
            AfterSheet::class => function (AfterSheet $event) {
                $event->sheet->getStyle('A1:I1')->applyFromArray([
                    'font' => [
                        'bold' => true,
                        'size' => 20
                    ]
                ]);
                $event->sheet->getStyle('A2:S2')->applyFromArray([
                    'font' => [
                        'bold' => true,
                        'size' => 16
                    ]
                ]);
                $event->sheet->getStyle('4:999')->applyFromArray([
                    'font' => [
                        'size' => 13
                    ]
                ]);
                $event->sheet->getStyle('3')->applyFromArray([
                    'font' => [
                        'bold' => true,
                        'size' => 16
                    ]
                ]);
                $style = array(
                    'alignment' => array(
                        'horizontal' => Alignment::VERTICAL_CENTER,
                    )
                );

                $event->sheet->getStyle('A1')->applyFromArray($style);
                $event->sheet->getStyle('A2:C3')->getAlignment()->applyFromArray(
                    array(
                        'vertical' => Alignment::VERTICAL_CENTER,
                        'horizontal' => Alignment::HORIZONTAL_CENTER
                    )
                );
                $event->sheet->getStyle('3')->applyFromArray($style);
                $event->sheet->getStyle('D2:S2')->applyFromArray($style);
                $event->sheet->getStyle('C4:U150')->applyFromArray($style);
                $event->sheet->mergeCells('A1:U1');
                $event->sheet->mergeCells('A2:A3');
                $event->sheet->mergeCells('B2:B3');
                $event->sheet->mergeCells('C2:C3');
                $event->sheet->mergeCells('D2:F2');
                $event->sheet->mergeCells('G2:I2');
                $event->sheet->mergeCells('J2:L2');
                $event->sheet->mergeCells('M2:O2');
                $event->sheet->mergeCells('P2:R2');
                $event->sheet->mergeCells('S2:U2');
                // $event->sheet->getStyle('A1:U150')->applyFromArray([
                //     'borders' => [
                //         'allBorders' => [
                //             'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
                //             'color' => ['argb' => '000000'],
                //         ],
                //     ],
                // ]);
            }

        ];
    }
    public function styles(Worksheet $sheet)
    {
    }

    public function columnWidths(): array
    {
        return [
            'D' => 16,
            'E' => 16,
            'F' => 16,
            'G' => 7,
            'H' => 7,
            'I' => 7,
            'J' => 7,
            'K' => 7,
            'L' => 7,
            'M' => 7,
            'N' => 7,
            'O' => 7,
            'P' => 7,
            'Q' => 7,
            'R' => 7,
            'S' => 13,
            'T' => 13,
            'U' => 13,
        ];
    }
}
