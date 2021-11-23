class Desastrerequerimientos {
  int? codrequerimientos;
  int? codEdan;
  String? requerimiento;
  int? cantidad;
  String? prioridad;
  String? observaciones;

  Desastrerequerimientos({
    this.codrequerimientos,
    this.codEdan,
    this.requerimiento,
    this.cantidad,
    this.prioridad,
    this.observaciones,
  });

  Map<String, dynamic> toMap() {
    return {
      'codrequerimientos': codrequerimientos,
      'cod_edan': codEdan,
      'requerimiento': requerimiento,
      'cantidad': cantidad,
      'prioridad': prioridad,
      'observaciones': observaciones,
    };
  }

  Desastrerequerimientos.fromMap(Map<String, dynamic> map) {
    codrequerimientos = map['codrequerimientos'];
    codEdan = map['cod_edan'];
    requerimiento = map['requerimiento'];
    cantidad = map['cantidad'];
    prioridad = map['prioridad'];
    observaciones = map['observaciones'];
  }

  String insertSql() {
    return """INSERT INTO desastrerequerimientos (
  codrequerimientos,
  cod_edan,
  requerimiento,
  cantidad,
  prioridad,
  observaciones
) VALUES ( 
  '$codrequerimientos',
  '$codEdan',
  '$requerimiento',
  '$cantidad',
  '$prioridad',
  '$observaciones'
  )""";
  }

  String updateSql() {
    return """
UPDATE desastrerequerimientos SET
codrequerimientos = '$codrequerimientos',
cod_edan = '$codEdan',
requerimiento = '$requerimiento',
cantidad = '$cantidad',
prioridad = '$prioridad',
observaciones = '$observaciones'
WHERE
    codrequerimientos = '$codrequerimientos'
""";
  }
}
