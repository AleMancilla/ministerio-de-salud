<?php

require('connection.php');

$codrequerimientos = $_POST["codrequerimientos"];
$codEdan = $_POST["cod_edan"];
$requerimiento = $_POST["requerimiento"];
$cantidad = $_POST["cantidad"];
$prioridad = $_POST["prioridad"];
$observaciones = $_POST["observaciones"];

$querySt = "INSERT INTO desastrerequerimientos (
    codrequerimientos,
    cod_Edan,
    requerimiento,
    cantidad,
    prioridad,
    observaciones
    ) VALUES ( 
      '".$codrequerimientos."',
      '".$codEdan."',
      '".$requerimiento."',
      '".$cantidad."',
      '".$prioridad."',
      '".$observaciones."')";

$stamement = $connection -> prepare($querySt);

$stamement->execute();

echo json_encode("insert desastrerequerimientos data OK");
?>