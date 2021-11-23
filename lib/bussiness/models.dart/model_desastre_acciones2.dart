class Desastreacciones2 {
  int? cod_edan;
  String? accion;

  Desastreacciones2({
    this.cod_edan,
    this.accion,
  });

  Map<String, dynamic> toMap() {
    return {
      'cod_edan': cod_edan,
      'accion': accion,
    };
  }

  Desastreacciones2.fromMap(Map<String, dynamic> map) {
    cod_edan = map['cod_edan'];
    accion = map['accion'];
  }

  String insertSql() {
    return """INSERT INTO desastreacciones2 (
  cod_edan,
  accion
) VALUES ( 
  '$cod_edan',
  '$accion'
  )""";
  }

  String updateSql() {
    return """
UPDATE desastreacciones2 SET
cod_edan = '$cod_edan',
accion = '$accion'
WHERE
    cod_edan = '$cod_edan'
""";
  }
}
