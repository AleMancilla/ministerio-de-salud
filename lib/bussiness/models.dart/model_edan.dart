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
  bool? controllerEnviar = false;

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
    this.controllerEnviar = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'coddan': codEdan,
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
    accionesPrioritarias = map['acciones_prioritarias'];
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
    return """INSERT INTO edan (evento,
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
viviendas,
familias,
agua,
basura,
alcantarillado,
electricidad,
telecom,
transporte,
heridos,
muertos,
desaparecidos,
acciones_prioritarias,
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
) VALUES ( '$evento', '$claseEvento', '$fecha', '$hora', '$continua', '$nombre', '$cargo', '$dreccion', '$telFc', '$telCc', '$depto', '$municipio', '$comunidad', '$tieneCoord', '$coordenadaX', '$coordenadaY', '$aereo', '$terrestre', '$fluvial', '$ferroviario', '$partida', '$horaLlegada', '$clima', '$medioComunicacion', '$viviendas', '$familias', '$agua', '$basura', '$alcantarillado', '$electricidad', '$telecom', '$transporte', '$heridos', '$muertos', '$desaparecidos', '$accionesPrioritarias', '$lugarLle', '$fechaLle', '$horaLle', '$responsableLle', '$cargoLle', '$telfFijoLle', '$telfCelLle', '$email', '$usuario', '$fechap', 'NO')""";
    // return "INSERT INTO `edan` VALUES (DEFAULT', '$evento', '$claseEvento', '$fecha', '$hora', '$continua', '$nombre', '$cargo', '$dreccion', '$telFc', '$telCc', '$depto', '$municipio', '$comunidad', '$tieneCoord', '$coordenadaX', '$coordenadaY', '$aereo', '$terrestre', '$fluvial', '$ferroviario', '$partida', '$horaLlegada', '$clima', '$medioComunicacion', $viviendas, $familias, '$agua', '$basura', '$alcantarillado', '$electricidad', '$telecom', '$transporte', $heridos, $muertos, $desaparecidos, '$accionesPrioritarias', '$lugarLle', '$fechaLle', '$horaLle', '$responsableLle', '$cargoLle', '$telfFijoLle', '$telfCelLle', '$email', '$usuario', '$fechap', 'NO')";
  }

  String updateSql() {
    return """
UPDATE edan SET  
cod_edan = '$codEdan',
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
viviendas = '$viviendas',
familias = '$familias',
agua = '$agua',
basura = '$basura',
alcantarillado = '$alcantarillado',
electricidad = '$electricidad',
telecom = '$telecom',
transporte = '$transporte',
heridos = '$heridos',
muertos = '$muertos',
desaparecidos = '$desaparecidos',
acciones_prioritarias = '$accionesPrioritarias',
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
