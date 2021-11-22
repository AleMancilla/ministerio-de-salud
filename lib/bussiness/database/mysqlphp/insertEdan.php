<?php

require('connection.php');

$evento = $_POST["evento"];
$claseEvento = $_POST["clase_evento"];
$fecha = $_POST["fecha"];
// $datePur = date('d-m-Y', strtotime($_POST['fecha']));
$hora = $_POST["hora"];
$continua = $_POST["continua"];
$nombre = $_POST["nombre"];
$cargo = $_POST["cargo"];
$dreccion = $_POST["dreccion"];
$telFc = $_POST["tel_fc"];
$telCc = $_POST["tel_cc"];
$depto = $_POST["depto"];
$municipio = $_POST["municipio"];
$comunidad = $_POST["comunidad"];
$tieneCoord = $_POST["tiene_coord"];
$coordenadaX = $_POST["coordenada_x"];
$coordenadaY = $_POST["coordenada_y"];
$aereo = $_POST["aereo"];
$terrestre = $_POST["terrestre"];
$fluvial = $_POST["fluvial"];
$ferroviario = $_POST["ferroviario"];
$partida = $_POST["partida"];
$horaLlegada = $_POST["hora_llegada"];
$clima = $_POST["clima"];
$medioComunicacion = $_POST["medio_comunicacion"];
$canal = $_POST["canal"];
$nombreEmisora = $_POST["nombre_emisora"];
$dialEmisora = $_POST["dial_emisora"];
$telefonoEmisora = $_POST["telefono_emisora"];
$viviendas = $_POST["viviendas"];
$familias = $_POST["familias"];
$ninios = $_POST["ninios"];
$ninias = $_POST["ninias"];
$discapacidad = $_POST["discapacidad"];
$discapacidadm = $_POST["discapacidadm"];
$embarazadas = $_POST["embarazadas"];
$adultoMayor = $_POST["adulto_mayor"];
$adultoMayorm = $_POST["adulto_mayorm"];
$numAlbergues = $_POST["num_albergues"];
$agua = $_POST["agua"];
$basura = $_POST["basura"];
$alcantarillado = $_POST["alcantarillado"];
$electricidad = $_POST["electricidad"];
$telecom = $_POST["telecom"];
$transporte = $_POST["transporte"];
$establecimientossalud = $_POST["establecimientossalud"];
$heridos = $_POST["heridos"];
$muertos = $_POST["muertos"];
$desaparecidos = $_POST["desaparecidos"];
$lesionados = $_POST["lesionados"];
$otraOrganizacion = $_POST["otra_organizacion"];
$sci = $_POST["sci"];
$sciDonde = $_POST["sci_donde"];
$lugarLle = $_POST["lugar_lle"];
$fechaLle = $_POST["fecha_lle"];
$horaLle = $_POST["hora_lle"];
$responsableLle = $_POST["responsable_lle"];
$cargoLle = $_POST["cargo_lle"];
$telfFijoLle = $_POST["telf_fijo_lle"];
$telfCelLle = $_POST["telf_cel_lle"];
$email = $_POST["email"];
$usuario = $_POST["usuario"];
$fechap = $_POST["fechap"];

$timeStamp = strtotime($fecha);
$dat= date("Y-m-d H:i:s", $timestamp);
$timeStamplle = strtotime($fechaLle);
$datlle= date("Y-m-d H:i:s", $timestamplle);
$timeStampP = strtotime($fechap);
$datP= date("Y-m-d H:i:s", $timestampP);

$querySt = "INSERT INTO edan (
    evento,
    clase_evento,
    fecha,
    hora,
    continua,
    nombre,
    cargo,
    dreccion,
    tel_fc,
    tel_cc,
    depto,
    municipio,
    comunidad,
    tiene_coord,
    coordenada_x,
    coordenada_y,
    aereo,
    terrestre,
    fluvial,
    ferroviario,
    partida,
    hora_llegada,
    clima,
    medio_comunicacion,
    canal,
    nombre_emisora,
    dial_emisora,
    telefono_emisora,
    viviendas,
    familias,
    ninios,
    ninias,
    discapacidad,
    discapacidadm,
    embarazadas,
    adulto_mayor,
    adulto_mayorm,
    num_albergues,
    agua,
    basura,
    alcantarillado,
    electricidad,
    telecom,
    transporte,
    establecimientossalud,
    heridos,
    muertos,
    desaparecidos,
    lesionados,
    otra_organizacion,
    sci,
    sci_donde,
    lugar_lle,
    fecha_lle,
    hora_lle,
    responsable_lle,
    cargo_lle,
    telf_fijo_lle,
    telf_cel_lle,
    email,
    usuario,
    fechap,
    enviado
    ) VALUES ( 
      '".$evento."',
      '".$claseEvento."',
      '".$dat."',
      '".$hora."',
      '".$continua."',
      '".$nombre."',
      '".$cargo."',
      '".$dreccion."',
      '".$telFc."',
      '".$telCc."',
      '".$depto."',
      '".$municipio."',
      '".$comunidad."',
      '".substr($tieneCoord,0,1)."',
      '".$coordenadaX."',
      '".$coordenadaY."',
      '".$aereo."',
      '".$terrestre."',
      '".$fluvial."',
      '".$ferroviario."',
      '".$partida."',
      '".$horaLlegada."',
      '".$clima."',
      '".$medioComunicacion."',
      '".$canal."',
      '".$nombreEmisora."',
      '".$dialEmisora."',
      '".$telefonoEmisora."',
      '".$viviendas."',
      '".$familias."',
      '".$ninios."',
      '".$ninias."',
      '".$discapacidad."',
      '".$discapacidadm."',
      '".$embarazadas."',
      '".$adultoMayor."',
      '".$adultoMayorm."',
      '".$numAlbergues."',
      '".$agua."',
      '".$basura."',
      '".$alcantarillado."',
      '".$electricidad."',
      '".$telecom."',
      '".$transporte."',
      '".$establecimientossalud."',
      '".$heridos."',
      '".$muertos."',
      '".$desaparecidos."',
      '".$lesionados."',
      '".$otraOrganizacion."',
      '".$sci."',
      '".$sciDonde."',
      '".$lugarLle."',
      '".$datlle."',
      '".$horaLle."',
      '".$responsableLle."',
      '".$cargoLle."',
      '".$telfFijoLle."',
      '".$telfCelLle."',
      '".$email."',
      '".$usuario."',
      '".$datP."',
      'NO')";

$stamement = $connection -> prepare($querySt);

$stamement->execute();

echo json_encode("insert data OK");
?>