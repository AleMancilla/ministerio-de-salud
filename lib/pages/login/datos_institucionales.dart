import 'package:flutter/material.dart';

class DatosInstituciuonales extends StatelessWidget {
  const DatosInstituciuonales({Key? key}) : super(key: key);

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
                'assets/images/fondo.png',
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.cover,
              ),
              // color: backgroundPrimaryColor,
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      'Unidad de Gestión de Riesgos, Emergencias y Desastres',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 30),
                  _item(Color.fromRGBO(232, 143, 13, 1), '- 	Visión',
                      'Constituirse en una Unidad especializada del MINISTERIO DE SALUD Y DEPORTESDE BOLIVIA, que realiza la gestión y la organización de la implementación de las intervenciones de salud a nivel nacional en caso de emergencias y desastres, con enfoque de gestión de riesgos.'),
                  _item(Color.fromRGBO(244, 212, 13, 1), '- Misión',
                      'Fortalecer la rectoría del MINISTERIO DE SALUD Y DEPORTES en la gestión ante contingencias, emergencias y/o desastres, mediante la inclusión de la gestión integral del riesgo, y la política SAFCI permitiendo así una respuesta rápida y efectiva a nivel institucional, con el fin de minimizar los daños y efectos sobre la salud en la población afectada'),
                  // _item(Color.fromRGBO(33, 160, 133, 1), '- Objetivos',
                  //     '“Definir las líneas estratégicas y acciones en cuanto a la gestión de riesgo en salud del Ministerio de Salud articulados a los niveles departamentales y municipales para mejorar la capacidad de prevención, respuesta, alerta temprana y participación interinstitucional y la sociedad, reduciendo las consecuencias de los eventos adversos que afecten a la población de Bolivia”.'),
                  SizedBox(height: 50),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _item(Color? colo, String title, String text) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: colo ?? Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
