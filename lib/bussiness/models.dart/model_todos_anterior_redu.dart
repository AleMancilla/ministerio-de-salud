class TodosAnterioresRedu {
  int? codTable;
  String? codigo;
  String? departamento;
  String? municipio;
  String? comunidad;
  String? establecimiento;

  TodosAnterioresRedu({
    this.codTable,
    this.codigo,
    this.departamento,
    this.municipio,
    this.comunidad,
    this.establecimiento,
  });

  Map<String, dynamic> toMap() {
    return {
      'cod_table': codTable,
      'Codigo': codigo,
      'Departamento': departamento,
      'Municipio': municipio,
      'Comunidad': comunidad,
      'Establecimiento': establecimiento,
    };
  }

  TodosAnterioresRedu.fromMap(Map<String, dynamic> map) {
    codTable = map['cod_table'];
    codigo = map['Codigo'];
    departamento = map['Departamento'];
    municipio = map['Municipio'];
    comunidad = map['Comunidad'];
    establecimiento = map['Establecimiento'];
  }

  String insertSql() {
    return """INSERT INTO todos_anterior_redu (
  cod_table,
  Codigo,
  Departamento,
  Municipio,
  Comunidad,
  Establecimiento
) VALUES ( 
  '$codTable',
  '$codigo',
  '$departamento',
  '$municipio',
  '$comunidad',
  '$establecimiento'
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
Establecimiento = '$establecimiento'
WHERE
    cod_table = '$codTable'
""";
  }
}
