<?php

require('connection.php');

$makeQuery = "SELECT * FROM personalsalud";

$stamement = $connection -> prepare($makeQuery);

$stamement->execute();

$myarray = array();

while($resultsFrom = $stamement->fetch()){
    array_push(
        $myarray,array(
            "codpersonal"=>$resultsFrom['codpersonal'],
            "tipopersonal"=>$resultsFrom['tipopersonal']
            )
        );
    }

echo json_encode($myarray)
?>