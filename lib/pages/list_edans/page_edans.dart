import 'package:flutter/material.dart';
import 'package:ministerio_de_salud/pages/widgets/unit/input_expanded.dart';
import 'package:ministerio_de_salud/pages/widgets/unit/title_expansion.dart';

class PageEdans extends StatefulWidget {
  const PageEdans({Key? key}) : super(key: key);

  @override
  State<PageEdans> createState() => _PageEdansState();
}

class _PageEdansState extends State<PageEdans> {
  List<Widget> listWidgets = [
    Container(
        width: double.infinity,
        height: 100,
        padding: EdgeInsets.all(20),
        color: Colors.red),
    Container(
        width: double.infinity,
        height: 100,
        padding: EdgeInsets.all(20),
        color: Colors.blue),
    Container(
        width: double.infinity,
        height: 100,
        padding: EdgeInsets.all(20),
        color: Colors.orange),
  ];

  Widget cont = Container(
      width: double.infinity,
      height: 100,
      padding: EdgeInsets.all(20),
      color: Colors.blueGrey[900]);

  final listKey = GlobalKey<AnimatedListState>();

  TextEditingController controllerNombre = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[350],
        child: ListView(
          children: [
            ExpansionTile(
              title: TitleExpansion(texto: 'texto 1 demo'),
              children: <Widget>[
                InputExpanded(
                  title: 'Nombre de contacto',
                  hint: 'Nombre de contacto',
                  controller: controllerNombre,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
