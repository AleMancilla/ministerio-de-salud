import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ministerio_de_salud/bussiness/database/database.dart';
import 'package:ministerio_de_salud/pages/list_edans/page_not_send.dart';
import 'package:ministerio_de_salud/pages/planilla_de_atencion/planilla_de_atencion.dart';
import 'package:ministerio_de_salud/pages/login/login_page.dart';
import 'package:ministerio_de_salud/utils/user_preferens.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = UserPreferences();
  await prefs.initPreferences();
  if (Platform.isWindows || Platform.isLinux) {
    // Initialize FFI
    sqfliteFfiInit();
    // Change the default factory
    databaseFactory = databaseFactoryFfi;
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: _pageHome(context),
    );
  }

  Widget _pageHome(BuildContext context) {
    if (!prefs.userIsRegister) {
      return const LoginPage();
    } else {
      if (prefs.userNivel == '1') {
        return const PageNotSend();
      } else if (prefs.userNivel == '2') {
        return const PagePlanillaAtencion();
      } else {
        return const LoginPage();
      }
    }
  }
}
