class ModeloDetallePlanilla {
  int? codDetalle;
  int? codPlanilla;
  int? edad;
  String? sexo;
  String? diagnostico;
  int? cantidad;

  ModeloDetallePlanilla({
    this.codDetalle,
    this.codPlanilla,
    this.edad,
    this.sexo,
    this.diagnostico,
    this.cantidad,
  });

  Map<String, dynamic> toMap() {
    return {
      'cod_detalle': codDetalle,
      'cod_planilla': codPlanilla,
      'edad': edad,
      'sexo': sexo,
      'diagnostico': diagnostico,
      'cantidad': cantidad
    };
  }

  ModeloDetallePlanilla.fromMap(Map<String, dynamic> map) {
    codDetalle = map['cod_detalle'];
    codPlanilla = map['cod_planilla'];
    edad = map['edad'];
    sexo = (map['sexo'] == 'h' ? 'Hombre' : 'Mujer');
    diagnostico = map['diagnostico'];
    cantidad = map['cantidad'];
  }

  String insertSql() {
    return """INSERT INTO planilla_detalle (
cod_detalle,
cod_planilla,
edad,
sexo,
diagnostico,
cantidad
) VALUES ( 
  '$codDetalle',
 '$codPlanilla',
 '$edad',
 '${sexo == 'Hombre' ? 'h' : 'm'}',
 '$diagnostico',
 '$cantidad')""";
  }

  String updateSql() {
    return """
UPDATE planilla_detalle SET  
cod_detalle = '$codDetalle',
cod_planilla = '$codPlanilla',
edad = '$edad',
sexo = '${sexo == 'Hombre' ? 'h' : 'm'}',
diagnostico = '$diagnostico',
cantidad = '$cantidad'
WHERE
    cod_detalle = '$codDetalle' 
""";
    // return "INSERT INTO `edan` VALUES (DEFAULT', '$evento', '$claseEvento', '$fecha', '$hora', '$continua', '$nombre', '$cargo', '$dreccion', '$telFc', '$telCc', '$depto', '$municipio', '$comunidad', '$tieneCoord', '$coordenadaX', '$coordenadaY', '$aereo', '$terrestre', '$fluvial', '$ferroviario', '$partida', '$horaLlegada', '$clima', '$medioComunicacion', $viviendas, $familias, '$agua', '$basura', '$alcantarillado', '$electricidad', '$telecom', '$transporte', $heridos, $muertos, $desaparecidos, '$accionesPrioritarias', '$lugarLle', '$fechaLle', '$horaLle', '$responsableLle', '$cargoLle', '$telfFijoLle', '$telfCelLle', '$email', '$usuario', '$fechap', 'NO')";
  }
}
