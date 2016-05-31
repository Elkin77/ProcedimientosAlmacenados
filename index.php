<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <meta charset="UTF-8">
        <title></title>
        <link type="text/css" href="Estilos/EstilosIndex.css" rel="stylesheet">
        <!--<script type="text/javascript" src="..//js/ajax.js"></script>-->
        <script>
            function tecla(event) {
// PARA VER QUE TECLA ESTA PRESIONADO 
// alert(event.keyCode);

//VALIDO LA TECLA PRESIONA
                if (event.keyCode == 13) { //13 = ENTER
                    document.getElementById("form1").submit();
                }
            }
        </script>
    </head>
    <body>
        <div id="web">
            <form method="post" action="Control.php" id="form1" name="form1" onkeydown="javascript:tecla(event);">
                <textarea id="consola" name="consola" cols="175" rows="41"><?php
                    if (isset($_GET['c'])) {
                        echo $_GET['c'];
                    }
                    ?></textarea>
            </form>
        </div>
    </body>
</html>

<?php
////$db = new dataBase();
//$db->conectar();
//$mysqli = new mysqli;
//$resultado = 0;
//$result = mysql_query("CALL usuarios()");
//$datos;
//while ($row1 = mysql_fetch_row($result)) {
//    echo '<p>' . $row1[0] . ',' . $row1[1] . ',' . $row1[2] . ',' . $row1[3] . ',' . $row1[4] . ',' . $row1[5] . ',' . $row1[6] . ',' . $row1[7] . '</p>';
//}
?>
