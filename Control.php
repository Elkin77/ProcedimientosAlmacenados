<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
include 'dataBase.php';
if (isset($_POST['consola'])) {
    //Se crea el switch para saber que coloco y si no existe lo devuelve con un alert
    if ($_POST['consola'] == "puntos valorados") {
        include 'Ejecucion.php';
        $db = new dataBase();
        $db->conectar();
        $mysqli = new mysqli;
        $result = mysql_query("CALL puntos_valorados()");
        $datos="";
        $HtmlConsola="";
        while ($row1 = mysql_fetch_array($result)) {
            $datos=$datos.'<tr><td>'.$row1[0].'</td><td>'.$row1[1].'</td><td>'.$row1[2].'</td><td>'.$row1[3].'</td><td>'.$row1[4].'</td><td>'.$row1[5].'</td><td>'.$row1[6].'</td></tr>';
        }
        $HtmlConsola='<table class="table table-striped table-bordered table-hover" id="dataTables-example">
                    <thead>
                        <tr><th>idPercepcion</th>
                            <th>idCoordenada</th>
                            <th>valoracionSeguridad</th>
                            <th>valoracionSalud</th>
                            <th>valoracionAgrado</th>
                            <th>id</th>
                            <th>IB</th>
                        </tr>
                    </thead>'.$datos;
        $ejecucion = new Ejecucion($HtmlConsola);
        $ejecucion->setVisible(true);
    }
}