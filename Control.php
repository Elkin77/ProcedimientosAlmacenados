<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
include 'dataBase.php';
if (isset($_POST['consola'])) {
//Se crea el switch para saber que coloco y si no existe lo devuelve con un alert
    //Esto es una prueba de un puch
	if ($_POST['consola'] == "puntos valorados") {
        include 'Ejecucion.php';
        $db = new dataBase();
        $db->conectar();
        $mysqli = new mysqli;
        $result = mysql_query("CALL puntos_valorados()");
        $datos = "";
        $HtmlConsola = "";
        while ($row1 = mysql_fetch_array($result)) {
            $datos = $datos . '<tr><td>' . $row1[0] . '</td><td>' . $row1[1] . '</td><td>' . $row1[2] . '</td><td>' . $row1[3] . '</td><td>' . $row1[4] . '</td><td>' . $row1[5] . '</td><td>' . $row1[6] . '</td></tr>';
        }
        $HtmlConsola = '<table class="table table-striped table-bordered table-hover" id="dataTables-example">
                    <thead>
                        <tr><th>idPercepcion</th>
                            <th>idCoordenada</th>
                            <th>valoracionSeguridad</th>
                            <th>valoracionSalud</th>
                            <th>valoracionAgrado</th>
                            <th>id</th>
                            <th>IB</th>
                        </tr>
                    </thead>' . $datos;
        $ejecucion = new Ejecucion($HtmlConsola);
        $ejecucion->setVisible(true);
    } else if ($_POST['consola'] == 'usuarios que han valorado') {
        include 'Ejecucion.php';
        $db = new dataBase();
        $db->conectar();
        $mysqli = new mysqli;
        $result = mysql_query("CALL usuarios_que_han_valorado()");
        $datos = "";
        $HtmlConsola = "";
        while ($row1 = mysql_fetch_array($result)) {
            $datos = $datos . '<tr><td>' . $row1[0] . '</td><td>' . $row1[1] . '</td><td>' . $row1[2] . '</td><td>' . $row1[3] . '</td><td>' . $row1[4] . '</td><td>' . $row1[5] . '</td><td>' . $row1[6] . '</td><td>' . $row1[7] . '</td></tr>';
        }
        $HtmlConsola = '<table class="table table-striped table-bordered table-hover" id="dataTables-example">
                    <thead>
                        <tr><th>idUsuario</th>
                            <th>nombre</th>
                            <th>apellido</th>
                            <th>correo</th>
                            <th>telefono</th>
                            <th>A</th>
                            <th>B</th>
                            <th>C</th>
                        </tr>
                    </thead>' . $datos;
        $ejecucion = new Ejecucion($HtmlConsola);
        $ejecucion->setVisible(true);
    } else if ($_POST['consola'] == 'usuarios que no han valorado') {
        include 'Ejecucion.php';
        $db = new dataBase();
        $db->conectar();
        $mysqli = new mysqli;
        $result = mysql_query("CALL usuarios_que_no_han_valorado()");
        $datos = "";
        $HtmlConsola = "";
        while ($row1 = mysql_fetch_array($result)) {
            $datos = $datos . '<tr><td>' . $row1[0] . '</td><td>' . $row1[1] . '</td><td>' . $row1[2] . '</td><td>' . $row1[3] . '</td><td>' . $row1[4] . '</td><td>' . $row1[5] . '</td><td>' . $row1[6] . '</td><td>' . $row1[7] . '</td></tr>';
        }
        $HtmlConsola = '<table class="table table-striped table-bordered table-hover" id="dataTables-example">
                    <thead>
                        <tr><th>idUsuario</th>
                            <th>nombre</th>
                            <th>apellido</th>
                            <th>correo</th>
                            <th>telefono</th>
                            <th>A</th>
                            <th>B</th>
                            <th>C</th>
                        </tr>
                    </thead>' . $datos;
        $ejecucion = new Ejecucion($HtmlConsola);
        $ejecucion->setVisible(true);
    } else if ($_POST['consola'] == 'puntos con sus usuarios') {
        include 'Ejecucion.php';
        $db = new dataBase();
        $db->conectar();
        $mysqli = new mysqli;
        $result = mysql_query("CALL puntos_con_sus_usuarios()");
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
    } else if ($_POST['consola'] == 'usuarios que califican mejor sus puntos') {
        include 'Ejecucion.php';
        $HtmlConsola = '<form method="post" action="Procedimientos.php">'
                . '     <label>Ingrese un valor para mostrar los valores mayores a este </label>'
                . '     <input type="text" name="ib" required><br>'
                . '     <input type="submit" name="punto5" value="enviar">'
                . '   </form>';
        $ejecucion = new Ejecucion($HtmlConsola);
        $ejecucion->setVisible(true);
    } else if ($_POST['consola'] == 'puntos valorados por usuario') {
        include 'Ejecucion.php';
        $HtmlConsola = '<form method="post" action="Procedimientos.php">'
                . '     <label>Ingrese un id de usuario para mostrar los datos de este </label>'
                . '     <input type="text" name="idusuario" required><br>'
                . '     <input type="submit" name="punto6" value="enviar">'
                . '   </form>';
        $ejecucion = new Ejecucion($HtmlConsola);
        $ejecucion->setVisible(true);
    } else if ($_POST['consola'] == 'puntos por un IB dado') {
        include 'Ejecucion.php';
        $HtmlConsola = '<form method="post" action="Procedimientos.php">'
                . '     <label>Ingrese un indice de bienestar para mostrar los datos de este </label>'
                . '     <input type="text" name="ib" required><br>'
                . '     <input type="submit" name="punto7" value="enviar">'
                . '   </form>';
        $ejecucion = new Ejecucion($HtmlConsola);
        $ejecucion->setVisible(true);
    } else if ($_POST['consola'] == 'puntos por un IB superior dado') {
        include 'Ejecucion.php';
        $HtmlConsola = '<form method="post" action="Procedimientos.php">'
                . '     <label>Ingrese un indice de bienestar superior para mostrar los datos de este </label>'
                . '     <input type="text" name="ib" required><br>'
                . '     <input type="submit" name="punto8" value="enviar">'
                . '   </form>';
        $ejecucion = new Ejecucion($HtmlConsola);
        $ejecucion->setVisible(true);
    } else if ($_POST['consola'] == 'puntos por un IB inferior dado') {
        include 'Ejecucion.php';
        $HtmlConsola = '<form method="post" action="Procedimientos.php">'
                . '     <label>Ingrese un indice de bienestar inferior para mostrar los datos de este </label>'
                . '     <input type="text" name="ib" required><br>'
                . '     <input type="submit" name="punto9" value="enviar">'
                . '   </form>';
        $ejecucion = new Ejecucion($HtmlConsola);
        $ejecucion->setVisible(true);
    } else if ($_POST['consola'] == 'puntos que circundan el area de puntos') {
        include 'Ejecucion.php';
        $ejecucion = new Ejecucion("");
        echo '<script>alert("Comando en mantenimiento, intente mas tarde")</script>';
        $ejecucion->setVisible(true);
    } else if ($_POST['consola'] == 'eliminar punto') {
        include 'Ejecucion.php';
        $HtmlConsola = '<form method="post" action="Procedimientos.php">'
                . '     <label>Ingrese un id de coordenada para eliminar los datos de este </label>'
                . '     <input type="text" name="idcoordenada" required><br>'
                . '     <input type="submit" name="punto11" value="enviar">'
                . '   </form>';
        $ejecucion = new Ejecucion($HtmlConsola);
        $ejecucion->setVisible(true);
    } else if ($_POST['consola'] == 'eliminar puntos de un radio determinado') {
        include 'Ejecucion.php';
        $ejecucion = new Ejecucion("");
        echo '<script>alert("Comando en mantenimiento, intente mas tarde")</script>';
        $ejecucion->setVisible(true);
    } else if ($_POST['consola'] == 'registro punto') {
        include 'Ejecucion.php';
        $HtmlConsola = '<form method="post" action="Procedimientos.php">'
                . '     <label>Ingrese latitud </label>'
                . '     <input type="text" name="lat" required><br>'
                . '     <label>Ingrese longitud </label>'
                . '     <input type="text" name="lon" required><br>'
                . '     <input type="submit" name="punto13" value="enviar">'
                . '   </form>';
        $ejecucion = new Ejecucion($HtmlConsola);
        $ejecucion->setVisible(true);
    } else if ($_POST['consola'] == 'help') {
        include 'Ejecucion.php';
        $HtmlConsola = '<center style="color:blue;"><h1 style="margin-left:5%;">AYUDA</h1>'
                . '      <p style="margin-left:2%; font-size:18px;">1. puntos valorados</p>'
                . '      <p style="margin-left:2%; font-size:18px;">2. usuarios que han valorado</p>'
                . '      <p style="margin-left:2%; font-size:18px;">3. usuarios que no han valorado</p>'
                . '      <p style="margin-left:2%; font-size:18px;">4. puntos con sus usuarios</p>'
                . '      <p style="margin-left:2%; font-size:18px;">5. usuarios que califican mejor sus puntos</p>'
                . '      <p style="margin-left:2%; font-size:18px;">6. puntos valorados por usuario</p>'
                . '      <p style="margin-left:2%; font-size:18px;">7. puntos por un IB dado</p>'
                . '      <p style="margin-left:2%; font-size:18px;">8. puntos por un IB superior dado</p>'
                . '      <p style="margin-left:2%; font-size:18px;">9. puntos por un IB inferior dado</p>'
                . '      <p style="margin-left:2%; font-size:18px;">10. puntos que circundan el area de puntos</p>'
                . '      <p style="margin-left:2%; font-size:18px;">11. eliminar punto</p>'
                . '      <p style="margin-left:2%; font-size:18px;">12. eliminar puntos de un radio determinado</p>'
                . '      <p style="margin-left:2%; font-size:18px;">13. registro punto</p>'
                . '      <h3>No colocar los numeros, solo colocar las palabras tal cual como estan escritas en esta lista</h3></center>';
        $ejecucion = new Ejecucion($HtmlConsola);
        $ejecucion->setVisible(true);
    } else {
        include 'Ejecucion.php';
        $ejecucion = new Ejecucion("");
        echo '<script>alert("ERROR comando no conocido, para saber cuales comandos existen, '
        . 'escribir comando help")</script>';
        $ejecucion->setVisible(true);
    }
}