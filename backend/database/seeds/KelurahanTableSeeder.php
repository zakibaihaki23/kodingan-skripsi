<?php

use Illuminate\Database\Seeder;

class KelurahanTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $kelurahan = [
            [   
               'instansi_id' => 3,
               'nama_kelurahan' => 'Kelurahan Pandeglang',
                'created_at' => new \DateTime,
                'updated_at' => null,
            ], 
            [   
                'instansi_id' => 3,
                'nama_kelurahan' => 'Kelurahan Karaton',
                'created_at' => new \DateTime,
                'updated_at' => null,
            ], 
            [   
                'instansi_id' => 4,
               'nama_kelurahan' => 'Kelurahan Sukaratu',
                'created_at' => new \DateTime,
                'updated_at' => null,
            ], 
            [   
                'instansi_id' => 4,
               'nama_kelurahan' => 'Kelurahan Saruni',
                'created_at' => new \DateTime,
                'updated_at' => null,
            ], 

        ];

        \DB::table('kelurahan')->insert($kelurahan); 
    }
}
