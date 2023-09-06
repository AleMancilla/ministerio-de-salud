import 'package:flutter/cupertino.dart';
import 'package:ministerio_de_salud/bussiness/database/database.dart';
import 'package:ministerio_de_salud/bussiness/models.dart/model_detalle_de_planilla.dart';
import 'package:ministerio_de_salud/bussiness/models.dart/model_lista_sintomas.dart';
import 'package:ministerio_de_salud/bussiness/models.dart/model_planilla_atencion.dart';

class PlanillasNoEnviadasProvider with ChangeNotifier {
  List<ModelPlanillaDeAtencion> _listPlanillasProvider = [];
  List<ModelPlanillaDeAtencion> get listPlanillasProvider =>
      _listPlanillasProvider;
  set listPlanillasProvider(List<ModelPlanillaDeAtencion> data) {
    _listPlanillasProvider = data;
  }

  setstate() {
    notifyListeners();
  }

  readDataBaseListPlanillas() async {
    DataBaseEdans db = DataBaseEdans();
    await db.initDB();
    _listPlanillasProvider = await db.getAllPlanillaDeAtencion();
    _listPlanillasProvider = _listPlanillasProvider
        .where((element) => element.enviado != 'SI')
        .toList();
    print(_listPlanillasProvider);
    db.closeDB();
    notifyListeners();
  }

  List<ModelDetalleDePlanilla> _listDetalleDePlanilla = [];
  List<ModelDetalleDePlanilla> get listDetalleDePlanilla =>
      _listDetalleDePlanilla;
  set listDetalleDePlanilla(List<ModelDetalleDePlanilla> data) {
    _listDetalleDePlanilla = data;
  }

  addModelDetalleDePlanilla() {
    ModelDetalleDePlanilla modelo = ModelDetalleDePlanilla();
    modelo.sexo.text = 'Hombre';
    _listDetalleDePlanilla.add(modelo);
    notifyListeners();
  }

  removeModelDetalleDePlanilla(ModelDetalleDePlanilla item) {
    _listDetalleDePlanilla.remove(item);
    notifyListeners();
  }

  readDataBaseListtModelListaSintomas() async {
    DataBaseEdans db = DataBaseEdans();
    await db.initDB();
    _listModelListaSintomas = await db.getAllModelListaSintomas();
    db.closeDB();
    notifyListeners();
  }

  List<ModelListaSintomas> _listModelListaSintomas = [];
  List<ModelListaSintomas> get listModelListaSintomas =>
      _listModelListaSintomas;
  set listModelListaSintomas(List<ModelListaSintomas> data) {
    _listModelListaSintomas = data;
  }
}
