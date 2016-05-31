<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

if(isset($_POST['consola'])){
    //Se crea el switch para saber que coloco y si no existe lo devuelve con un alert
    echo '<script>alert("'.$_POST['consola'].'")</script>';
    echo '<script language="javascript">window.location = "index.php?c='.$_POST['consola'].'";</script>';
}