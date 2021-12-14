<?php

require('connection.php');

$coddesastreestablecimiento = $_POST["coddesastreestablecimiento"];
$codEdan = $_POST["cod_edan"];
$nomestablecimiento = $_POST["nomestablecimiento"];
$funciona = $_POST["funciona"];
$tieneagua = $_POST["tieneagua"];
$areaAfectada = $_POST["area_afectada"];

$querySt = "INSERT INTO desastreestablecimiento (
    coddesastreestablecimiento,
    cod_edan,
    nomestablecimiento,
    funciona,
    tieneagua,
    area_afectada
    ) VALUES ( 
      '".$coddesastreestablecimiento."',
      '".$codEdan."',
      '".$nomestablecimiento."',
      '".$funciona."',
      '".$tieneagua."',
      '".$areaAfectada."')";

$stamement = $connection -> prepare($querySt);

$stamement->execute();

echo json_encode("insert desastreestablecimiento data OK");
?>