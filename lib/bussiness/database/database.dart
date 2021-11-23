// ignore_for_file: unused_field

import 'package:ministerio_de_salud/bussiness/database/comando_data_base.dart';
import 'package:ministerio_de_salud/bussiness/database/comando_insert.dart';
import 'package:ministerio_de_salud/bussiness/models.dart/model_edan.dart';
import 'package:ministerio_de_salud/bussiness/models.dart/model_evento.dart';
import 'package:ministerio_de_salud/bussiness/models.dart/model_lista_sintomas.dart';
import 'package:ministerio_de_salud/bussiness/models.dart/model_planilla_atencion.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseEdans {
  late Database _db;

  initDB() async {
    _db = await openDatabase(
      'my_database12.db',
      version: 1,
      onCreate: (Database db, int newVersion) async {
        Batch batch = db.batch();
        // db.execute(queryDataBase);
        listqueryDataBase.forEach((element) {
          batch.execute(element);
        });

        listinsert.forEach((element) {
          batch.execute(element);
        });

        List<dynamic> res = await batch.commit();
        print(' ===> $res');
      },
    );
  }

  closeDB() async {
    await _db.close();
  }

  insertEDAN(ModelEdan edan) async {
    int response = await _db.rawInsert(edan.insertSql());
    print('###### $response');
  }

  updateEDAN(ModelEdan edan) async {
    int response = await _db.rawInsert(edan.updateSql());
    print('###### $response');
  }

  insertPLANILLA(ModelPlanillaDeAtencion planilla) async {
    int response = await _db.rawInsert(planilla.insertSql());
    print('###### $response');
  }

  updatePLANILLA(ModelPlanillaDeAtencion planilla) async {
    int response = await _db.rawInsert(planilla.updateSql());
    print('###### $response');
  }

  insertEVENTO() async {
    int response = await _db.rawInsert(
        '''INSERT INTO evento VALUES (2, 'Granizada', 'Helada/Granizada/Nevada', 18);
INSERT INTO evento VALUES (3, 'Mazamorra', 'Otros', 22);''');
    print('###### $response');
  }
  //INSERT INTO evento VALUES ('1', 'Sequia', 'Otros', '22')

  Future<List<ModelEdan>> getAllEdans() async {
    print('lectura sql');
    List<Map<String, dynamic>> result = await _db.query('edan');
    return result.map((map) => ModelEdan.fromMap(map)).toList();
  }

  Future<List<ModelEvento>> getAllEventos() async {
    List<Map<String, dynamic>> result = await _db.query('evento');
    return result.map((map) => ModelEvento.fromMap(map)).toList();
  }

  Future<List<ModelListaSintomas>> getAllModelListaSintomas() async {
    List<Map<String, dynamic>> result = await _db.query('lista_sintomas');
    return result.map((map) => ModelListaSintomas.fromMap(map)).toList();
  } //ModelPlanillaDeAtencion

  Future<List<ModelPlanillaDeAtencion>> getAllPlanillaDeAtencion() async {
    List<Map<String, dynamic>> result = await _db.query('planilla_atencion');
    return result.map((map) => ModelPlanillaDeAtencion.fromMap(map)).toList();
  }

  Future<String> getLastIDEDAN() async {
    var result = await _db.rawQuery('SELECT Max(cod_edan) as newID from edan');
    print('$result ---****');
    return result[0]['newID'].toString() != 'null'
        ? result[0]['newID'].toString()
        : '1';
  }

  Future<List<String>> getListDepartamento() async {
    var result = await _db.rawQuery(
        'SELECT Departamento FROM todos_anterior_redu group by Departamento');
    var listReturn = result
        .map((e) =>
            e.toString().replaceAll('{Departamento: ', '').replaceAll('}', ''))
        .toList();
    print(listReturn);
    return listReturn;
  }

  Future<List<String>> getListMunicipio(String ciudad) async {
    var result = await _db.rawQuery(
        "select DISTINCT(Municipio) from todos_anterior_redu where Departamento like '$ciudad'");
    var listReturn = result
        .map((e) =>
            e.toString().replaceAll('{Municipio: ', '').replaceAll('}', ''))
        .toList();
    print(listReturn);
    return listReturn;
  }
}

// class Task {
//   late String name;

//   Task(this.name);

//   Map<String, dynamic> toMap() {
//     return {'name': name};
//   }

//   Task.fromMap(Map<String, dynamic> map) {
//     name = map['name'];
//   }
// }
