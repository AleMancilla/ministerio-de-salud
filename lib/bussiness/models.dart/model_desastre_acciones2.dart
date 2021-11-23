class Desastreacciones2 {
  int? codEdan;
  String? accion;

  Desastreacciones2({
    this.codEdan,
    this.accion,
  });

  Map<String, dynamic> toMap() {
    return {
      'cod_edan': codEdan,
      'accion': accion,
    };
  }

  Desastreacciones2.fromMap(Map<String, dynamic> map) {
    codEdan = map['cod_edan'];
    accion = map['accion'];
  }

  String insertSql() {
    return """INSERT INTO desastreacciones2 (
  cod_edan,
  accion
) VALUES ( 
  '$codEdan',
  '$accion'
  )""";
  }

  String updateSql() {
    return """
UPDATE desastreacciones2 SET
cod_edan = '$codEdan',
accion = '$accion'
WHERE
    cod_edan = '$codEdan'
""";
  }
}
