class Desastreacciones {
  int? codEdan;
  String? accion;

  Desastreacciones({
    this.codEdan,
    this.accion,
  });

  Map<String, dynamic> toMap() {
    return {
      'cod_edan': codEdan,
      'accion': accion,
    };
  }

  Desastreacciones.fromMap(Map<String, dynamic> map) {
    codEdan = map['cod_edan'];
    accion = map['accion'];
  }

  String insertSql() {
    return """INSERT INTO desastreacciones (
  cod_edan,
  accion
) VALUES ( 
  '$codEdan',
  '$accion'
  )""";
  }

  String updateSql() {
    return """
UPDATE desastreacciones SET
cod_edan = '$codEdan',
accion = '$accion'
WHERE
    cod_edan = '$codEdan'
""";
  }
}
