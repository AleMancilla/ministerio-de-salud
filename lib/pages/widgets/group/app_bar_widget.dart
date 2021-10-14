import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ministerio_de_salud/pages/login/login_page.dart';
import 'package:ministerio_de_salud/utils/navigator_route.dart';
import 'package:ministerio_de_salud/utils/theme_utils.dart';
import 'package:ministerio_de_salud/utils/user_preferens.dart';

class AppBarWidget extends StatefulWidget {
  final Size size;

  const AppBarWidget({Key? key, required this.size}) : super(key: key);
  @override
  _AppBarWidgetState createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  UserPreferences prefs = UserPreferences();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      width: double.infinity,
      height: 50,
      child: Row(
        children: [
          if (widget.size.width > 720)
            Container(
              height: 50,
              width: 230,
              child: Image.asset('assets/images/logo_p.png'),
              color: backgroundPrimaryColor,
            ),
          Expanded(
            child: Row(
              children: [
                iconButtonSelect(
                  const SizedBox(
                    height: 50,
                    child: Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                  ),
                  () {
                    // Navigator.pop(context);
                    // print('object');
                  },
                ),
                Expanded(child: Container()),
                _iconLeft(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _iconLeft() {
    if (prefs.userIsRegister) {
      return iconButtonSelect(
        Container(
          height: 50,
          alignment: Alignment.center,
          child: const Text(
            'Salir',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        () {
          prefs.userIsRegister = false;
          prefs.userCarnet = '';
          prefs.userNivel = '';
          navigatorPushReplacement(context, const LoginPage());
          // print('object');
        },
      );
    } else {
      return iconButtonSelect(
        Container(
          height: 50,
          alignment: Alignment.center,
          child: const Text(
            'Iniciar Sesión',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        () {
          prefs.userIsRegister = false;
          prefs.userCarnet = '';
          prefs.userNivel = '';
          navigatorPushReplacement(context, const LoginPage());
          // print('object');
        },
      );
    }
  }

  Widget iconButtonSelect(Widget icon, Function ontap) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: icon,
        ),
        onTap: () {
          ontap();
        },
      ),
    );
  }
}
