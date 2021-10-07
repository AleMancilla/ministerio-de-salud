import 'package:flutter/material.dart';
import 'package:ministerio_de_salud/pages/widgets/group/app_bar_widget.dart';
import 'package:ministerio_de_salud/pages/widgets/unit/input_date_option.dart';
import 'package:ministerio_de_salud/pages/widgets/unit/input_expanded.dart';
import 'package:ministerio_de_salud/pages/widgets/unit/input_hour_option.dart';
import 'package:ministerio_de_salud/pages/widgets/unit/input_list_option.dart';
import 'package:ministerio_de_salud/pages/widgets/unit/title_expansion.dart';

class PageEdans extends StatefulWidget {
  const PageEdans({Key? key}) : super(key: key);

  @override
  State<PageEdans> createState() => _PageEdansState();
}

class _PageEdansState extends State<PageEdans> {
  TextEditingController controllerEvento = TextEditingController();
  TextEditingController controllerFecha = TextEditingController();
  TextEditingController controllerHora = TextEditingController();
  TextEditingController controllerNombreDeContacto = TextEditingController();
  TextEditingController controllerCargoDeContacto = TextEditingController();
  TextEditingController controllerDireccionDeContacto = TextEditingController();
  TextEditingController controllerTelefonoFijo = TextEditingController();
  TextEditingController controllerTelefonoMovil = TextEditingController();
  TextEditingController controllerDepartamento = TextEditingController();
  TextEditingController controllerMunicipio = TextEditingController();
  TextEditingController controllerComunidad = TextEditingController();
  TextEditingController controllerParaLlegar = TextEditingController();
  TextEditingController controllerTiempoLlegada = TextEditingController();
  int number = 0;

  @override
  void initState() {
    controllerFecha.text =
        '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}';
    super.initState();
  }

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
              controller: controllerEvento,
              isRequired: true,
              options: const ['A', 'B', 'C'],
            ),
            InputDateOption(
              title: 'Fecha',
              controller: controllerFecha,
              isRequired: true,
            ),
            InputHourOption(
              title: 'Hora probable de inicio',
              controller: controllerHora,
              isRequired: true,
            ),
            InputExpanded(
              title: 'Nombre de contacto',
              controller: controllerNombreDeContacto,
              isRequired: true,
            ),
            InputExpanded(
              title: 'Cargo de contacto',
              controller: controllerCargoDeContacto,
              isRequired: true,
            ),
            InputExpanded(
                title: 'Dirección de contacto',
                controller: controllerDireccionDeContacto),
            InputExpanded(
                title: 'Telefono fijo de contacto',
                controller: controllerTelefonoFijo),
            InputExpanded(
                title: 'Telefono movil de contacto',
                controller: controllerTelefonoMovil),
            InputExpanded(
                title: 'Comunidad o zona', controller: controllerComunidad),
            InputExpanded(
              title: 'Para llegar al lugar se parte de (lugar):',
              controller: controllerParaLlegar,
              isRequired: true,
            ),
            InputExpanded(
                title: 'Tiempo de llegada al lugar (en horas)',
                controller: controllerTiempoLlegada),
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
          print(controllerFecha.text);
        },
      ),
    );
  }
}
