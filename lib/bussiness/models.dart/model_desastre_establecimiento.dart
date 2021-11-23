class Desastreestablecimiento {
  int? coddesastreestablecimiento;
  int? codEdan;
  String? nomestablecimiento;
  String? funciona;
  String? tieneagua;
  String? areaAfectada;

  Desastreestablecimiento({
    this.coddesastreestablecimiento,
    this.codEdan,
    this.nomestablecimiento,
    this.funciona,
    this.tieneagua,
    this.areaAfectada,
  });

  Map<String, dynamic> toMap() {
    return {
      'coddesastreestablecimiento': coddesastreestablecimiento,
      'cod_edan': codEdan,
      'nomestablecimiento': nomestablecimiento,
      'funciona': funciona,
      'tieneagua': tieneagua,
      'area_afectada': areaAfectada,
    };
  }

  Desastreestablecimiento.fromMap(Map<String, dynamic> map) {
    coddesastreestablecimiento = map['coddesastreestablecimiento'];
    codEdan = map['cod_edan'];
    nomestablecimiento = map['nomestablecimiento'];
    funciona = map['funciona'];
    tieneagua = map['tieneagua'];
    areaAfectada = map['area_afectada'];
  }

  String insertSql() {
    return """INSERT INTO desastreestablecimiento (
  coddesastreestablecimiento,
  cod_edan,
  nomestablecimiento,
  funciona,
  tieneagua,
  area_afectada
) VALUES ( 
  '$coddesastreestablecimiento',
  '$codEdan',
  '$nomestablecimiento',
  '$funciona',
  '$tieneagua',
  '$areaAfectada'
  )""";
  }

  String updateSql() {
    return """
UPDATE desastreestablecimiento SET
coddesastreestablecimiento = '$coddesastreestablecimiento',
cod_edan = '$codEdan',
nomestablecimiento = '$nomestablecimiento',
funciona = '$funciona',
tieneagua = '$tieneagua',
area_afectada = '$areaAfectada'
WHERE
    coddesastreestablecimiento = '$coddesastreestablecimiento'
""";
  }
}
