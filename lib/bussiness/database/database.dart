// ignore_for_file: unused_field

import 'package:ministerio_de_salud/bussiness/database/comando_data_base.dart';
import 'package:ministerio_de_salud/bussiness/models.dart/model_edan.dart';
import 'package:ministerio_de_salud/bussiness/models.dart/model_evento.dart';
import 'package:ministerio_de_salud/bussiness/models.dart/model_lista_sintomas.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseEdans {
  late Database _db;

  initDB() async {
    _db = await openDatabase(
      'my_database17.db',
      version: 4,
      onCreate: (db, version) {
        db.execute(queryDataBase);
      },
    );
  }

  insertEDAN(ModelEdan edan) async {
    int response = await _db.rawInsert(edan.insertSql());
    print('###### $response');
  }

  insertEVENTO() async {
    int response = await _db.rawInsert(
        'INSERT INTO evento(nomevento,snis,num_snis) VALUES ("Sequia", "Otros", "22")');
    print('###### $response');
  }
  //INSERT INTO `evento` VALUES ('1', 'Sequia', 'Otros', '22')

  Future<List<ModelEdan>> getAllEdans() async {
    List<Map<String, dynamic>> result = await _db.query('edan');
    return result.map((map) => ModelEdan.fromMap(map)).toList();
  }

  Future<List<ModelEvento>> getAllEventos() async {
    print('#############');
    List<Map<String, dynamic>> result = await _db.query('evento');
    return result.map((map) => ModelEvento.fromMap(map)).toList();
  }

  Future<List<ModelListaSintomas>> getAllModelListaSintomas() async {
    print('#############');
    List<Map<String, dynamic>> result = await _db.query('lista_sintomas');
    return result.map((map) => ModelListaSintomas.fromMap(map)).toList();
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
