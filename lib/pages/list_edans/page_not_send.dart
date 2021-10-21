import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ministerio_de_salud/bussiness/database/database.dart';
import 'package:ministerio_de_salud/bussiness/models.dart/model_edan.dart';
import 'package:ministerio_de_salud/pages/list_edans/page_edans.dart';
import 'package:ministerio_de_salud/pages/widgets/group/app_bar_widget.dart';
import 'package:ministerio_de_salud/pages/widgets/group/body_app_bar.dart';
import 'package:ministerio_de_salud/pages/widgets/unit/group_edans_no_enviados.dart';
import 'package:ministerio_de_salud/utils/navigator_route.dart';

class PageNotSend extends StatefulWidget {
  const PageNotSend({Key? key}) : super(key: key);

  @override
  State<PageNotSend> createState() => _PageNotSendState();
}

class _PageNotSendState extends State<PageNotSend> {
  DataBaseEdans db = DataBaseEdans();
  List<ModelEdan> listModelEdans = [];

  ScrollController scrollControllerEdansNoEnviados = ScrollController();

  List<Widget> listEdansNoEnviadosWidget = [];
  List<_EdansNoEnviados> listEdansNoEnviados = [];
  @override
  void initState() {
    super.initState();
    _cargandoDatos();
  }

  _cargandoDatos() async {
    await db.initDB();
    listModelEdans = await db.getAllEdans();
    Future.delayed(Duration.zero, () {
      // listEdansNoEnviados = listModelEdans.map(
      //   (ModelEdan edan) {
      //     _EdansNoEnviados edanX = _EdansNoEnviados.fromData(
      //       nro: edan.codEdan.toString(),
      //       evento: edan.evento!,
      //       nombreEvento: '',
      //       fecha: edan.fecha!,
      //       modelEdan: edan,
      //     );
      //     print(' === ${edan.nombre} === ${edan.fecha}');
      //     return edanX;
      //   },
      // ).toList();

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        child: AppBarWidget(size: size),
        preferredSize: const Size(double.infinity, 50),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const BodyAppBar(text: 'Lista EDANs NO enviados'),
            _boddy(size),
          ],
        ),
      ),
    );
  }

  Widget _boddy(Size size) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: double.infinity),
            Column(
              children: [
                CupertinoButton(
                  onPressed: () {
                    navigatorPush(context, const PageEdans());
                  },
                  color: Colors.grey[200],
                  child: const Text(
                    'Registrar Nuevo',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                CupertinoButton(
                  onPressed: () {
                    db.getAllTables();
                  },
                  color: Colors.grey[200],
                  child: const Text(
                    'leer datos',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Container(
                  color: Colors.grey[50],
                  child: _groupDaniosEdansNotSend(size),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _groupDaniosEdansNotSend(Size size) {
    int i = 0;
    return Scrollbar(
      isAlwaysShown: true,
      showTrackOnHover: true,
      controller: scrollControllerEdansNoEnviados,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          width: size.width > 600 ? size.width - 40 : 600,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.lightBlue),
          ),
          child: GroupEdansNoEnviados(listWidgets: [
            ...listModelEdans.map((ModelEdan demo) {
              i++;
              return Container(
                color: i % 2 == 0 ? Colors.blue[50] : Colors.white,
                child: IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.lightBlue.shade100),
                          ),
                          child: CheckBoxDemo(
                            controller: demo.controllerEnviar!,
                            onchange: () {
                              demo.controllerEnviar = !demo.controllerEnviar!;
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.lightBlue.shade100),
                          ),
                          child: Text(demo.codEdan!.toString()),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.lightBlue.shade100),
                          ),
                          child: Text(demo.evento!),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.lightBlue.shade100),
                          ),
                          child: Text(''),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.lightBlue.shade100),
                          ),
                          child: Text(demo.fecha!),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.lightBlue.shade100),
                          ),
                          child: IconButton(
                            padding: const EdgeInsets.all(0),
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              print(demo.nombre);
                              navigatorPush(
                                  context,
                                  PageEdans(
                                    edanModel: demo,
                                  ));
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }).toList(),
          ], titles: const [
            'Enviar',
            'No.',
            'Evento',
            'Nombre Evento Biologico',
            'fecha'
          ]),
        ),
      ),
    );
  }
}

class _EdansNoEnviados {
  bool controllerEnviar = false;
  TextEditingController controllerNro = TextEditingController();
  TextEditingController controllerEvento = TextEditingController();
  TextEditingController controllerNombreEventoBiologico =
      TextEditingController();
  TextEditingController controllerFecha = TextEditingController();
  ModelEdan? modelEdan;

  // _EdansNoEnviados();
  _EdansNoEnviados.fromData({
    required String nro,
    required String evento,
    required String nombreEvento,
    required String fecha,
    required ModelEdan modelEdan,
  }) {
    controllerNro.text = nro;
    controllerEvento.text = evento;
    controllerNombreEventoBiologico.text = nombreEvento;
    controllerFecha.text = fecha;
    modelEdan = modelEdan;
  }

  void fromData(
      {required String nro,
      required String evento,
      required String nombreEvento,
      required String fecha,
      required ModelEdan modelEdan}) {}
}

// ignore: must_be_immutable
class CheckBoxDemo extends StatefulWidget {
  CheckBoxDemo({Key? key, required this.controller, required this.onchange})
      : super(key: key);
  bool controller;
  Function onchange;

  @override
  _CheckBoxDemoState createState() => _CheckBoxDemoState();
}

class _CheckBoxDemoState extends State<CheckBoxDemo> {
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: widget.controller,
      onChanged: (value) {
        widget.onchange();
        setState(() {
          widget.controller = value!;
        });
      },
    );
  }
}
