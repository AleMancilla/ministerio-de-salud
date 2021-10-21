import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:ministerio_de_salud/bussiness/database/database.dart';
import 'package:ministerio_de_salud/bussiness/models.dart/model_edan.dart';
import 'package:ministerio_de_salud/bussiness/providers/edan_provider.dart';
import 'package:ministerio_de_salud/pages/list_edans/page_edans.dart';
import 'package:ministerio_de_salud/pages/widgets/group/app_bar_widget.dart';
import 'package:ministerio_de_salud/pages/widgets/group/body_app_bar.dart';
import 'package:ministerio_de_salud/pages/widgets/unit/button_widget.dart';
import 'package:ministerio_de_salud/pages/widgets/unit/group_edans_no_enviados.dart';
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
      edanProvider.readDataBase();
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

  // void _internetConnect() async {
  //   bool result = await InternetConnectionChecker().hasConnection;
  //   if (result == true) {
  //     print('YAY! Free cute dog pics!');
  //   } else {
  //     print('No internet :( Reason:');
  //     print(InternetConnectionChecker());
  //   }
  // }
  Widget connectionInternet = Container();
  void _internetConnectListener() async {
    final bool isConnected = await InternetConnectionChecker().hasConnection;

    // actively listen for status updates
    final StreamSubscription<InternetConnectionStatus> listener =
        InternetConnectionChecker().onStatusChange.listen(
      (InternetConnectionStatus status) {
        switch (status) {
          case InternetConnectionStatus.connected:
            // ignore: avoid_print
            print('Data connection is available.');
            connectionInternet = Container();
            setState(() {});
            break;
          case InternetConnectionStatus.disconnected:
            // ignore: avoid_print
            print('You are disconnected from the internet.');
            connectionInternet = Container(
              width: double.infinity,
              child: Text(
                'No tienes coneccion a internet',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.red,
              padding: EdgeInsets.all(20),
            );
            setState(() {});
            break;
        }
      },
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
                        color: Colors.blue,
                        text: 'Enviar',
                        textcolor: Colors.white,
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
