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

  const AppBarWidget({Key? key, required this.size, this.backActivate = false})
      : super(key: key);
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
                if (widget.backActivate)
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
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
                  () {
                    // InkWellDrawer();
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
        onTap: () {
          ontap();
        },
      ),
    );
  }
}

class InkWellDrawer extends StatelessWidget {
  const InkWellDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext ctxt) {
    return Drawer(
        child: ListView(children: <Widget>[
      DrawerHeader(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: <Color>[Colors.lightBlue, Colors.blue])),
          child: Container(
            child: Column(
              children: <Widget>[
                Material(
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  elevation: 10,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Image.asset("assets/images/drawerHeader.png",
                        height: 90, width: 90),
                  ),
                ),
                Text(
                  'Flutter',
                  style: TextStyle(color: Colors.white, fontSize: 25.0),
                )
              ],
            ),
          ))
    ]));
  }
}

class CustomListTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function onTap;

  CustomListTile(this.icon, this.text, this.onTap);
  @override
  Widget build(BuildContext context) {
    //ToDO
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey.shade400))),
        child: InkWell(
            splashColor: Colors.orangeAccent,
            onTap: () => onTap,
            child: Container(
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(icon),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                        ),
                        Text(
                          text,
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    Icon(Icons.arrow_right)
                  ],
                ))),
      ),
    );
  }
}
