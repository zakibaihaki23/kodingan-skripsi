<?php

namespace App\Exports;

use App\PBB;
use Maatwebsite\Excel\Concerns\Exportable;
use Maatwebsite\Excel\Concerns\FromQuery;
use Maatwebsite\Excel\Concerns\WithColumnFormatting;
use Maatwebsite\Excel\Concerns\WithColumnWidths;
use Maatwebsite\Excel\Concerns\WithEvents;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Events\AfterSheet;
use PhpOffice\PhpSpreadsheet\Worksheet\Worksheet;
use PhpOffice\PhpSpreadsheet\Worksheet\PageSetup;
use PhpOffice\PhpSpreadsheet\Style\Alignment;
use PhpOffice\PhpSpreadsheet\Style\NumberFormat;

class PbbWaktuExport implements FromQuery, WithHeadings, WithEvents, WithColumnFormatting, WithColumnWidths
{
    use Exportable;

    function __construct($waktu)
    {
        $this->waktu = $waktu;
    }
    /**
     * @return \Illuminate\Support\Collection
     */
    public function query()
    {
        return PBB::select('instansi', 'kelurahan', PBB::raw("DATE_FORMAT(db_realisasi_pbb.waktu, '%b-%Y')"), 'target_pbb', 'realisasi_bln_lalu', 'realisasi_bln_ini', 'jmlh_realisasi', 'sisa_target', 'keterangan')
            ->where('waktu', '=', $this->waktu)->orderBy('id', 'DESC');


        // $pbb = DB::table('db_realisasi_pbb')->where('id_instansi', '=', $this->id)->select('instansi', 'kelurahan', 'target_pbb', 'realisasi_bln_lalu', 'realisasi_bln_ini', 'jmlh_realisasi', 'sisa_target', 'keterangan')->orderBy('id')->get();
        // return $pbb;
    }

    public function headings(): array
    {
        return [
            ['Laporan Realisasi PBB'],

            ['Kecamatan', 'Kelurahan', 'Periode', ' Target PBB', 'Realisasi Bulan yang Lalu', 'Realisasi Bulan Ini', 'Jumlah Realisasi S/D Bulan Ini', 'Sisa Target', 'Keterangan (%)']

        ];
    }
    public function registerEvents(): array
    {
        return [
            AfterSheet::class => function (AfterSheet $event) {
                $event->sheet->getStyle('A1:I1')->applyFromArray([
                    'font' => [
                        'bold' => true,

                    ]
                ]);
                $event->sheet->getStyle('A2:I2')->applyFromArray([
                    'font' => [
                        'bold' => true,

                    ]
                ]);
                $event->sheet->getStyle('4:999')->applyFromArray([
                    'font' => []
                ]);
                $style = array(
                    'alignment' => array(
                        'vertical' => Alignment::HORIZONTAL_CENTER,
                        'horizontal' => Alignment::HORIZONTAL_CENTER
                    )
                );
                $event->sheet->getStyle('A1')->applyFromArray($style);
                $event->sheet->getStyle('2')->applyFromArray($style);
                $event->sheet->mergeCells('A1:I1');
                // $event->sheet->getStyle('A1:I150')->applyFromArray([
                //     'borders' => [
                //         'allBorders' => [
                //             'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
                //             'color' => ['argb' => '000000'],
                //         ],
                //     ],
                // ]);
                $event->sheet->getDelegate()->getPageSetup()
                    ->setOrientation(PageSetup::ORIENTATION_LANDSCAPE)
                    ->setPaperSize(PageSetup::PAPERSIZE_B4);
            }

        ];
    }
    public function styles(Worksheet $sheet)
    {
    }
    public function columnWidths(): array
    {
        return [
            'A' => '20',
            'B' => '22',
            'C' => '12',
            'E' => '25',
            'F' => '20',
            'G' => '14',
            'H' => '12',
            'I' => '20'
        ];
    }

    public function columnFormats(): array
    {
        return [
            'C' => NumberFormat::FORMAT_DATE_DDMMYYYY
        ];
    }
}
