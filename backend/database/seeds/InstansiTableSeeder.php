<?php

use Illuminate\Database\Seeder;

class InstansiTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $instansi = [
            [   
                'nama_instansi' => 'Diskomsantik',
                'pimpinan' => 'Ir. Girgijantoro',
                'lat' => '-6.3081327',
                'long' => '106.1067646',
                'instansi' => 'Pemkab',
                'created_at' => new \DateTime,
                'updated_at' => null,
            ], 
            [   
                'nama_instansi' => 'Sekretariat Daerah',
                'pimpinan' => 'Taufik Hidayat',
                'lat' => '-6.3095914',
                'long' => '106.104914',
                'instansi' => 'Pemkab',
                'created_at' => new \DateTime,
                'updated_at' => null,
            ], 
            [   
                'nama_instansi' => 'Kecamatan Pandeglang',
                'pimpinan' => 'M Arief',
                'lat' => '-6.310473',
                'long' => '106.110413',
                'instansi' => 'Kecamatan',
                'created_at' => new \DateTime,
                'updated_at' => null,
            ], 
            [   
                'nama_instansi' => 'Kecamatan Majasari',
                'pimpinan' => 'M Bajja',
                'lat' => '-6.328842',
                'long' => '106.093506',
                'instansi' => 'Kecamatan',
                'created_at' => new \DateTime,
                'updated_at' => null,
            ], 

        ];

        \DB::table('instansi')->insert($instansi); 
    }
}
