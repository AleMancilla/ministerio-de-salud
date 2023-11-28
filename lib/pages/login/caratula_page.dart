import 'package:flutter/material.dart';
import 'package:ministerio_de_salud/pages/login/datos_institucionales.dart';
import 'package:ministerio_de_salud/pages/login/login_page.dart';
import 'package:ministerio_de_salud/utils/navigator_route.dart';
import 'package:ministerio_de_salud/utils/theme_utils.dart';

class CaratulaPage extends StatelessWidget {
  const CaratulaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.asset(
                'assets/images/fondo.gif',
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.cover,
              ),
              // color: backgroundPrimaryColor,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/logojuego.png',
                  width: 270,
                ),
                SizedBox(height: 100),
                InkWell(
                  onTap: () {
                    navigatorPush(context, const DatosInstituciuonales());
                  },
                  child: Image.asset(
                    'assets/images/btn1.png',
                    width: 270,
                  ),
                ),
                SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    navigatorPush(context, const LoginPage());
                  },
                  child: Image.asset(
                    'assets/images/btn2.png',
                    width: 270,
                  ),
                ),
                SizedBox(height: 60),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    'Evaluación de Daños y Análisis de Necesidades de Salud en situaciones de desastre',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    'EDAN SALUD BOLIVIA',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
