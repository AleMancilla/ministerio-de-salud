import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:ministerio_de_salud/bussiness/database/database.dart';
import 'package:ministerio_de_salud/pages/list_edans/page_not_send.dart';
import 'package:ministerio_de_salud/pages/planilla_de_atencion/planilla_de_atencion.dart';
import 'package:ministerio_de_salud/pages/planilla_de_atencion/planilla_no_enviada.dart';
import 'package:ministerio_de_salud/pages/widgets/group/app_bar_widget.dart';
import 'package:ministerio_de_salud/pages/widgets/group/body_app_bar.dart';
import 'package:ministerio_de_salud/pages/widgets/unit/button_widget.dart';
import 'package:ministerio_de_salud/pages/widgets/unit/drawer.dart';
import 'package:ministerio_de_salud/pages/widgets/unit/input_text_field.dart';
import 'package:ministerio_de_salud/pages/widgets/unit/sublist_input_list_option.dart';
import 'package:ministerio_de_salud/utils/navigator_route.dart';
import 'package:ministerio_de_salud/utils/user_preferens.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  UserPreferences prefs = UserPreferences();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          child: AppBarWidget(
            backActivate: true,
            size: size,
            ontap: () {
              showDialog(
                context: context,
                builder: (context) => InkWellDrawer(),
              );
              // InkWellDrawer();
            },
          ),
          preferredSize: const Size(double.infinity, 50),
        ),
        // appBar: PreferredSize(
        //   child: AppBarWidget(
        //     size: size,
        //     backActivate: true,
        //   ),
        //   preferredSize: const Size(double.infinity, 50),
        // ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BodyAppBar(text: 'Iniciar Sesión'),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: _bodyLogin(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextEditingController controllerCarnet = TextEditingController();
  TextEditingController controllerNivel = TextEditingController();
  TextEditingController controllerPass = TextEditingController();

  Widget _bodyLogin() {
    return Column(
      children: [
        const Text('Iniciar Sesión'),
        Container(
          padding: const EdgeInsets.all(8.0),
          height: 45,
          constraints: const BoxConstraints(maxWidth: 450),
          child: InputTextFielfWidget(
            controller: controllerCarnet,
            hint: 'Usuario',
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          height: 45,
          constraints: const BoxConstraints(maxWidth: 450),
          child: InputTextFielfWidget(
            controller: controllerPass,
            hint: 'Contraseña',
          ),
        ),
        SizedBox(height: 20),
        // Container(
        //   padding: const EdgeInsets.all(8.0),
        //   height: 45,
        //   constraints: const BoxConstraints(maxWidth: 450),
        //   // decoration: BoxDecoration(
        //   //   borderRadius: BorderRadius.circular(1),
        //   //   border: Border.all(color: Colors.grey),
        //   // ),
        //   child: SubListInputListOption(
        //     controller: controllerNivel,
        //     options: const ['Reportero Edan', 'Planilla de atencion'],
        //   ),
        // ),
        ButtonWidget(
          text: 'Iniciar Sesión',
          ontap: () async {
            if (controllerCarnet.text.length < 2 ||
                controllerPass.text.length < 2) {
              CoolAlert.show(
                context: context,
                type: CoolAlertType.warning,
                title: 'Alerta!!',
                text: 'Por favor, llena correctamente los datos',
              );
            } else {
              DataBaseEdans db = DataBaseEdans();
              await db.initDB();
              String modelUsuarios = await db.getUsuarioLevel(
                  controllerCarnet.text, controllerPass.text);
              print(modelUsuarios);
              db.closeDB();

              if (modelUsuarios != 'null') {
                prefs.userIsRegister = true;
                prefs.userCarnet = controllerCarnet.text;
                prefs.userNivel = modelUsuarios;
                CoolAlert.show(
                    context: context,
                    type: CoolAlertType.loading,
                    text: 'Cargando..');
                Future.delayed(const Duration(seconds: 1), () {
                  Navigator.pop(context);
                  if (prefs.userNivel == '1') {
                    navigatorPushReplacement(context, const PageNotSend());
                  } else if (prefs.userNivel == '2') {
                    navigatorPushReplacement(
                        context, const PlanillaNoEnviada());
                  } else {
                    CoolAlert.show(
                      context: context,
                      type: CoolAlertType.error,
                      title: 'Oops...',
                      text:
                          'Algo salio mal, porfavor contactate con el administrador, su nivel de usuario no esta habilitado para la app',
                      loopAnimation: false,
                    );
                  }
                });
              } else {
                CoolAlert.show(
                  context: context,
                  type: CoolAlertType.warning,
                  title: 'Alerta!!',
                  text: 'Usuario no encontrado, verifique sus datos',
                );
              }
            }
          },
        )
      ],
    );
  }

  String _nivel(String nivel) {
    if (nivel == 'Reportero Edan') {
      return '1';
    }
    if (nivel == 'Planilla de atencion') {
      return '2';
    }
    return '0';
  }
}
