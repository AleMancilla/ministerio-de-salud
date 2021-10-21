import 'package:flutter/cupertino.dart';
import 'package:ministerio_de_salud/bussiness/database/database.dart';
import 'package:ministerio_de_salud/bussiness/models.dart/model_edan.dart';

class EdanProvider with ChangeNotifier {
  List<ModelEdan> _listEdansProvider = [];
  List<ModelEdan> get listEdansProvider => _listEdansProvider;
  set listEdansProvider(List<ModelEdan> data) {
    _listEdansProvider = data;
  }

  readDataBase() async {
    DataBaseEdans db = DataBaseEdans();
    await db.initDB();
    _listEdansProvider = await db.getAllEdans();
    notifyListeners();
  }
}
