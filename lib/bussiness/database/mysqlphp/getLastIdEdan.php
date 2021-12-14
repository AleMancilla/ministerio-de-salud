<?php

require('connection.php');

$makeQuery = "SELECT max(cod_edan) as cod_edan FROM edan";


$stamement = $connection -> prepare($makeQuery);

$stamement->execute();

$myarray = array();

while($resultsFrom = $stamement->fetch()){
    array_push(
        $myarray,array(
            "cod_edan"=>$resultsFrom['cod_edan'],
            )
        );
    }

echo json_encode($myarray)
?>