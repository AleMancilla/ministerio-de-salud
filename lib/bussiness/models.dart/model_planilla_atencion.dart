class ModelPlanillaDeAtencion {
  String? usuario;
  int? codPlanilla;
  int? codEdan;
  String? depto;
  String? municipio;
  String? comunidad;
  String? nomestablecimiento;
  String? gerenciaRed;
  int? poblacion;
  String? fecha;
  String? hora;
  String? evento;
  String? nombreResponsable;
  String? cargoResponsable;
  String? telfResponsable;
  String? enviado;
  bool? controllerEnviar = false;

  ModelPlanillaDeAtencion({
    this.usuario,
    this.codPlanilla,
    this.codEdan,
    this.depto,
    this.municipio,
    this.comunidad,
    this.nomestablecimiento,
    this.gerenciaRed,
    this.poblacion,
    this.fecha,
    this.hora,
    this.evento,
    this.nombreResponsable,
    this.cargoResponsable,
    this.telfResponsable,
    this.enviado,
    this.controllerEnviar = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'usuario': usuario,
      'cod_planilla': codPlanilla,
      'cod_edan': codEdan,
      'depto': depto,
      'municipio': municipio,
      'comunidad': comunidad,
      'nomestablecimiento': nomestablecimiento,
      'gerencia_red': gerenciaRed,
      'poblacion': poblacion,
      'fecha': fecha,
      'hora': hora,
      'evento': evento,
      'nombre_responsable': nombreResponsable,
      'cargo_responsable': cargoResponsable,
      'telf_responsable': telfResponsable,
      'enviado': enviado
    };
  }

  ModelPlanillaDeAtencion.fromMap(Map<String, dynamic> map) {
    usuario = map['usuario'];
    codPlanilla = map['cod_planilla'];
    codEdan = map['cod_edan'];
    depto = map['depto'];
    municipio = map['municipio'];
    comunidad = map['comunidad'];
    nomestablecimiento = map['nomestablecimiento'];
    gerenciaRed = map['gerencia_red'];
    poblacion = map['poblacion'];
    fecha = map['fecha'];
    hora = map['hora'];
    evento = map['evento'];
    nombreResponsable = map['nombre_responsable'];
    cargoResponsable = map['cargo_responsable'];
    telfResponsable = map['telf_responsable'];
    enviado = map['enviado'];
  }

  String insertSql() {
    return """INSERT INTO planilla_atencion (
      evento,
usuario,
cod_edan,
depto,
municipio,
comunidad,
nomestablecimiento,
gerencia_red,
poblacion,
fecha,
hora,
evento,
nombre_responsable,
cargo_responsable,
telf_responsable,
enviado
) VALUES ( 
  '$evento',
 '$usuario',
 '$codEdan',
 '$depto',
 '$municipio',
 '$comunidad',
 '$nomestablecimiento',
 '$gerenciaRed',
 '$poblacion',
 '$fecha',
 '$hora',
 '$evento',
 '$nombreResponsable',
 '$cargoResponsable',
 '$telfResponsable',
 '$enviado')""";
  }

  String updateSql() {
    return """
UPDATE planilla_atencion SET  
usuario = '$usuario',
cod_planilla = '$codPlanilla',
cod_edan = '$codEdan',
depto = '$depto',
municipio = '$municipio',
comunidad = '$comunidad',
nomestablecimiento = '$nomestablecimiento',
gerencia_red = '$gerenciaRed',
poblacion = '$poblacion',
fecha = '$fecha',
hora = '$hora',
evento = '$evento',
nombre_responsable = '$nombreResponsable',
cargo_responsable = '$cargoResponsable',
telf_responsable = '$telfResponsable',
enviado = '$enviado'
WHERE
    cod_planilla = '$codPlanilla' 
""";
    // return "INSERT INTO `edan` VALUES (DEFAULT', '$evento', '$claseEvento', '$fecha', '$hora', '$continua', '$nombre', '$cargo', '$dreccion', '$telFc', '$telCc', '$depto', '$municipio', '$comunidad', '$tieneCoord', '$coordenadaX', '$coordenadaY', '$aereo', '$terrestre', '$fluvial', '$ferroviario', '$partida', '$horaLlegada', '$clima', '$medioComunicacion', $viviendas, $familias, '$agua', '$basura', '$alcantarillado', '$electricidad', '$telecom', '$transporte', $heridos, $muertos, $desaparecidos, '$accionesPrioritarias', '$lugarLle', '$fechaLle', '$horaLle', '$responsableLle', '$cargoLle', '$telfFijoLle', '$telfCelLle', '$email', '$usuario', '$fechap', 'NO')";
  }
}
