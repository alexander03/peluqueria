<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CrearTablaDetalleComision extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('detalle_comision', function (Blueprint $table) {
            $table->increments('id');
            $table->decimal('comision',10,2);
            $table->integer('trabajador_id')->unsigned();
            $table->integer('venta_id')->unsigned();
            $table->foreign('trabajador_id')->references('id')->on('persona')->onDelete('restrict')->onUpdate('restrict');
            $table->foreign('venta_id')->references('id')->on('movimiento')->onDelete('restrict')->onUpdate('restrict');
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('detalle_comision');
    }
}
