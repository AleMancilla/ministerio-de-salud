import 'package:flutter/material.dart';
import 'package:ministerio_de_salud/pages/widgets/group/app_bar_widget.dart';
import 'package:ministerio_de_salud/pages/widgets/unit/input_expanded.dart';
import 'package:ministerio_de_salud/pages/widgets/unit/input_list_option.dart';
import 'package:ministerio_de_salud/pages/widgets/unit/title_expansion.dart';

class PageEdans extends StatefulWidget {
  const PageEdans({Key? key}) : super(key: key);

  @override
  State<PageEdans> createState() => _PageEdansState();
}

class _PageEdansState extends State<PageEdans> {
  final listKey = GlobalKey<AnimatedListState>();

  TextEditingController controllerNombre = TextEditingController();
  int number = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          child: AppBarWidget(size: size),
          preferredSize: const Size(double.infinity, 50),
        ),
        body: Container(
          color: Colors.grey[50],
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text('Lista EDANs NO enviados'),
                ),
                _datosGenerales(size),
                _datosGenerales(size),
                _datosGenerales(size),
                _datosGenerales(size),
                _buttonSelect('Guardar'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _datosGenerales(Size size) {
    return Column(
      children: [
        Container(
          width: size.width - 50,
          height: 5,
          decoration: BoxDecoration(
              color: Colors.blueGrey.withOpacity(0.2),
              borderRadius: BorderRadius.circular(100)),
        ),
        ExpansionTile(
          title: const TitleExpansion(texto: '1.- DATOS GENERALES'),
          children: <Widget>[
            InputListOption(
              title: 'Evento',
              controller: controllerNombre,
              isRequired: true,
              options: const ['A', 'B', 'C'],
            ),
            InputExpanded(
              title: 'Nombre de contacto',
              controller: controllerNombre,
              isRequired: true,
            ),
            InputExpanded(
              title: 'Cargo de contacto',
              controller: controllerNombre,
              isRequired: true,
            ),
            InputExpanded(
                title: 'Dirección de contacto', controller: controllerNombre),
            InputExpanded(
                title: 'Telefono fijo de contacto',
                controller: controllerNombre),
            InputExpanded(
                title: 'Telefono movil de contacto',
                controller: controllerNombre),
            InputExpanded(
                title: 'Comunidad o zona', controller: controllerNombre),
            InputExpanded(
              title: 'Para llegar al lugar se parte de (lugar):',
              controller: controllerNombre,
              isRequired: true,
            ),
            InputExpanded(
                title: 'Tiempo de llegada al lugar (en horas)',
                controller: controllerNombre),
          ],
        ),
        const Divider()
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
            style: const TextStyle(color: Colors.white),
          ),
          padding: const EdgeInsets.all(10),
          // color: Colors.cyan[700],
        ),
        onTap: () {
          // print('object');
        },
      ),
    );
  }
}
