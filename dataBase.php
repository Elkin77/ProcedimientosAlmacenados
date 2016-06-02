<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of dataBase
 *
 * @author Administrador
 */
class dataBase {

    private $servidor;
    private $usuario;
    private $clave;
    private $nombreDB;

    function Database() {
        $this->servidor = "localhost";
        $this->usuario = "root";
        $this->clave = "";
        $this->nombreDB = "parcialfinaldb";
    }

    function conectar() {
        $link = mysql_connect($this->servidor, $this->usuario, $this->clave);
        mysql_select_db($this->nombreDB, $link);
    }

}
