import 'package:galileo_mysql/galileo_mysql.dart';

class MySqlConnect {
  static final MySqlConnect _instancia = MySqlConnect._internal();

  factory MySqlConnect() {
    return _instancia;
  }

  MySqlConnect._internal();

  var settings = ConnectionSettings(
    host: 'localhost',
    port: 3306,
    user: 'id17985222_ministerio',
    password: '0)-rYWkRwI[^u%e4',
    db: 'id17985222_min_salud',
    // useSSL: true,
  );
  var conn;

  initDataBaseMySql() async {
    conn = await MySqlConnection.connect(settings);
    print(' ### MY SQL ## $conn #');
  }

  // set userIsRegister(bool status) {
  //   _prefs.setBool('prefs_userIsRegister', status);
  // }

  // bool get userIsRegister => _prefs.getBool('prefs_userIsRegister') ?? false;

  // set userCarnet(String status) {
  //   _prefs.setString('prefs_userCarnet', status);
  // }

  // String get userCarnet => _prefs.getString('prefs_userCarnet') ?? 'Sin Datos';

  // set userNivel(String status) {
  //   _prefs.setString('prefs_userNivel', status);
  // }

  // String get userNivel => _prefs.getString('prefs_userNivel') ?? '0';
}
