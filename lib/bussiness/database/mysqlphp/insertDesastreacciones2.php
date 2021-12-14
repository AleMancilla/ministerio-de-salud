<?php

require('connection.php');

$codEdan = $_POST["cod_edan"];
$accion = $_POST["accion"];

$querySt = "INSERT INTO desastreacciones2 (
    cod_edan,
    accion
    ) VALUES ( 
      '".$codEdan."',
      '".$accion."')";

$stamement = $connection -> prepare($querySt);

$stamement->execute();

echo json_encode("insert desastreacciones2 data OK");
?>