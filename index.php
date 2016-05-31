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
        <script type="text/javascript" src="..//js/ajax.js"></script>
        <script>
            function tecla(event) {
// PARA VER QUE TECLA ESTA PRESIONADO 
// alert(event.keyCode);

//VALIDO LA TECLA PRESIONA
                if (event.keyCode == 13) { //13 = ENTER
                    alert('hola');
                }
            }
        </script>
    </head>
    <body>
        <div id="web">
            <form method="post" action="Control.php" name="form1" onkeydown="javascript:tecla(event);">
                <textarea id="consola" name="consola" cols="175" rows="41"></textarea>
            </form>
        </div>
    </body>
</html>
