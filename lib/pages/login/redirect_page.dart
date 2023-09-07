import 'package:flutter/material.dart';
import 'package:ministerio_de_salud/bussiness/database/database.dart';
import 'package:ministerio_de_salud/bussiness/models.dart/model_usuarios.dart';
import 'package:ministerio_de_salud/pages/login/login_page.dart';
import 'package:ministerio_de_salud/pages/widgets/group/app_bar_widget.dart';
import 'package:ministerio_de_salud/pages/widgets/group/body_app_bar.dart';
import 'package:ministerio_de_salud/pages/widgets/unit/button_widget.dart';
import 'package:ministerio_de_salud/pages/widgets/unit/drawer.dart';
import 'package:ministerio_de_salud/utils/navigator_route.dart';
import 'package:ministerio_de_salud/utils/user_preferens.dart';

class RedirectPage extends StatefulWidget {
  const RedirectPage({Key? key}) : super(key: key);

  @override
  State<RedirectPage> createState() => _RedirectPageState();
}

class _RedirectPageState extends State<RedirectPage> {
  UserPreferences prefs = UserPreferences();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          child: AppBarWidget(
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
        ), // appBar: PreferredSize(
        //   child: AppBarWidget(size: size),
        //   preferredSize: const Size(double.infinity, 50),
        // ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BodyAppBar(text: 'Home'),
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

  Widget _bodyLogin() {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ButtonWidget(
                text: 'Ir a la version offline',
                fontSize: 16,
                ontap: () {
                  navigatorPush(context, const LoginPage());
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ButtonWidget(
                text: 'Ir a la version Web',
                fontSize: 16,
                ontap: () async {
                  launchURL('http://186.121.214.199/ugred/login.php');
                }),
          ),
        ],
      ),
    );
  }
}
