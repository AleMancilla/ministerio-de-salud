class ModelEdan {
  int? codEdan;
  String? evento;
  String? claseEvento;
  String? fecha;
  String? hora;
  String? continua;
  String? nombre;
  String? cargo;
  String? dreccion;
  String? telFc;
  String? telCc;
  String? depto;
  String? municipio;
  String? comunidad;
  String? tieneCoord;
  String? coordenadaX;
  String? coordenadaY;
  String? aereo;
  String? terrestre;
  String? fluvial;
  String? ferroviario;
  String? partida;
  String? horaLlegada;
  String? clima;
  String? medioComunicacion;
  String? canal;
  String? nombreEmisora;
  String? dialEmisora;
  String? telefonoEmisora;
  int? viviendas;
  int? familias;
  int? ninios;
  int? ninias;
  int? discapacidad;
  int? discapacidadm;
  int? embarazadas;
  int? adultoMayor;
  int? adultoMayorm;
  int? numAlbergues;
  String? agua;
  String? basura;
  String? alcantarillado;
  String? electricidad;
  String? telecom;
  String? transporte;
  String? establecimientossalud;
  int? heridos;
  int? muertos;
  int? desaparecidos;
  int? lesionados;
  String? otraOrganizacion;
  String? sci;
  String? sciDonde;
  String? lugarLle;
  String? fechaLle;
  String? horaLle;
  String? responsableLle;
  String? cargoLle;
  String? telfFijoLle;
  String? telfCelLle;
  String? email;
  String? usuario;
  String? fechap;
  String? enviado;

  bool controllerEnviar = false;

  ModelEdan({
    this.codEdan,
    this.evento,
    this.claseEvento,
    this.fecha,
    this.hora,
    this.continua,
    this.nombre,
    this.cargo,
    this.dreccion,
    this.telFc,
    this.telCc,
    this.depto,
    this.municipio,
    this.comunidad,
    this.tieneCoord,
    this.coordenadaX,
    this.coordenadaY,
    this.aereo,
    this.terrestre,
    this.fluvial,
    this.ferroviario,
    this.partida,
    this.horaLlegada,
    this.clima,
    this.medioComunicacion,
    this.canal,
    this.nombreEmisora,
    this.dialEmisora,
    this.telefonoEmisora,
    this.viviendas,
    this.familias,
    this.ninios,
    this.ninias,
    this.discapacidad,
    this.discapacidadm,
    this.embarazadas,
    this.adultoMayor,
    this.adultoMayorm,
    this.numAlbergues,
    this.agua,
    this.basura,
    this.alcantarillado,
    this.electricidad,
    this.telecom,
    this.transporte,
    this.establecimientossalud,
    this.heridos,
    this.muertos,
    this.desaparecidos,
    this.lesionados,
    this.otraOrganizacion,
    this.sci,
    this.sciDonde,
    this.lugarLle,
    this.fechaLle,
    this.horaLle,
    this.responsableLle,
    this.cargoLle,
    this.telfFijoLle,
    this.telfCelLle,
    this.email,
    this.usuario,
    this.fechap,
    this.enviado,
    this.controllerEnviar = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'cod_edan': codEdan,
      'evento': evento,
      'clase_evento': claseEvento,
      'fecha': fecha,
      'hora': hora,
      'continua': continua,
      'nombre': nombre,
      'cargo': cargo,
      'dreccion': dreccion,
      'tel_fc': telFc,
      'tel_cc': telCc,
      'depto': depto,
      'municipio': municipio,
      'comunidad': comunidad,
      'tiene_coord': tieneCoord,
      'coordenada_x': coordenadaX,
      'coordenada_y': coordenadaY,
      'aereo': aereo,
      'terrestre': terrestre,
      'fluvial': fluvial,
      'ferroviario': ferroviario,
      'partida': partida,
      'hora_llegada': horaLlegada,
      'clima': clima,
      'medio_comunicacion': medioComunicacion,
      'canal': canal,
      'nombre_emisora': nombreEmisora,
      'dial_emisora': dialEmisora,
      'telefono_emisora': telefonoEmisora,
      'viviendas': viviendas,
      'familias': familias,
      'ninios': ninios,
      'ninias': ninias,
      'discapacidad': discapacidad,
      'discapacidadm': discapacidadm,
      'embarazadas': embarazadas,
      'adulto_mayor': adultoMayor,
      'adulto_mayorm': adultoMayorm,
      'num_albergues': numAlbergues,
      'agua': agua,
      'basura': basura,
      'alcantarillado': alcantarillado,
      'electricidad': electricidad,
      'telecom': telecom,
      'transporte': transporte,
      'establecimientossalud': establecimientossalud,
      'heridos': heridos,
      'muertos': muertos,
      'desaparecidos': desaparecidos,
      'lesionados': lesionados,
      'otra_organizacion': otraOrganizacion,
      'sci': sci,
      'sci_donde': sciDonde,
      'lugar_lle': lugarLle,
      'fecha_lle': fechaLle,
      'hora_lle': horaLle,
      'responsable_lle': responsableLle,
      'cargo_lle': cargoLle,
      'telf_fijo_lle': telfFijoLle,
      'telf_cel_lle': telfCelLle,
      'email': email,
      'usuario': usuario,
      'fechap': fechap,
      'enviado': enviado,
    };
  }

  ModelEdan.fromMap(Map<String, dynamic> map) {
    codEdan = map['cod_edan'];
    evento = map['evento'];
    claseEvento = map['clase_evento'];
    fecha = map['fecha'];
    hora = map['hora'];
    continua = map['continua'];
    nombre = map['nombre'];
    cargo = map['cargo'];
    dreccion = map['dreccion'];
    telFc = map['tel_fc'];
    telCc = map['tel_cc'];
    depto = map['depto'];
    municipio = map['municipio'];
    comunidad = map['comunidad'];
    tieneCoord = map['tiene_coord'];
    coordenadaX = map['coordenada_x'];
    coordenadaY = map['coordenada_y'];
    aereo = map['aereo'];
    terrestre = map['terrestre'];
    fluvial = map['fluvial'];
    ferroviario = map['ferroviario'];
    partida = map['partida'];
    horaLlegada = map['hora_llegada'];
    clima = map['clima'];
    medioComunicacion = map['medio_comunicacion'];
    canal = map['canal'];
    nombreEmisora = map['nombre_emisora'];
    dialEmisora = map['dial_emisora'];
    telefonoEmisora = map['telefono_emisora'];
    viviendas = map['viviendas'];
    familias = map['familias'];
    ninios = map['ninios'];
    ninias = map['ninias'];
    discapacidad = map['discapacidad'];
    discapacidadm = map['discapacidadm'];
    embarazadas = map['embarazadas'];
    adultoMayor = map['adulto_mayor'];
    adultoMayorm = map['adulto_mayorm'];
    numAlbergues = map['num_albergues'];
    agua = map['agua'];
    basura = map['basura'];
    alcantarillado = map['alcantarillado'];
    electricidad = map['electricidad'];
    telecom = map['telecom'];
    transporte = map['transporte'];
    establecimientossalud = map['establecimientossalud'];
    heridos = map['heridos'];
    muertos = map['muertos'];
    desaparecidos = map['desaparecidos'];
    lesionados = map['lesionados'];
    otraOrganizacion = map['otra_organizacion'];
    sci = map['sci'];
    sciDonde = map['sci_donde'];
    lugarLle = map['lugar_lle'];
    fechaLle = map['fecha_lle'];
    horaLle = map['hora_lle'];
    responsableLle = map['responsable_lle'];
    cargoLle = map['cargo_lle'];
    telfFijoLle = map['telf_fijo_lle'];
    telfCelLle = map['telf_cel_lle'];
    email = map['email'];
    usuario = map['usuario'];
    fechap = map['fechap'];
    enviado = map['enviado'];
  }

  String insertSql() {
    return """INSERT INTO edan (
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
  '$evento',
  '$claseEvento',
  '$fecha',
  '$hora',
  '$continua',
  '$nombre',
  '$cargo',
  '$dreccion',
  '$telFc',
  '$telCc',
  '$depto',
  '$municipio',
  '$comunidad',
  '$tieneCoord',
  '$coordenadaX',
  '$coordenadaY',
  '$aereo',
  '$terrestre',
  '$fluvial',
  '$ferroviario',
  '$partida',
  '$horaLlegada',
  '$clima',
  '$medioComunicacion',
  '$canal',
  '$nombreEmisora',
  '$dialEmisora',
  '$telefonoEmisora',
  '$viviendas',
  '$familias',
  '$ninios',
  '$ninias',
  '$discapacidad',
  '$discapacidadm',
  '$embarazadas',
  '$adultoMayor',
  '$adultoMayorm',
  '$numAlbergues',
  '$agua',
  '$basura',
  '$alcantarillado',
  '$electricidad',
  '$telecom',
  '$transporte',
  '$establecimientossalud',
  '$heridos',
  '$muertos',
  '$desaparecidos',
  '$lesionados',
  '$otraOrganizacion',
  '$sci',
  '$sciDonde',
  '$lugarLle',
  '$fechaLle',
  '$horaLle',
  '$responsableLle',
  '$cargoLle',
  '$telfFijoLle',
  '$telfCelLle',
  '$email',
  '$usuario',
  '$fechap',
  'NO')""";
    // return "INSERT INTO `edan` VALUES (DEFAULT','$evento','$claseEvento','$fecha','$hora','$continua','$nombre','$cargo','$dreccion','$telFc','$telCc', '$depto', '$municipio', '$comunidad', '$tieneCoord', '$coordenadaX', '$coordenadaY', '$aereo', '$terrestre', '$fluvial', '$ferroviario', '$partida', '$horaLlegada', '$clima', '$medioComunicacion', $viviendas, $familias, '$agua', '$basura', '$alcantarillado', '$electricidad', '$telecom', '$transporte', $heridos, $muertos, $desaparecidos, '$accionesPrioritarias', '$lugarLle', '$fechaLle', '$horaLle', '$responsableLle', '$cargoLle', '$telfFijoLle', '$telfCelLle', '$email', '$usuario', '$fechap', 'NO')";
  }

  String updateSql() {
    return """
UPDATE edan SET
evento = '$evento',
clase_evento = '$claseEvento',
fecha = '$fecha',
hora = '$hora',
continua = '$continua',
nombre = '$nombre',
cargo = '$cargo',
dreccion = '$dreccion',
tel_fc = '$telFc',
tel_cc = '$telCc',
depto = '$depto',
municipio = '$municipio',
comunidad = '$comunidad',
tiene_coord = '$tieneCoord',
coordenada_x = '$coordenadaX',
coordenada_y = '$coordenadaY',
aereo = '$aereo',
terrestre = '$terrestre',
fluvial = '$fluvial',
ferroviario = '$ferroviario',
partida = '$partida',
hora_llegada = '$horaLlegada',
clima = '$clima',
medio_comunicacion = '$medioComunicacion',
canal = '$canal',
nombre_emisora = '$nombreEmisora',
dial_emisora = '$dialEmisora',
telefono_emisora = '$telefonoEmisora',
viviendas = '$viviendas',
familias = '$familias',
ninios = '$ninios',
ninias = '$ninias',
discapacidad = '$discapacidad',
discapacidadm = '$discapacidadm',
embarazadas = '$embarazadas',
adulto_mayor = '$adultoMayor',
adulto_mayorm = '$adultoMayorm',
num_albergues = '$numAlbergues',
agua = '$agua',
basura = '$basura',
alcantarillado = '$alcantarillado',
electricidad = '$electricidad',
telecom = '$telecom',
transporte = '$transporte',
establecimientossalud = '$establecimientossalud',
heridos = '$heridos',
muertos = '$muertos',
desaparecidos = '$desaparecidos',
lesionados = '$lesionados',
otra_organizacion = '$otraOrganizacion',
sci = '$sci',
sci_donde = '$sciDonde',
lugar_lle = '$lugarLle',
fecha_lle = '$fechaLle',
hora_lle = '$horaLle',
responsable_lle = '$responsableLle',
cargo_lle = '$cargoLle',
telf_fijo_lle = '$telfFijoLle',
telf_cel_lle = '$telfCelLle',
email = '$email',
usuario = '$usuario',
fechap = '$fechap',
enviado = 'NO'
WHERE
    cod_edan = '$codEdan'
""";
    // return "INSERT INTO `edan` VALUES (DEFAULT', '$evento', '$claseEvento', '$fecha', '$hora', '$continua', '$nombre', '$cargo', '$dreccion', '$telFc', '$telCc', '$depto', '$municipio', '$comunidad', '$tieneCoord', '$coordenadaX', '$coordenadaY', '$aereo', '$terrestre', '$fluvial', '$ferroviario', '$partida', '$horaLlegada', '$clima', '$medioComunicacion', $viviendas, $familias, '$agua', '$basura', '$alcantarillado', '$electricidad', '$telecom', '$transporte', $heridos, $muertos, $desaparecidos, '$accionesPrioritarias', '$lugarLle', '$fechaLle', '$horaLle', '$responsableLle', '$cargoLle', '$telfFijoLle', '$telfCelLle', '$email', '$usuario', '$fechap', 'NO')";
  }
}
