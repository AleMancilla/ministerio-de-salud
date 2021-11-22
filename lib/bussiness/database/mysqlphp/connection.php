<?php
try{
    $connection = new PDO('mysql:host=localhost;dbname=id17985222_min_salud','id17985222_ministerio','0)-rYWkRwI[^u%e4');
    // $connection = new PDO('mysql:host=localhost;dbname=pncad','edan','Edan123$');
    $connection -> setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
    //echo "coneccion exitosa";
}catch(PDOException $exc){
    echo $exc -> getMessage;
    die("could not connect");
}
?>