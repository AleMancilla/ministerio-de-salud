class Danospersonaldesalud {
  int? codpersalud;
  int? codEdan;
  String? personal;
  int? muertos;
  int? heridos;
  int? enfermos;
  int? disponibles;
  int? desaparecidos;
  String? observaciones;

  Danospersonaldesalud({
    this.codpersalud,
    this.codEdan,
    this.personal,
    this.muertos,
    this.heridos,
    this.enfermos,
    this.disponibles,
    this.desaparecidos,
    this.observaciones,
  });

  Map<String, dynamic> toMap() {
    return {
      'codpersalud': codpersalud,
      'cod_edan': codEdan,
      'personal': personal,
      'muertos': muertos,
      'heridos': heridos,
      'enfermos': enfermos,
      'disponibles': disponibles,
      'desaparecidos': desaparecidos,
      'observaciones': observaciones,
    };
  }

  Danospersonaldesalud.fromMap(Map<String, dynamic> map) {
    codpersalud = map['codpersalud'];
    codEdan = map['cod_edan'];
    personal = map['personal'];
    muertos = map['muertos'];
    heridos = map['heridos'];
    enfermos = map['enfermos'];
    disponibles = map['disponibles'];
    desaparecidos = map['desaparecidos'];
    observaciones = map['observaciones'];
  }

  String insertSql() {
    return """INSERT INTO danospersonaldesalud (
  codpersalud,
  cod_edan,
  personal,
  muertos,
  heridos,
  enfermos,
  disponibles,
  desaparecidos,
  observaciones
) VALUES ( 
  '$codpersalud',
  '$codEdan',
  '$personal',
  '$muertos',
  '$heridos',
  '$enfermos',
  '$disponibles',
  '$desaparecidos',
  '$observaciones'
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
enfermos = '$enfermos',
disponibles = '$disponibles',
desaparecidos = '$desaparecidos',
observaciones = '$observaciones'
WHERE
    codpersalud = '$codpersalud'
""";
  }
}
