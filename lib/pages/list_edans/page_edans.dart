import 'package:flutter/material.dart';
import 'package:ministerio_de_salud/pages/widgets/group/app_bar_widget.dart';
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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Colors.grey[50],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBarWidget(size: size),
            const SizedBox(width: double.infinity),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text('Lista EDANs NO enviados'),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _datosGenerales(),
                    _datosGenerales(),
                    _datosGenerales(),
                    _datosGenerales(),
                    _buttonSelect('Guardar'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _datosGenerales() {
    return ExpansionTile(
      title: const TitleExpansion(texto: '1.- DATOS GENERALES'),
      children: <Widget>[
        InputExpanded(
            title: 'Nombre de contacto', controller: controllerNombre),
        InputExpanded(title: 'Cargo de contacto', controller: controllerNombre),
        InputExpanded(
            title: 'Dirección de contacto', controller: controllerNombre),
        InputExpanded(
            title: 'Telefono fijo de contacto', controller: controllerNombre),
        InputExpanded(
            title: 'Telefono movil de contacto', controller: controllerNombre),
        InputExpanded(title: 'Comunidad o zona', controller: controllerNombre),
        InputExpanded(
            title: 'Para llegar al lugar se parte de (lugar):',
            controller: controllerNombre),
        InputExpanded(
            title: 'Tiempo de llegada al lugar (en horas)',
            controller: controllerNombre),
      ],
    );
  }

  Widget _buttonSelect(String text) {
    return Material(
      color: Colors.cyan[700],
      child: InkWell(
        child: Container(
          child: Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
          padding: EdgeInsets.all(10),
          // color: Colors.cyan[700],
        ),
        onTap: () {
          print('object');
        },
      ),
    );
  }
}
