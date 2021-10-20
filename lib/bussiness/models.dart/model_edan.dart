class ModelEdan {
  // CREATE TABLE `edan` (
  //   `cod_edan` int(4) NOT NULL AUTO_INCREMENT,
  //   `evento` varchar(50) DEFAULT NULL,
  //   `clase_evento` varchar(50) DEFAULT NULL,
  //   `fecha` date DEFAULT NULL,
  //   `hora` time DEFAULT NULL,
  //   `continua` varchar(2) DEFAULT NULL,
  //   `nombre` varchar(50) DEFAULT NULL,
  //   `cargo` varchar(50) DEFAULT NULL,
  //   `dreccion` varchar(70) DEFAULT NULL,
  //   `tel_fc` varchar(10) DEFAULT NULL,
  //   `tel_cc` varchar(10) DEFAULT NULL,
  //   `depto` varchar(20) DEFAULT NULL,
  //   `municipio` varchar(100) DEFAULT NULL,
  //   `comunidad` varchar(100) DEFAULT NULL,
  //   `tiene_coord` varchar(1) DEFAULT NULL,
  //   `coordenada_x` varchar(20) DEFAULT NULL,
  //   `coordenada_y` varchar(20) DEFAULT NULL,
  //   `aereo` varchar(10) DEFAULT NULL,
  //   `terrestre` varchar(10) DEFAULT NULL,
  //   `fluvial` varchar(10) DEFAULT NULL,
  //   `ferroviario` varchar(10) DEFAULT NULL,
  //   `partida` varchar(50) DEFAULT NULL,
  //   `hora_llegada` varchar(2) DEFAULT NULL,
  //   `clima` varchar(10) DEFAULT NULL,
  //   `medio_comunicacion` varchar(30) DEFAULT NULL,
  //   `viviendas` int(11) DEFAULT NULL,
  //   `familias` int(11) DEFAULT NULL,
  //   `agua` varchar(10) DEFAULT NULL,
  //   `basura` varchar(10) DEFAULT NULL,
  //   `alcantarillado` varchar(10) DEFAULT NULL,
  //   `electricidad` varchar(10) DEFAULT NULL,
  //   `telecom` varchar(10) DEFAULT NULL,
  //   `transporte` varchar(10) DEFAULT NULL,
  //   `heridos` int(11) DEFAULT NULL,
  //   `muertos` int(11) DEFAULT NULL,
  //   `desaparecidos` int(11) DEFAULT NULL,
  //   `acciones_prioritarias` mediumtext,
  //   `lugar_lle` varchar(50) DEFAULT NULL,
  //   `fecha_lle` date DEFAULT NULL,
  //   `hora_lle` time DEFAULT NULL,
  //   `responsable_lle` varchar(50) DEFAULT NULL,
  //   `cargo_lle` varchar(50) DEFAULT NULL,
  //   `telf_fijo_lle` varchar(10) DEFAULT NULL,
  //   `telf_cel_lle` varchar(10) DEFAULT NULL,
  //   `email` varchar(30) DEFAULT NULL,
  //   `usuario` varchar(20) DEFAULT NULL,
  //   `fechap` date DEFAULT NULL,
  //   `enviado` varchar(10) DEFAULT NULL,
  //   PRIMARY KEY (`cod_edan`)
  // ) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

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
  int? viviendas;
  int? familias;
  String? agua;
  String? basura;
  String? alcantarillado;
  String? electricidad;
  String? telecom;
  String? transporte;
  int? heridos;
  int? muertos;
  int? desaparecidos;
  String? accionesPrioritarias;
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
    this.viviendas,
    this.familias,
    this.agua,
    this.basura,
    this.alcantarillado,
    this.electricidad,
    this.telecom,
    this.transporte,
    this.heridos,
    this.muertos,
    this.desaparecidos,
    this.accionesPrioritarias,
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
  });

  Map<String, dynamic> toMap() {
    return {
      'codEdan': codEdan,
      'evento': evento,
      'claseEvento': claseEvento,
      'fecha': fecha,
      'hora': hora,
      'continua': continua,
      'nombre': nombre,
      'cargo': cargo,
      'dreccion': dreccion,
      'telFc': telFc,
      'telCc': telCc,
      'depto': depto,
      'municipio': municipio,
      'comunidad': comunidad,
      'tieneCoord': tieneCoord,
      'coordenadaX': coordenadaX,
      'coordenadaY': coordenadaY,
      'aereo': aereo,
      'terrestre': terrestre,
      'fluvial': fluvial,
      'ferroviario': ferroviario,
      'partida': partida,
      'horaLlegada': horaLlegada,
      'clima': clima,
      'medioComunicacion': medioComunicacion,
      'viviendas': viviendas,
      'familias': familias,
      'agua': agua,
      'basura': basura,
      'alcantarillado': alcantarillado,
      'electricidad': electricidad,
      'telecom': telecom,
      'transporte': transporte,
      'heridos': heridos,
      'muertos': muertos,
      'desaparecidos': desaparecidos,
      'accionesPrioritarias': accionesPrioritarias,
      'lugarLle': lugarLle,
      'fechaLle': fechaLle,
      'horaLle': horaLle,
      'responsableLle': responsableLle,
      'cargoLle': cargoLle,
      'telfFijoLle': telfFijoLle,
      'telfCelLle': telfCelLle,
      'email': email,
      'usuario': usuario,
      'fechap': fechap,
      'enviado': enviado
    };
  }

  ModelEdan.fromMap(Map<String, dynamic> map) {
    codEdan = map['codEdan'];
    evento = map['evento'];
    claseEvento = map['claseEvento'];
    fecha = map['fecha'];
    hora = map['hora'];
    continua = map['continua'];
    nombre = map['nombre'];
    cargo = map['cargo'];
    dreccion = map['dreccion'];
    telFc = map['telFc'];
    telCc = map['telCc'];
    depto = map['depto'];
    municipio = map['municipio'];
    comunidad = map['comunidad'];
    tieneCoord = map['tieneCoord'];
    coordenadaX = map['coordenadaX'];
    coordenadaY = map['coordenadaY'];
    aereo = map['aereo'];
    terrestre = map['terrestre'];
    fluvial = map['fluvial'];
    ferroviario = map['ferroviario'];
    partida = map['partida'];
    horaLlegada = map['horaLlegada'];
    clima = map['clima'];
    medioComunicacion = map['medioComunicacion'];
    viviendas = map['viviendas'];
    familias = map['familias'];
    agua = map['agua'];
    basura = map['basura'];
    alcantarillado = map['alcantarillado'];
    electricidad = map['electricidad'];
    telecom = map['telecom'];
    transporte = map['transporte'];
    heridos = map['heridos'];
    muertos = map['muertos'];
    desaparecidos = map['desaparecidos'];
    accionesPrioritarias = map['accionesPrioritarias'];
    lugarLle = map['lugarLle'];
    fechaLle = map['fechaLle'];
    horaLle = map['horaLle'];
    responsableLle = map['responsableLle'];
    cargoLle = map['cargoLle'];
    telfFijoLle = map['telfFijoLle'];
    telfCelLle = map['telfCelLle'];
    email = map['email'];
    usuario = map['usuario'];
    fechap = map['fechap'];
    enviado = map['enviado'];
  }

  String insertSql() {
    return "INSERT INTO `edan` VALUES (84546, '$evento', '$claseEvento', '$fecha', '$hora', '$continua', '$nombre', '$cargo', '$dreccion', '$telFc', '$telCc', '$depto', '$municipio', '$comunidad', '$tieneCoord', '$coordenadaX', '$coordenadaY', '$aereo', '$terrestre', '$fluvial', '$ferroviario', '$partida', '$horaLlegada', '$clima', '$medioComunicacion', '$viviendas', '$familias', '$agua', '$basura', '$alcantarillado', '$electricidad', '$telecom', '$transporte', '$heridos', '$muertos', '$desaparecidos', '$accionesPrioritarias', '$lugarLle', '$fechaLle', '$horaLle', '$responsableLle', '$cargoLle', '$telfFijoLle', '$telfCelLle', '$email', '$usuario', '$fechap', 'NO')";
    // return "INSERT INTO `edan` VALUES (DEFAULT', '$evento', '$claseEvento', '$fecha', '$hora', '$continua', '$nombre', '$cargo', '$dreccion', '$telFc', '$telCc', '$depto', '$municipio', '$comunidad', '$tieneCoord', '$coordenadaX', '$coordenadaY', '$aereo', '$terrestre', '$fluvial', '$ferroviario', '$partida', '$horaLlegada', '$clima', '$medioComunicacion', $viviendas, $familias, '$agua', '$basura', '$alcantarillado', '$electricidad', '$telecom', '$transporte', $heridos, $muertos, $desaparecidos, '$accionesPrioritarias', '$lugarLle', '$fechaLle', '$horaLle', '$responsableLle', '$cargoLle', '$telfFijoLle', '$telfCelLle', '$email', '$usuario', '$fechap', 'NO')";
  }
}
