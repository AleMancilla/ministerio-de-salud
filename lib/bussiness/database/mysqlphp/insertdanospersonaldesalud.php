<?php

require('connection.php');

$codpersalud = $_POST["codpersalud"];
$codEdan = $_POST["cod_edan"];
$personal = $_POST["personal"];
$muertos = $_POST["muertos"];
$heridos = $_POST["heridos"];
$enfermos = $_POST["enfermos"];
$disponibles = $_POST["disponibles"];
$desaparecidos = $_POST["desaparecidos"];
$observaciones = $_POST["observaciones"];

$querySt = "INSERT INTO danospersonaldesalud (
    codpersalud,
    cod_edan,
    personal,
    muertos,
    heridos,
    enfermos,
    disponibles,
    desaparecidos,
    observaciones
    ) VALUES ( 
      '".$codpersalud."',
      '".$codEdan."',
      '".$personal."',
      '".$muertos."',
      '".$heridos."',
      '".$enfermos."',
      '".$disponibles."',
      '".$desaparecidos."',
      '".$observaciones."')";

$stamement = $connection -> prepare($querySt);

$stamement->execute();

echo json_encode("insert desastreestablecimiento data OK");
?>