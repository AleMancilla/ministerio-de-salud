class Danospersonaldesalud {
  int? codpersalud;
  int? codEdan;
  String? personal;
  int? muertos;
  int? heridos;
  int? disponibles;
  int? desaparecidos;

  Danospersonaldesalud({
    this.codpersalud,
    this.codEdan,
    this.personal,
    this.muertos,
    this.heridos,
    this.disponibles,
    this.desaparecidos,
  });

  Map<String, dynamic> toMap() {
    return {
      'codpersalud': codpersalud,
      'cod_edan': codEdan,
      'personal': personal,
      'muertos': muertos,
      'heridos': heridos,
      'disponibles': disponibles,
      'desaparecidos': desaparecidos,
    };
  }

  Danospersonaldesalud.fromMap(Map<String, dynamic> map) {
    codpersalud = map['codpersalud'];
    codEdan = map['cod_edan'];
    personal = map['personal'];
    muertos = map['muertos'];
    heridos = map['heridos'];
    disponibles = map['disponibles'];
    desaparecidos = map['desaparecidos'];
  }

  String insertSql() {
    return """INSERT INTO danospersonaldesalud (
  codpersalud,
  cod_edan,
  personal,
  muertos,
  heridos,
  disponibles,
  desaparecidos
) VALUES ( 
  '$codpersalud',
  '$codEdan',
  '$personal',
  '$muertos',
  '$heridos',
  '$disponibles',
  '$desaparecidos'
  )""";
  }

  String updateSql() {
    return """
UPDATE danospersonaldesalud SET
codpersalud = '$codpersalud',
cod_edan = '$codEdan',
personal = '$personal',
muertos = '$muertos',
heridos = '$heridos',
disponibles = '$disponibles',
desaparecidos = '$desaparecidos'
WHERE
    codpersalud = '$codpersalud'
""";
  }
}
