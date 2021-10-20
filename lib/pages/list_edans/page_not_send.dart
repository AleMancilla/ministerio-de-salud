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
  @override
  void initState() {
    super.initState();
    _cargandoDatos();
  }

  _cargandoDatos() async {
    print('INICIO DATABASE');
    await db.initDB();
    print('INICIO DATABASE');
    listModelEdans = await db.getAllEdans();
    print('INICIO DATABASE');

    listEdansNoEnviados = listModelEdans.map(
      (ModelEdan edan) {
        print(
            '### ${edan.codEdan} # ${edan.evento} # ${edan.nombre} # ${edan.fecha} ###');
        return _EdansNoEnviados.fromData(
          nro: edan.codEdan.toString(),
          evento: edan.evento!,
          nombreEvento: '',
          // nombreEvento: edan.nombre!,
          fecha: edan.fecha!,
        );
      },
    ).toList();

    await _listaEdansNoEnviados();
    setState(() {});
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
      child: Container(
        // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
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
                  // CupertinoButton(
                  //   onPressed: () {
                  //     navigatorPush(context, const PagePlanillaAtencion());
                  //   },
                  //   color: Colors.grey[200],
                  //   child: const Text(
                  //     'Planilla Atencion',
                  //     style: TextStyle(color: Colors.black),
                  //   ),
                  // ),
                  Container(
                    color: Colors.grey[50],
                    child: FutureBuilder(
                      future: db.initDB(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return _showList(context);
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _showList(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return _groupDaniosEdansNotSend(size);
  }

  ScrollController scrollControllerEdansNoEnviados = ScrollController();

  List<Widget> listEdansNoEnviadosWidget = [];
  List<_EdansNoEnviados> listEdansNoEnviados = [];
  // Widget _groupDaniosEdansNotSend(Size size) {
  //   return Scrollbar(
  //     isAlwaysShown: true,
  //     showTrackOnHover: true,
  //     // controller: scrollControllerEdansNoEnviados,
  //     child: SingleChildScrollView(
  //       scrollDirection: Axis.horizontal,
  //       child: Container(
  //         width: size.width > 600 ? size.width - 20 : 600,
  //         // margin: const EdgeInsets.all(10),
  //         decoration: BoxDecoration(
  //           border: Border.all(color: Colors.lightBlue),
  //         ),
  //         child: GroupEdansNoEnviados(listWidgets: [
  //           FutureBuilder(
  //             future: _listaEdansNoEnviados(),
  //             builder: (context, AsyncSnapshot<List<Widget>> snapshot2) {
  //               if (snapshot2.hasData) {
  //                 return Container(
  //                   child: Column(
  //                     children: snapshot2.data!,
  //                   ),
  //                 );
  //               } else {
  //                 return Text('NO DATA');
  //               }
  //             },
  //           ),
  //         ], titles: const [
  //           'Enviar',
  //           'No.',
  //           'Evento',
  //           'Nombre Evento Biologico',
  //           'fecha'
  //         ]),
  //       ),
  //     ),
  //   );
  // }

  Future<void> _listaEdansNoEnviados() async {
    listEdansNoEnviadosWidget = [];
    int i = 0;
    listEdansNoEnviadosWidget =
        listEdansNoEnviados.map((_EdansNoEnviados demo) {
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
                    border: Border.all(color: Colors.lightBlue.shade100),
                  ),
                  child: Checkbox(
                    value: demo.controllerEnviar,
                    onChanged: (value) {
                      setState(() {
                        demo.controllerEnviar = value!;
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.lightBlue.shade100),
                  ),
                  child: Text(demo.controllerNro.text),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.lightBlue.shade100),
                  ),
                  child: Text(demo.controllerEvento.text),
                ),
              ),
              Expanded(
                flex: 6,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.lightBlue.shade100),
                  ),
                  child: Text(demo.controllerNombreEventoBiologico.text),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.lightBlue.shade100),
                  ),
                  child: Text(demo.controllerFecha.text),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.lightBlue.shade100),
                  ),
                  child: IconButton(
                    padding: const EdgeInsets.all(0),
                    icon: const Icon(Icons.edit),
                    onPressed: () {},
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }).toList();
  }

  Widget _groupDaniosEdansNotSend(Size size) {
    return Scrollbar(
      // isAlwaysShown: true,
      // showTrackOnHover: true,
      // controller: scrollControllerEdansNoEnviados,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          width: size.width > 600 ? size.width - 40 : 600,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.lightBlue),
          ),
          child: GroupEdansNoEnviados(listWidgets: [
            ...listEdansNoEnviadosWidget,
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

  // _EdansNoEnviados();
  _EdansNoEnviados.fromData({
    required String nro,
    required String evento,
    required String nombreEvento,
    required String fecha,
  }) {
    controllerNro.text = nro;
    controllerEvento.text = evento;
    controllerNombreEventoBiologico.text = nombreEvento;
    controllerFecha.text = fecha;
  }
}
