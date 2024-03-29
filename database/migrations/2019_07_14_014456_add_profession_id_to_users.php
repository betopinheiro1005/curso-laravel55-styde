<?php
use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;
class AddProfessionIdToUsers extends Migration
{
    public function up()
    {
        Schema::table('users', function (Blueprint $table) {
            $table->unsignedInteger('profession_id')->after('password')->nullable();
            $table->foreign('profession_id')->references('id')->on('professions');
        });
    }

    public function down()
    {
//        Schema::table('users', function (Blueprint $table) {
//            $table->dropForeign(['profession_id']);
//            $table->dropColumn('profession_id');
//        });
    }
}