import 'package:flutter/cupertino.dart';
import 'package:ministerio_de_salud/bussiness/database/database.dart';
import 'package:ministerio_de_salud/bussiness/models.dart/model_danos_personal_de_salud.dart';
import 'package:ministerio_de_salud/bussiness/models.dart/model_desastre_acciones.dart';
import 'package:ministerio_de_salud/bussiness/models.dart/model_desastre_acciones2.dart';
import 'package:ministerio_de_salud/bussiness/models.dart/model_desastre_establecimiento.dart';
import 'package:ministerio_de_salud/bussiness/models.dart/model_desastre_requerimientos.dart';
import 'package:ministerio_de_salud/bussiness/models.dart/model_edan.dart';

class EdanProvider with ChangeNotifier {
  List<ModelEdan> _listEdansProvider = [];
  List<ModelEdan> get listEdansProvider => _listEdansProvider;
  set listEdansProvider(List<ModelEdan> data) {
    _listEdansProvider = data;
  }

  setstate() {
    notifyListeners();
  }

  readDataBaseListEdans() async {
    DataBaseEdans db = DataBaseEdans();
    await db.initDB();
    _listEdansProvider = await db.getAllEdans();
    db.closeDB();
    notifyListeners();
  }

  clearList() {
    _listDesastreestablecimiento = [];
    _listDanospersonaldesalud = [];
    _listDesastreacciones = [];
    _listDesastreacciones2 = [];
    _listDesastrerequerimientos = [];
  }

  readList(String id){
    
  }

  /////////////////////////////////
  List<Desastreestablecimiento> _listDesastreestablecimiento = [];
  List<Danospersonaldesalud> _listDanospersonaldesalud = [];
  List<Desastreacciones> _listDesastreacciones = [];
  List<Desastreacciones2> _listDesastreacciones2 = [];
  List<Desastrerequerimientos> _listDesastrerequerimientos = [];

  List<Desastreestablecimiento> get listDesastreestablecimiento =>
      _listDesastreestablecimiento;
  List<Danospersonaldesalud> get listDanospersonaldesalud =>
      _listDanospersonaldesalud;
  List<Desastreacciones> get listDesastreacciones => _listDesastreacciones;
  List<Desastreacciones2> get listDesastreacciones2 => _listDesastreacciones2;
  List<Desastrerequerimientos> get listDesastrerequerimientos =>
      _listDesastrerequerimientos;
  set listDesastreestablecimiento(List<Desastreestablecimiento> data) {
    _listDesastreestablecimiento = data;
  }

  set listDanospersonaldesalud(List<Danospersonaldesalud> data) {
    _listDanospersonaldesalud = data;
  }

  set listDesastreacciones(List<Desastreacciones> data) {
    _listDesastreacciones = data;
  }

  set listDesastreacciones2(List<Desastreacciones2> data) {
    _listDesastreacciones2 = data;
  }

  set listDesastrerequerimientos(List<Desastrerequerimientos> data) {
    _listDesastrerequerimientos = data;
  }
}
