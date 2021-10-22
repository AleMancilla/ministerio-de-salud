import 'package:flutter/cupertino.dart';
import 'package:ministerio_de_salud/bussiness/database/database.dart';
import 'package:ministerio_de_salud/bussiness/models.dart/model_planilla_atencion.dart';

class PlanillasNoEnviadasProvider with ChangeNotifier {
  List<ModelPlanillaDeAtencion> _listPlanillasProvider = [];
  List<ModelPlanillaDeAtencion> get listPlanillasProvider =>
      _listPlanillasProvider;
  set listPlanillasProvider(List<ModelPlanillaDeAtencion> data) {
    _listPlanillasProvider = data;
  }

  readDataBase() async {
    DataBaseEdans db = DataBaseEdans();
    await db.initDB();
    _listPlanillasProvider = await db.getAllPlanillaDeAtencion();
    notifyListeners();
  }
}
