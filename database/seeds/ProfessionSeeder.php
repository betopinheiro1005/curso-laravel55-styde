<?php

use App\Profession;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ProfessionSeeder extends Seeder
{
    public function run()
    {
//        DB::insert('INSERT INTO professions (title) VALUES (:title)', [
//            'title' => 'Desenvolvedor back-end',
//        ]);

//        DB::table('professions')->insert([
//            'title' => 'Desenvolvedor back-end',
//        ]);

        Profession::create([
            'title' => 'Desenvolvedor back-end',
        ]);

        Profession::create([
            'title' => 'Desenvolvedor front-end',
        ]);

        Profession::create([
            'title' => 'Web designer',
        ]);

        factory(Profession::class)->times(17)->create();

    }
}
