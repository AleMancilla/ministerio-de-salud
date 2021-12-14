<?php

require('connection.php');

$codEdan = $_POST["cod_edan"];
$accion = $_POST["accion"];

$querySt = "INSERT INTO desastreacciones (
    cod_edan,
    accion
    ) VALUES ( 
      '".$codEdan."',
      '".$accion."')";

$stamement = $connection -> prepare($querySt);

$stamement->execute();

echo json_encode("insert desastreacciones data OK");
?>