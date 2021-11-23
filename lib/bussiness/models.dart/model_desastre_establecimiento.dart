class Desastreestablecimiento {
  int? coddesastreestablecimiento;
  int? cod_edan;
  String? nomestablecimiento;
  String? funciona;
  String? tieneagua;
  String? area_afectada;

  Desastreestablecimiento({
    this.coddesastreestablecimiento,
    this.cod_edan,
    this.nomestablecimiento,
    this.funciona,
    this.tieneagua,
    this.area_afectada,
  });

  Map<String, dynamic> toMap() {
    return {
      'coddesastreestablecimiento': coddesastreestablecimiento,
      'cod_edan': cod_edan,
      'nomestablecimiento': nomestablecimiento,
      'funciona': funciona,
      'tieneagua': tieneagua,
      'area_afectada': area_afectada,
    };
  }

  Desastreestablecimiento.fromMap(Map<String, dynamic> map) {
    coddesastreestablecimiento = map['coddesastreestablecimiento'];
    cod_edan = map['cod_edan'];
    nomestablecimiento = map['nomestablecimiento'];
    funciona = map['funciona'];
    tieneagua = map['tieneagua'];
    area_afectada = map['area_afectada'];
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
  '$cod_edan',
  '$nomestablecimiento',
  '$funciona',
  '$tieneagua',
  '$area_afectada'
  )""";
  }

  String updateSql() {
    return """
UPDATE desastreestablecimiento SET
coddesastreestablecimiento = '$coddesastreestablecimiento',
cod_edan = '$cod_edan',
nomestablecimiento = '$nomestablecimiento',
funciona = '$funciona',
tieneagua = '$tieneagua',
area_afectada = '$area_afectada'
WHERE
    coddesastreestablecimiento = '$coddesastreestablecimiento'
""";
  }
}
