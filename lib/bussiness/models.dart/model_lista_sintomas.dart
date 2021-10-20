class ModelListaSintomas {
  int? codSintoma;
  String? codigoSintoma;
  String? sintoma;

  ModelListaSintomas.fromMap(Map<String, dynamic> map) {
    codSintoma = map['cod_sintoma'];
    codigoSintoma = map['codigo_sintoma'];
    sintoma = map['sintoma'];
  }
}
