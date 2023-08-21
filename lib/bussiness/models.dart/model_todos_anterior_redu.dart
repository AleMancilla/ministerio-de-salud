class TodosAnterioresRedu {
  int? codTable;
  String? codigo;
  String? departamento;
  String? municipio;
  String? comunidad;
  String? establecimiento;
  String? coordenadaX;
  String? coordenadaY;

  TodosAnterioresRedu({
    this.codTable,
    this.codigo,
    this.departamento,
    this.municipio,
    this.comunidad,
    this.establecimiento,
    this.coordenadaX,
    this.coordenadaY,
  });

  Map<String, dynamic> toMap() {
    return {
      'cod_table': codTable,
      'Codigo': codigo,
      'Departamento': departamento,
      'Municipio': municipio,
      'Comunidad': comunidad,
      'Establecimiento': establecimiento,
      'coordenada_x': coordenadaX,
      'coordenada_y': coordenadaY,
    };
  }

  TodosAnterioresRedu.fromMap(Map<String, dynamic> map) {
    codTable = map['cod_table'];
    codigo = map['Codigo'];
    departamento = map['Departamento'];
    municipio = map['Municipio'];
    comunidad = map['Comunidad'];
    establecimiento = map['Establecimiento'];
    coordenadaX = map['coordenada_x'];
    coordenadaY = map['coordenada_y'];
  }

  String insertSql() {
    return """INSERT INTO todos_anterior_redu (
  cod_table,
  Codigo,
  Departamento,
  Municipio,
  Comunidad,
  Establecimiento,
  coordenada_x,
  coordenada_y
) VALUES ( 
  '$codTable',
  '$codigo',
  '$departamento',
  '$municipio',
  '$comunidad',
  '$establecimiento',
  '$coordenadaX',
  '$coordenadaY'
  )""";
  }

  String updateSql() {
    return """
UPDATE todos_anterior_redu SET
cod_table = '$codTable',
Codigo = '$codigo',
Departamento = '$departamento',
Municipio = '$municipio',
Comunidad = '$comunidad',
Establecimiento = '$establecimiento',
coordenada_x = '$coordenadaX',
coordenada_y = '$coordenadaY'
WHERE
    cod_table = '$codTable'
""";
  }
}
