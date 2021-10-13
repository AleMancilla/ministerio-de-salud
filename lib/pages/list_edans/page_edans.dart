import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ministerio_de_salud/pages/widgets/group/app_bar_widget.dart';
import 'package:ministerio_de_salud/pages/widgets/unit/group_list_danios_establecimientos_de_salud.dart';
import 'package:ministerio_de_salud/pages/widgets/unit/group_list_danios_personal_de_salud.dart';
import 'package:ministerio_de_salud/pages/widgets/unit/input_date_option.dart';
import 'package:ministerio_de_salud/pages/widgets/unit/input_expanded.dart';
import 'package:ministerio_de_salud/pages/widgets/unit/input_expanded_widget.dart';
import 'package:ministerio_de_salud/pages/widgets/unit/input_hour_option.dart';
import 'package:ministerio_de_salud/pages/widgets/unit/input_list_boolean.dart';
import 'package:ministerio_de_salud/pages/widgets/unit/input_list_check.dart';
import 'package:ministerio_de_salud/pages/widgets/unit/input_list_option.dart';
import 'package:ministerio_de_salud/pages/widgets/unit/sublist_input_expanded.dart';
import 'package:ministerio_de_salud/pages/widgets/unit/sublist_input_list_boolean.dart';
import 'package:ministerio_de_salud/pages/widgets/unit/sublist_input_list_option.dart';
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
  TextEditingController controllerdemoboolean = TextEditingController();
  TextEditingController controllerdemoboolean2 = TextEditingController();
  int number = 0;

  List<Widget> listDaniosEstablecimientosDeSaludWidget = [];
  List<_DaniosEstablecimientosDeSalud> listDaniosEstablecimientosDeSalud = [];

  List<Widget> listDaniosPersonalDeSaludWidget = [];
  List<_DaniosAlPersonalDeSalud> listDaniosPersonalDeSalud = [];

  @override
  void initState() {
    controllerFecha.text =
        '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}';
    controllerHora.text = '${DateTime.now().hour}:${DateTime.now().minute}';
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
            InputListBoolean(
              title: 'Evento boolean',
              controller: controllerdemoboolean,
              isRequired: true,
              options: const ['A', 'B', 'C'],
            ),
            InputListSelectedCheck(
              title: 'Evento check',
              controller: controllerdemoboolean2,
              isRequired: true,
              options: const ['A', 'B', 'C'],
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
            // _groupSubtitlesTable(),
            ExpansionTile(
              title: const TitleExpansion(texto: '1.- DEMO 1'),
              children: [_groupDaniosEstablecimiendosDeSalud()],
            ),
            ExpansionTile(
              title: const TitleExpansion(texto: '1.- DEMO 2'),
              children: [_groupDaniosAlPersonalDeSalud()],
            )
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
        onTap: () async {
          listDaniosEstablecimientosDeSalud
              .add(_DaniosEstablecimientosDeSalud());
          await _actualizarListaEstableciemientosDeSalud();
        },
      ),
    );
  }

  Container _groupDaniosEstablecimiendosDeSalud() {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.lightBlue),
      ),
      child: GroupDaniosEstablecimientosDeSalud(listWidgets: [
        ...listDaniosEstablecimientosDeSaludWidget,
        Material(
          color: Colors.grey.shade100,
          child: InkWell(
            onTap: () async {
              print(controllerFecha.text);
              listDaniosEstablecimientosDeSalud
                  .add(_DaniosEstablecimientosDeSalud());
              await _actualizarListaEstableciemientosDeSalud();
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueGrey.shade200),
                borderRadius: BorderRadius.circular(5),
              ),
              padding: const EdgeInsets.all(10),
              child: const Icon(Icons.add),
            ),
          ),
        ),
      ], titles: const [
        'Estab. de Salud',
        'Funciona',
        'Tiene agua'
      ]),
    );
  }

  Future<void> _actualizarListaEstableciemientosDeSalud() async {
    listDaniosEstablecimientosDeSaludWidget = [];
    int i = 0;
    Future.delayed(Duration.zero, () {
      listDaniosEstablecimientosDeSaludWidget =
          listDaniosEstablecimientosDeSalud.map((demo) {
        i++;
        return Container(
          color: i % 2 == 0 ? Colors.blue[50] : Colors.white,
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.lightBlue.shade100),
                    ),
                    child: Center(
                      child: SubListInputListOption(
                        controller: demo.controllerSalud,
                        options: const [],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.lightBlue.shade100),
                    ),
                    child: SubListInputListBoolean(
                      controller: demo.controllerFunciona,
                      options: const ['Si', 'Parcial', 'No'],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.lightBlue.shade100),
                    ),
                    child: SubListInputListBoolean(
                      controller: demo.controllerAgua,
                      options: const ['Si', 'No'],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.lightBlue.shade100),
                    ),
                    child: IconButton(
                      onPressed: () {
                        listDaniosEstablecimientosDeSalud.remove(demo);
                        _actualizarListaEstableciemientosDeSalud();
                        setState(() {});
                      },
                      icon: const Icon(Icons.remove_circle_outlined),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }).toList();
      setState(() {});
    });
  }

  /////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////

  Container _groupDaniosAlPersonalDeSalud() {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.lightBlue),
      ),
      child: GroupDaniosPersonalDeSalud(listWidgets: [
        ...listDaniosPersonalDeSaludWidget,
        Material(
          color: Colors.grey.shade100,
          child: InkWell(
            onTap: () async {
              print(controllerFecha.text);
              listDaniosPersonalDeSalud.add(_DaniosAlPersonalDeSalud());
              await _actualizarListaAlPersonalDeSalud();
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueGrey.shade200),
                borderRadius: BorderRadius.circular(5),
              ),
              padding: const EdgeInsets.all(10),
              child: const Icon(Icons.add),
            ),
          ),
        ),
      ], titles: const [
        'Pers. de Salud',
        'Fallec.',
        'Heri.',
        'Disp.',
        'Desap.',
      ]),
    );
  }

  Future<void> _actualizarListaAlPersonalDeSalud() async {
    listDaniosPersonalDeSaludWidget = [];
    int i = 0;
    Future.delayed(Duration.zero, () {
      listDaniosPersonalDeSaludWidget = listDaniosPersonalDeSalud.map((demo) {
        i++;
        return Container(
          color: i % 2 == 0 ? Colors.blue[50] : Colors.white,
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.lightBlue.shade100),
                    ),
                    child: Center(
                      child: SubListInputListOption(
                        controller: demo.controllerPersonalSalud,
                        options: const [
                          'Enfermeras',
                          'Medicos',
                          'Medicos tradicionales',
                          'Otros professionales en salud',
                          'tecnicos'
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.lightBlue.shade100),
                    ),
                    child: SublistInputExpanded(
                      controller: demo.controllerFaleecidos,
                      isNumber: true,
                      hint: '0',
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.lightBlue.shade100),
                    ),
                    child: SublistInputExpanded(
                      controller: demo.controllerHeridos,
                      isNumber: true,
                      hint: '0',
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.lightBlue.shade100),
                    ),
                    child: SublistInputExpanded(
                      controller: demo.controllerDisp,
                      isNumber: true,
                      hint: '0',
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.lightBlue.shade100),
                    ),
                    child: SublistInputExpanded(
                      controller: demo.controllerDesaparecidos,
                      isNumber: true,
                      hint: '0',
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.lightBlue.shade100),
                    ),
                    child: IconButton(
                      onPressed: () {
                        listDaniosPersonalDeSalud.remove(demo);
                        _actualizarListaAlPersonalDeSalud();
                        setState(() {});
                      },
                      icon: const Icon(Icons.remove_circle_outlined),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }).toList();
      setState(() {});
    });
  }
}

class _DaniosEstablecimientosDeSalud {
  TextEditingController controllerSalud = TextEditingController();
  TextEditingController controllerFunciona = TextEditingController();
  TextEditingController controllerAgua = TextEditingController();

  _DaniosEstablecimientosDeSalud();
}

class _DaniosAlPersonalDeSalud {
  TextEditingController controllerPersonalSalud = TextEditingController();
  TextEditingController controllerFaleecidos = TextEditingController();
  TextEditingController controllerHeridos = TextEditingController();
  TextEditingController controllerDisp = TextEditingController();
  TextEditingController controllerDesaparecidos = TextEditingController();

  _DaniosAlPersonalDeSalud();
}
