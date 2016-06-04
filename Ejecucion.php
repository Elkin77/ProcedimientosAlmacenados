<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Ejecucion
 *
 * @author Brayan
 */
class Ejecucion {

    private $htmlIndex;
    private $htmlConsola;

    function __construct($HtmlConsola) {
        $this->html = '<html>
    <head>
        <meta charset="UTF-8">
        <title></title>
        <link type="text/css" href="Estilos/EstilosIndex.css" rel="stylesheet">
        <link href="Estilos/bootstrap.min.css" rel="stylesheet" />
        <link href="Estilos/dataTables.bootstrap.css" rel="stylesheet">
        <script type="text/javascript" src="js/jquery-1.9.1.js"></script>
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
                <textarea id="consola" name="consola" cols="175" rows="41"></textarea>
            </form>
            ' . $HtmlConsola . '
        </div>
    </body>
</html>
';
    }

    public function setVisible($visible = true) {
        if ($visible == true) {
            echo $this->html;
        } else {
            echo "No hay nada";
        }
    }

    public function toString() {
        return $this->html;
    }

}
