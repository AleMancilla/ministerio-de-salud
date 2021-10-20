class ModelEvento {
  int? codevento;
  String? nomevento;
  String? snis;
  int? numSnis;

  ModelEvento.fromMap(Map<String, dynamic> map) {
    codevento = map['codevento'];
    nomevento = map['nomevento'];
    snis = map['snis'];
    numSnis = map['numSnis'];
  }
}
