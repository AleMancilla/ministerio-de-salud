import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ministerio_de_salud/bussiness/database/database.dart';
import 'package:ministerio_de_salud/bussiness/models.dart/model_edan.dart';
import 'package:ministerio_de_salud/bussiness/providers/edan_provider.dart';
import 'package:ministerio_de_salud/pages/list_edans/page_edans.dart';
import 'package:ministerio_de_salud/pages/widgets/group/app_bar_widget.dart';
import 'package:ministerio_de_salud/pages/widgets/group/body_app_bar.dart';
import 'package:ministerio_de_salud/pages/widgets/group/group_edans_no_enviados.dart';
import 'package:ministerio_de_salud/pages/widgets/unit/button_widget.dart';
import 'package:ministerio_de_salud/pages/widgets/unit/check_box_demo.dart';
import 'package:ministerio_de_salud/utils/navigator_route.dart';
import 'package:provider/provider.dart';

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

  late EdanProvider edanProvider;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      _internetConnectListener();
    });
    _cargandoDatos();
    edanProvider = Provider.of<EdanProvider>(context, listen: false);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    edanProvider = Provider.of<EdanProvider>(context, listen: true);
  }

  _cargandoDatos() async {
    Future.delayed(Duration.zero, () {
      edanProvider.readDataBaseListEdans();
      setState(() {});
    });
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
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              connectionInternet,
              const BodyAppBar(text: 'Lista EDANs NO enviados'),
              _boddy(size),
            ],
          ),
        ),
      ),
    );
  }

  Widget connectionInternet = Container();
  late StreamSubscription subscription;
  void _internetConnectListener() async {
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        connectionInternet = Container(
          width: double.infinity,
          child: const Text(
            'No tienes coneccion a internet',
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.red,
          padding: const EdgeInsets.all(20),
        );
        setState(() {});
      } else {
        connectionInternet = Container();
        setState(() {});
      }
    });
  }

  @override
  dispose() {
    super.dispose();

    subscription.cancel();
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
                Container(
                  color: Colors.grey[50],
                  child: _groupDaniosEdansNotSend(size),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ButtonWidget(
                        ontap: () {
                          navigatorPush(context, const PageEdans());
                        },
                        color: Colors.grey[200],
                        text: 'Registrar Nuevo',
                        textcolor: Colors.black,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      ButtonWidget(
                        ontap: () {
                          // navigatorPush(context, const PageEdans());
                          edanProvider.listEdansProvider
                              .forEach((ModelEdan edan) {
                            print(edan.controllerEnviar);
                          });
                        },
                        color: Colors.grey[200],
                        text: 'Enviar al PNCAD',
                        textcolor: Colors.red,
                      ),
                    ],
                  ),
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
            ...edanProvider.listEdansProvider.map((ModelEdan demo) {
              // print(demo.enviado);
              // if (demo.enviado == 'no') {
              if (demo.enviado == 'NO') {
                i++;
                return Container(
                  color: _colorItem(i, demo.controllerEnviar),
                  child: IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.lightBlue.shade100),
                            ),
                            child: CheckBoxDemo(
                              controller: demo.controllerEnviar!,
                              onchange: () {
                                demo.controllerEnviar = !demo.controllerEnviar!;
                                setState(() {});
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.all(5),
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
                            padding: const EdgeInsets.all(5),
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
                            padding: const EdgeInsets.all(5),
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
                            padding: const EdgeInsets.all(5),
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
                                // print(demo.nombre);
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
              } else {
                return Container();
              }
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

  Color? _colorItem(int i, bool? status) {
    if (status ?? false) {
      return Colors.grey;
    } else {
      if (i % 2 == 0) {
        return Colors.blue[50];
      } else {
        return Colors.white;
      }
    }
  }
}
