import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ministerio_de_salud/pages/login/login_page.dart';
import 'package:ministerio_de_salud/pages/login/redirect_page.dart';
import 'package:ministerio_de_salud/utils/navigator_route.dart';
import 'package:ministerio_de_salud/utils/theme_utils.dart';
import 'package:ministerio_de_salud/utils/user_preferens.dart';

class AppBarWidget extends StatefulWidget {
  final Size size;
  final bool backActivate;
  final Function? ontap;

  const AppBarWidget(
      {Key? key, required this.size, this.backActivate = false, this.ontap})
      : super(key: key);
  @override
  _AppBarWidgetState createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  UserPreferences prefs = UserPreferences();

  @override
  Widget build(BuildContext ctxt) {
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
                if (widget.backActivate)
                  IconButton(
                      onPressed: () {
                        Navigator.pop(ctxt);
                      },
                      icon: const Icon(
                        Icons.chevron_left_outlined,
                        color: Colors.white,
                      )),
                iconButtonSelect(
                  const SizedBox(
                    height: 50,
                    child: Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                  ),
                  widget.ontap ?? () {},
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
          prefs.userNivel = '0';
          navigatorPushReplacement(context, const RedirectPage());
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
        onTap: () => ontap(),
      ),
    );
  }
}
