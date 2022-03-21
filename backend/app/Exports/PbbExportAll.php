<?php

namespace App\Exports;

use App\PBB;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithColumnFormatting;
use Maatwebsite\Excel\Concerns\WithColumnWidths;
use Maatwebsite\Excel\Concerns\WithCustomStartCell;
use Maatwebsite\Excel\Concerns\WithEvents;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Events\AfterSheet;
use PhpOffice\PhpSpreadsheet\Style\Alignment;
use PhpOffice\PhpSpreadsheet\Style\NumberFormat;
use PhpOffice\PhpSpreadsheet\Worksheet\Worksheet;
use PhpOffice\PhpSpreadsheet\Worksheet\PageSetup;

class PbbExportAll implements FromCollection, WithHeadings, WithEvents, WithColumnFormatting, WithColumnWidths, WithCustomStartCell
{
    /**
     * @return \Illuminate\Support\Collection
     */
    public function collection()
    {
        return PBB::select('instansi', 'kelurahan', PBB::raw("DATE_FORMAT(db_realisasi_pbb.waktu, '%b-%Y')"), 'target_pbb', 'realisasi_bln_lalu', 'realisasi_bln_ini', 'jmlh_realisasi', 'sisa_target', 'keterangan')
            ->orderBy('id', 'DESC')->get();
    }

    public function headings(): array
    {
        return [

            ['Laporan Realisasi PBB'],

            ['Kecamatan', 'Kelurahan', 'Periode', ' Target PBB', 'Realisasi Bulan yang Lalu', 'Realisasi Bulan Ini', 'Jumlah Realisasi S/D Bulan Ini', 'Sisa Target', 'Keterangan (%)'],

        ];
    }
    public function registerEvents(): array
    {
        return [
            AfterSheet::class => function (AfterSheet $event) {

                $event->sheet->getStyle('A3:I3')->applyFromArray([
                    'font' => [
                        'bold' => true,

                    ]
                ]);
                $event->sheet->getStyle('A4:I4')->applyFromArray([
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
                $event->sheet->getStyle('A3')->applyFromArray($style);
                $event->sheet->getStyle('4')->applyFromArray($style);
                $event->sheet->mergeCells('A3:I3');
                $event->sheet->getStyle('A1:I2')->applyFromArray([
                    'borders' => [
                        'allBorders' => [
                            'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_NONE,
                            'color' => ['argb' => 'FFFFFF'],
                        ],
                    ],
                ]);
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
    public function startCell(): string
    {
        return 'A3';
    }
}
