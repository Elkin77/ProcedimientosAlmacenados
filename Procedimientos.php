<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
include 'dataBase.php';
if(isset($_POST['punto5'])){
    include 'Ejecucion.php';
        $db = new dataBase();
        $db->conectar();
        $rangoIb=$_POST['ib'];
        $mysqli = new mysqli;
        $result = mysql_query("CALL usuarios_que_califican_mejor_sus_puntos($rangoIb)");
        $datos = "";
        $HtmlConsola = "";
        while ($row1 = mysql_fetch_array($result)) {
            $datos = $datos . '<tr><td>' . $row1[0] . '</td><td>' . $row1[1] . '</td><td>' . $row1[2] . '</td><td>' . $row1[3] . '</td><td>' . $row1[4] . '</td><td>' . $row1[5] . '</td><td>' . $row1[6] . '</td></tr>';
        }
        $HtmlConsola = '<table class="table table-striped table-bordered table-hover" id="dataTables-example">
                    <thead>
                        <tr><th>idUsuario</th>
                            <th>nombre</th>
                            <th>apellido</th>
                            <th>idPunto</th>
                            <th>idPercepcion</th>
                            <th>idCoordenada</th>
                            <th>ib</th>
                        </tr>
                    </thead>' . $datos;
        $ejecucion = new Ejecucion($HtmlConsola);
        $ejecucion->setVisible(true);
}else if(isset ($_POST['punto6'])){
    include 'Ejecucion.php';
        $db = new dataBase();
        $db->conectar();
        $idUsuario=$_POST['idusuario'];
        $mysqli = new mysqli;
        $result = mysql_query("CALL puntos_valorados_por_usuario($idUsuario)");
        $datos = "";
        $HtmlConsola = "";
        while ($row1 = mysql_fetch_array($result)) {
            $datos = $datos . '<tr><td>' . $row1[0] . '</td><td>' . $row1[1] . '</td><td>' . $row1[2] . '</td><td>' . $row1[3] . '</td><td>' . $row1[4] . '</td><td>' . $row1[5] . '</td><td>' . $row1[6] . '</td></tr>';
        }
        $HtmlConsola = '<table class="table table-striped table-bordered table-hover" id="dataTables-example">
                    <thead>
                        <tr><th>idUsuario</th>
                            <th>nombre</th>
                            <th>apellido</th>
                            <th>idPunto</th>
                            <th>idPercepcion</th>
                            <th>idCoordenada</th>
                            <th>ib</th>
                        </tr>
                    </thead>' . $datos;
        $ejecucion = new Ejecucion($HtmlConsola);
        $ejecucion->setVisible(true);
}else if(isset ($_POST['punto7'])){
    include 'Ejecucion.php';
        $db = new dataBase();
        $db->conectar();
        $ib=$_POST['ib'];
        $mysqli = new mysqli;
        $result = mysql_query("CALL puntos_por_un_ib_dado($ib)");
        $datos = "";
        $HtmlConsola = "";
        while ($row1 = mysql_fetch_array($result)) {
            $datos = $datos . '<tr><td>' . $row1[0] . '</td><td>' . $row1[1] . '</td><td>' . $row1[2] . '</td></tr>';
        }
        $HtmlConsola = '<table class="table table-striped table-bordered table-hover" id="dataTables-example">
                    <thead>
                        <tr><th>idCoordenada</th>
                            <th>latitu</th>
                            <th>longitud</th>
                        </tr>
                    </thead>' . $datos;
        $ejecucion = new Ejecucion($HtmlConsola);
        $ejecucion->setVisible(true);
}else if(isset ($_POST['punto8'])){
    include 'Ejecucion.php';
        $db = new dataBase();
        $db->conectar();
        $ib=$_POST['ib'];
        $mysqli = new mysqli;
        $result = mysql_query("CALL puntos_por_un_ib_superior_dado($ib)");
        $datos = "";
        $HtmlConsola = "";
        while ($row1 = mysql_fetch_array($result)) {
            $datos = $datos . '<tr><td>' . $row1[0] . '</td><td>' . $row1[1] . '</td><td>' . $row1[2] . '</td></tr>';
        }
        $HtmlConsola = '<table class="table table-striped table-bordered table-hover" id="dataTables-example">
                    <thead>
                        <tr><th>idCoordenada</th>
                            <th>latitu</th>
                            <th>longitud</th>
                        </tr>
                    </thead>' . $datos;
        $ejecucion = new Ejecucion($HtmlConsola);
        $ejecucion->setVisible(true);
}else if(isset ($_POST['punto9'])){
    include 'Ejecucion.php';
        $db = new dataBase();
        $db->conectar();
        $ib=$_POST['ib'];
        $mysqli = new mysqli;
        $result = mysql_query("CALL puntos_por_un_ib_inferior_dado($ib)");
        $datos = "";
        $HtmlConsola = "";
        while ($row1 = mysql_fetch_array($result)) {
            $datos = $datos . '<tr><td>' . $row1[0] . '</td><td>' . $row1[1] . '</td><td>' . $row1[2] . '</td></tr>';
        }
        $HtmlConsola = '<table class="table table-striped table-bordered table-hover" id="dataTables-example">
                    <thead>
                        <tr><th>idCoordenada</th>
                            <th>latitud</th>
                            <th>longitud</th>
                        </tr>
                    </thead>' . $datos;
        $ejecucion = new Ejecucion($HtmlConsola);
        $ejecucion->setVisible(true);
}else if(isset ($_POST['punto11'])){
    include 'Ejecucion.php';
        $db = new dataBase();
        $db->conectar();
        $idCoordenada=$_POST['idcoordenada'];
        $mysqli = new mysqli;
        mysql_query("CALL eliminar_punto($idCoordenada)");
        $result = mysql_query("CALL mostrar_todos_los_puntos()");
        $datos = "";
        $HtmlConsola = "";
        while ($row1 = mysql_fetch_array($result)) {
            $datos = $datos . '<tr><td>' . $row1[0] . '</td><td>' . $row1[1] . '</td><td>' . $row1[2] . '</td></tr>';
        }
        $HtmlConsola = '<table class="table table-striped table-bordered table-hover" id="dataTables-example">
                    <thead>
                        <tr><th>idCoordenada</th>
                            <th>latitud</th>
                            <th>longitud</th>
                        </tr>
                    </thead>' . $datos;
        $ejecucion = new Ejecucion($HtmlConsola);
        $ejecucion->setVisible(true);
}else if(isset ($_POST['punto13'])){
    include 'Ejecucion.php';
        $db = new dataBase();
        $db->conectar();
        $latitud=$_POST['lat'];
        $longitud=$_POST['lon'];
        $mysqli = new mysqli;
        mysql_query("CALL registro_punto($latitud,$longitud)");
        $result = mysql_query("CALL mostrar_todos_los_puntos()");
        $datos = "";
        $HtmlConsola = "";
        while ($row1 = mysql_fetch_array($result)) {
            $datos = $datos . '<tr><td>' . $row1[0] . '</td><td>' . $row1[1] . '</td><td>' . $row1[2] . '</td></tr>';
        }
        $HtmlConsola = '<table class="table table-striped table-bordered table-hover" id="dataTables-example">
                    <thead>
                        <tr><th>idCoordenada</th>
                            <th>latitud</th>
                            <th>longitud</th>
                        </tr>
                    </thead>' . $datos;
        $ejecucion = new Ejecucion($HtmlConsola);
        $ejecucion->setVisible(true);
}