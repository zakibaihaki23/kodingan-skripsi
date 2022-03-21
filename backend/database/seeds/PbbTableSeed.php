<?php

use Illuminate\Database\Seeder;

class PbbTableSeed extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $pbb = [
            [   
               'instansi_id' => 3,
               'kelurahan' => 'Kelurahan Pandeglang',
               'target_pbb' => 100000,
               'realisasi_bln_lalu' => 20000,
               'realisasi_bln_ini' => 50000,
               'jmlh_realisasi' => 30000,
               'sisa_target' => 20000,
               'keterangan' => '',
               'periode' => '2021-11-01',
                'created_at' => new \DateTime,
                'updated_at' => null,
            ], 
            [   
                'instansi_id' => 4,
                'kelurahan' => 'Kelurahan Sukaratu',
                'target_pbb' => 100000,
                'realisasi_bln_lalu' => 20000,
                'realisasi_bln_ini' => 50000,
                'jmlh_realisasi' => 30000,
                'sisa_target' => 20000,
                'keterangan' => '',
                'periode' => '2021-11-01',
                'created_at' => new \DateTime,
                'updated_at' => null,
            ], 

        ];

        \DB::table('db_realisasi_pbb')->insert($pbb); 
    }
}
