<?php

require('connection.php');

$codpersonal = $_POST["codpersonal"];
$tipopersonal = $_POST["tipopersonal"];

$querySt = "INSERT INTO personalsalud VALUES ('".$codpersonal."', '".$tipopersonal."')";

$stamement = $connection -> prepare($querySt);

$stamement->execute();

echo json_encode("insert data OK");
?>