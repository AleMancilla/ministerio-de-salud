import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ministerio_de_salud/bussiness/database/database.dart';
import 'package:ministerio_de_salud/bussiness/database/mysqlphp/mysql_data.dart';
import 'package:ministerio_de_salud/bussiness/my_sql_connect.dart';
import 'package:ministerio_de_salud/bussiness/providers/edan_provider.dart';
import 'package:ministerio_de_salud/bussiness/providers/planillas_no_enviadas_provider.dart';
import 'package:ministerio_de_salud/pages/list_edans/page_not_send.dart';
import 'package:ministerio_de_salud/pages/login/login_page.dart';
import 'package:ministerio_de_salud/pages/login/redirect_page.dart';
import 'package:ministerio_de_salud/pages/planilla_de_atencion/planilla_no_enviada.dart';
import 'package:ministerio_de_salud/utils/user_preferens.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:window_size/window_size.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = UserPreferences();
  await prefs.initPreferences();
  // final mysql = MySqlConnect();
  // await mysql.initDataBaseMySql();
  getMethod();
  if (Platform.isWindows || Platform.isLinux) {
    // Initialize FFI
    sqfliteFfiInit();
    // Change the default factory
    databaseFactory = databaseFactoryFfi;

    setWindowTitle('Ministerio de salud');
    setWindowMinSize(const Size(700, 500));
    setWindowMaxSize(Size.infinite);
  }
  DataBaseEdans db = DataBaseEdans();

  db.initDB();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final UserPreferences prefs = UserPreferences();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => EdanProvider()),
        ChangeNotifierProvider(create: (_) => PlanillasNoEnviadasProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ministerio de salud',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: _pageHome(),
      ),
    );
  }

  Widget _pageHome() {
    if (!prefs.userIsRegister) {
      if (prefs.userNivel == '0' || prefs.userNivel == '') {
        return const RedirectPage();
      } else {
        return const LoginPage();
      }
    } else {
      if (prefs.userNivel == '1') {
        return const PageNotSend();
      } else if (prefs.userNivel == '2') {
        return const PlanillaNoEnviada();
      } else {
        return const RedirectPage();
      }
    }
  }
}
