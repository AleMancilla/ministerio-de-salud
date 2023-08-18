// ignore_for_file: unused_field

import 'package:ministerio_de_salud/bussiness/database/comando_data_base.dart';
import 'package:ministerio_de_salud/bussiness/database/comando_insert.dart';
import 'package:ministerio_de_salud/bussiness/models.dart/model_danos_personal_de_salud.dart';
import 'package:ministerio_de_salud/bussiness/models.dart/model_desastre_acciones.dart';
import 'package:ministerio_de_salud/bussiness/models.dart/model_desastre_acciones2.dart';
import 'package:ministerio_de_salud/bussiness/models.dart/model_desastre_establecimiento.dart';
import 'package:ministerio_de_salud/bussiness/models.dart/model_desastre_requerimientos.dart';
import 'package:ministerio_de_salud/bussiness/models.dart/model_edan.dart';
import 'package:ministerio_de_salud/bussiness/models.dart/model_evento.dart';
import 'package:ministerio_de_salud/bussiness/models.dart/model_lista_sintomas.dart';
import 'package:ministerio_de_salud/bussiness/models.dart/model_planilla_atencion.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseEdans {
  late Database _db;

  initDB() async {
    _db = await openDatabase(
      'my_database16.db',
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
  /////////////////////////////

  updateDesastrerequerimientos(Desastrerequerimientos date) async {
    int response = await _db.rawInsert(date.updateSql());
    print('###### $response');
  }

  updateDaniosEstablecimientosDeSalud(Desastreestablecimiento date) async {
    int response = await _db.rawInsert(date.updateSql());
    print('###### $response');
  }

  updateDaniosPersonalDeSalud(Danospersonaldesalud date) async {
    int response = await _db.rawInsert(date.updateSql());
    print('###### $response');
  }

  Future<void> updateEDAN(ModelEdan edan) async {
    int response = await _db.rawInsert(edan.updateSql());
    print('###### $response');
  }

  updateEviadoEDAN(String idedan) async {
    print('###### entro a update');
    int response = await _db.rawUpdate(
        "UPDATE edan SET enviado = 'SI',evento = 'demomo' WHERE cod_edan = '$idedan'");
    print('### y saluio con esto ### $response');
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
    print(result);
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

  Future<List<String>> getListEstablecimientoDeSalud(
      String ciudad, String municipio) async {
    var result = await _db.rawQuery(
        "select Establecimiento from todos_anterior_redu where Departamento like '$ciudad' and Municipio like '$municipio'");
    var listReturn = result
        .map((e) => e
            .toString()
            .replaceAll('{Establecimiento: ', '')
            .replaceAll('}', ''))
        .toList();
    print(listReturn);
    return listReturn;
  }

  ////////////////////////////////////////////////////////

  Future<String> getLastdesastreestablecimiento() async {
    var result = await _db.rawQuery(
        'SELECT Max(coddesastreestablecimiento) as newID from desastreestablecimiento');
    print('$result ---****');
    return result[0]['newID'].toString() != 'null'
        ? result[0]['newID'].toString()
        : '1';
  }

  Future<String> getLastdanospersonaldesalud() async {
    var result = await _db
        .rawQuery('SELECT Max(codpersalud) as newID from danospersonaldesalud');
    print('$result ---****');
    return result[0]['newID'].toString() != 'null'
        ? result[0]['newID'].toString()
        : '1';
  }

  Future<String> getLastdesastreacciones() async {
    var result = await _db
        .rawQuery('SELECT Max(cod_edan) as newID from desastreacciones');
    print('$result ---****');
    return result[0]['newID'].toString() != 'null'
        ? result[0]['newID'].toString()
        : '1';
  }

  Future<String> getLastdesastrerequerimientos() async {
    var result = await _db.rawQuery(
        'SELECT Max(codrequerimientos) as newID from desastrerequerimientos');
    print('$result ---****');
    return result[0]['newID'].toString() != 'null'
        ? result[0]['newID'].toString()
        : '1';
  }

  void getDaniosEstablecimientosDeSalud() async {
    var result = await _db
        .rawQuery("select * from desastreestablecimiento where Departamento");
    // var listReturn = result
    //     .map((e) => e
    //         .toString()
    //         .replaceAll('{Establecimiento: ', '')
    //         .replaceAll('}', ''))
    //     .toList();
    print('==============');
    print(result);
    print('==============');
    // return listReturn;
  }

  ///
  Future<void> insertDaniosEstablecimientosDeSalud(
      Desastreestablecimiento model) async {
    int response = await _db.rawInsert(model.insertSql());
    print('###### $response');
  }

  Future<void> insertDaniosAlPersonalDeSalud(Danospersonaldesalud model) async {
    int response = await _db.rawInsert(model.insertSql());
    print('###### $response');
  }

  Future<void> insertDaniosPersonalDeSalud(Danospersonaldesalud model) async {
    int response = await _db.rawInsert(model.insertSql());
    print('###### $response');
  }

  Future<void> insertlistAcciones(Desastreacciones model) async {
    int response = await _db.rawInsert(model.insertSql());
    print('###### $response');
  }

  Future<void> insertlistAcciones2(Desastreacciones2 model) async {
    int response = await _db.rawInsert(model.insertSql());
    print('###### $response');
  }

  Future<void> insertDesastrerequerimientos(
      Desastrerequerimientos model) async {
    int response = await _db.rawInsert(model.insertSql());
    print('###### $response');
  }

  /////////////////////////////////

  Future<List<Desastreestablecimiento>> getAllDaniosEstablecimientosDeSalud(
      int id) async {
    print('lectura sql');
    List<Map<String, dynamic>> result = await _db.query(
      'desastreestablecimiento',
      where: 'cod_edan = $id',
      // whereArgs: [id]
    );
    return result.map((map) => Desastreestablecimiento.fromMap(map)).toList();
  }

  Future<List<Danospersonaldesalud>> getAllDaniosPersonalDeSalud(int id) async {
    print('lectura sql');
    List<Map<String, dynamic>> result = await _db.query(
      'danospersonaldesalud',
      where: 'cod_edan = $id',
      // whereArgs: [id]
    );
    return result.map((map) => Danospersonaldesalud.fromMap(map)).toList();
  }

  Future<List<Desastreacciones>> getAllAcciones(int id) async {
    print('lectura sql');
    List<Map<String, dynamic>> result = await _db.query(
      'desastreacciones',
      where: 'cod_edan = $id',
      // whereArgs: [id]
    );
    return result.map((map) => Desastreacciones.fromMap(map)).toList();
  }

  Future<List<Desastreacciones2>> getAllAcciones2(int id) async {
    print('lectura sql');
    List<Map<String, dynamic>> result = await _db.query(
      'desastreacciones2',
      where: 'cod_edan = $id',
      // whereArgs: [id]
    );
    return result.map((map) => Desastreacciones2.fromMap(map)).toList();
  }

  Future<List<Desastrerequerimientos>> getRequerimientoApoyo(int id) async {
    print('lectura sql');
    List<Map<String, dynamic>> result = await _db.query(
      'desastrerequerimientos',
      where: 'cod_edan = $id',
      // whereArgs: [id]
    );
    return result.map((map) => Desastrerequerimientos.fromMap(map)).toList();
  }
}
