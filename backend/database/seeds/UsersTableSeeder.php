<?php

use Illuminate\Database\Seeder;

class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $users = [
            [   
                'instansi_id' => 1,
               'name' => 'Super Admin',
               'username' => 'superadmin',
               'email' => 'superadmin@gmail.com',
               'password' => bcrypt('12345678'),
               'role' => 'Admin',
                'created_at' => new \DateTime,
                'updated_at' => null,
            ], 
            [   
                'instansi_id' => 2,
                'name' => 'Sekretariat Daerah',
                'username' => 'sekda',
                'email' => 'sekda@gmail.com',
                'password' => bcrypt('12345678'),
                'role' => 'Admin',
                'created_at' => new \DateTime,
                'updated_at' => null,
            ], 
            [   
                'instansi_id' => 3,
                'name' => 'Muhammad Bagya',
                'username' => 'pandeglangkec',
                'email' => 'pandeglangkec@gmail.com',
                'password' => bcrypt('12345678'),
                'role' => 'User',
                'created_at' => new \DateTime,
                'updated_at' => null,
            ], 
            [   
                'instansi_id' => 4,
                'name' => 'Andi Riansyah',
                'username' => 'majasarikec',
                'email' => 'pandeglangkec@gmail.com',
                'password' => bcrypt('12345678'),
                'role' => 'User',
                'created_at' => new \DateTime,
                'updated_at' => null,
            ], 

        ];

        \DB::table('users')->insert($users); 
    }
}
