import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ministerio_de_salud/bussiness/database/database.dart';
import 'package:ministerio_de_salud/bussiness/database/mysqlphp/mysql_data.dart';
import 'package:ministerio_de_salud/bussiness/models.dart/model_edan.dart';
import 'package:ministerio_de_salud/bussiness/providers/edan_provider.dart';
import 'package:ministerio_de_salud/pages/list_edans/page_edans.dart';
import 'package:ministerio_de_salud/pages/widgets/group/app_bar_widget.dart';
import 'package:ministerio_de_salud/pages/widgets/group/body_app_bar.dart';
import 'package:ministerio_de_salud/pages/widgets/group/group_edans_no_enviados.dart';
import 'package:ministerio_de_salud/pages/widgets/unit/button_widget.dart';
import 'package:ministerio_de_salud/pages/widgets/unit/check_box_demo.dart';
import 'package:ministerio_de_salud/pages/widgets/unit/input_text_field.dart';
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

  TextEditingController controllerid = TextEditingController();
  TextEditingController controllertext = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () async {
        //     insertMethod(controllerid.text, controllertext.text);
        //   },
        // ),
        appBar: PreferredSize(
          child: AppBarWidget(
            size: size,
          ),
          preferredSize: const Size(double.infinity, 50),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              connectionInternet,
              const BodyAppBar(text: 'Lista EDANs NO enviados'),
              _boddy(size),
              // InputTextFielfWidget(controller: controllerid),
              // InputTextFielfWidget(controller: controllertext),
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
                        ontap: () async {
                          // navigatorPush(context, const PageEdans());
                          bool st = false;
                          edanProvider.listEdansProvider
                              .forEach((ModelEdan edan) {
                            if (edan.controllerEnviar) {
                              st = true;
                            }
                          });
                          if (st) {
                            confirmDialog();
                          } else {
                            CoolAlert.show(
                                context: context,
                                type: CoolAlertType.error,
                                text: 'No selecionaste ningun edan a enviar');
                          }
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

  confirmDialog() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Estas apunto de enviar los datos al servidor'),
          actions: [
            CupertinoButton(
              child: Text(
                'Cancelar',
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            CupertinoButton(
              child: Text(
                'Confirmar',
                style: TextStyle(color: Colors.blue),
              ),
              onPressed: () async {
                edanProvider.listEdansProvider.forEach((ModelEdan edan) async {
                  print(edan.controllerEnviar);
                  if (edan.controllerEnviar) {
                    bool resp = await insertEdan(edan);
                    print(' LA RESPUESTA ES $resp');
                    Navigator.pop(context);
                    if (resp) {
                      edan.enviado = 'SI';
                      db.updateEDAN(edan);
                      CoolAlert.show(
                        context: context,
                        type: CoolAlertType.success,
                        text: 'Los datos se cargaron correctamente',
                        // autoCloseDuration: Duration(seconds: 2),
                        onConfirmBtnTap: () {
                          setState(() {});
                          print('DAMOS ASDASDASDAD');
                          // Future.delayed(Duration(seconds: 1), () {
                          //   setState(() {});
                          // });
                          Navigator.of(context, rootNavigator: true).pop();
                        },
                      );
                    } else {
                      CoolAlert.show(
                          context: context,
                          type: CoolAlertType.error,
                          text: 'Hubo un error al cargar los datos');
                    }
                  }
                });
                edanProvider.setstate();
              },
            ),
          ],
        );
      },
    );
  }

  // ScrollController controllerScroll = ScrollController();

  Widget _groupDaniosEdansNotSend(Size size) {
    int i = 0;
    return Scrollbar(
      isAlwaysShown: true,
      showTrackOnHover: true,
      controller: scrollControllerEdansNoEnviados,
      child: SingleChildScrollView(
        // controller: controllerScroll,
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
                print(' --- ${demo.controllerEnviar} -- ${demo.enviado}');
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
                              controller: demo.controllerEnviar,
                              // controller: false,
                              onchange: () {
                                demo.controllerEnviar = !demo.controllerEnviar;
                                setState(() {});
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
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
            'cod edan',
            'Evento',
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
