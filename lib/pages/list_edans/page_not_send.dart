import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ministerio_de_salud/bussiness/database/database.dart';
import 'package:ministerio_de_salud/bussiness/database/mysqlphp/mysql_data.dart';
import 'package:ministerio_de_salud/bussiness/models.dart/model_danos_personal_de_salud.dart';
import 'package:ministerio_de_salud/bussiness/models.dart/model_desastre_acciones.dart';
import 'package:ministerio_de_salud/bussiness/models.dart/model_desastre_acciones2.dart';
import 'package:ministerio_de_salud/bussiness/models.dart/model_desastre_establecimiento.dart';
import 'package:ministerio_de_salud/bussiness/models.dart/model_desastre_requerimientos.dart';
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
    edanProvider = Provider.of<EdanProvider>(context, listen: false);
    super.initState();
    Future.delayed(Duration.zero, () {
      _internetConnectListener();
    });
    _cargandoDatos();
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
        drawer: Container(),
        appBar: PreferredSize(
          child: AppBarWidget(
            size: size,
            ontap: () {
              showDialog(
                context: context,
                builder: (context) => Container(),
              );
              // InkWellDrawer();
            },
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
            'No tienes conexión a internet',
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                edanProvider.listEdansProvider.length > 0
                    ? Container(
                        color: Colors.grey[50],
                        child: _groupDaniosEdansNotSend(size),
                      )
                    : Container(
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(2),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        margin: EdgeInsets.only(top: 15),
                        child: Text(
                          'No se encontraron registros',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ButtonWidget(
                          paddingHorizontal: 10,
                          ontap: () {
                            navigatorPush(context, const PageEdans());
                          },
                          color: Colors.grey[200],
                          text: 'Registrar Nuevo',
                          textcolor: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        if (edanProvider.listEdansProvider.length > 0)
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
                                    text:
                                        'No selecionaste ningun edan a enviar');
                              }
                            },
                            color: Colors.grey[200],
                            text: 'Enviar a la UGRED',
                            textcolor: Colors.red,
                          ),
                      ],
                    ),
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
      builder: (ctx) {
        return AlertDialog(
          title: Text('Estas apunto de enviar los datos al servidor'),
          actions: [
            CupertinoButton(
              child: Text(
                'Cancelar',
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                Navigator.pop(ctx);
              },
            ),
            CupertinoButton(
              child: Text(
                'Confirmar',
                style: TextStyle(color: Colors.blue),
              ),
              onPressed: () async {
                Navigator.pop(ctx);
                await db.initDB();

                edanProvider.listEdansProvider.forEach((ModelEdan edan) async {
                  print(edan.controllerEnviar);
                  if (edan.controllerEnviar) {
                    int webEdanId = await getLastIdEdan();
                    print('======== $webEdanId');
                    print(edan);
                    bool resp = await insertEdan(edan);

                    List<Desastreestablecimiento> listDesastreestablecimiento =
                        await db.getAllDaniosEstablecimientosDeSalud(
                            int.parse(edan.codEdan.toString()));
                    print(listDesastreestablecimiento);
                    listDesastreestablecimiento.forEach((element) async {
                      element.codEdan = webEdanId;

                      bool resp = await insertdesastreestablecimiento(element);
                    });

                    List<Danospersonaldesalud> listDanospersonaldesalud =
                        await db.getAllDaniosPersonalDeSalud(
                            int.parse(edan.codEdan.toString()));
                    listDanospersonaldesalud.forEach((element) async {
                      element.codEdan = webEdanId;

                      bool resp = await insertDaniosPersonalDeSalud(element);
                    });

                    // acciones realizadas hasta el momento
                    List<Desastreacciones> listDesastreacciones = await db
                        .getAllAcciones(int.parse(edan.codEdan.toString()));
                    listDesastreacciones.forEach((element) async {
                      element.codEdan = webEdanId;

                      bool resp = await insertDesastreacciones(element);
                    });

                    // acciones prioritarias para el control de la situacion
                    List<Desastreacciones2> listDesastreacciones2 = await db
                        .getAllAcciones2(int.parse(edan.codEdan.toString()));
                    listDesastreacciones2.forEach((element) async {
                      element.codEdan = webEdanId;

                      bool resp = await insertDesastreacciones2(element);
                    });

                    List<Desastrerequerimientos> listDesastrerequerimientos =
                        await db.getRequerimientoApoyo(
                            int.parse(edan.codEdan.toString()));
                    listDesastrerequerimientos.forEach((element) async {
                      element.codEdan = webEdanId;

                      bool resp = await insertDesastrerequerimientos(element);
                    });

                    // ######################################################
                    // ######################################################
                    // ######################################################

                    print(' LA RESPUESTA ES $resp');
                    if (resp) {
                      edan.enviado = 'SI';
                      edan.controllerEnviar = false;

                      // db.updateEDAN(edan);
                      await db.initDB();
                      await db.updateEviadoEDAN(edan.codEdan.toString());
                      await db.closeDB();
                      print(' xxxxxxxxxS ${edan.enviado}');
                      setState(() {});

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
    print(edanProvider);
    int i = 0;
    return Scrollbar(
      // isAlwaysShown: true,
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
              print('** ${demo.enviado}');
              // if (demo.enviado == 'no') {
              if (demo.enviado == 'NO') {
                i++;
                // print(' --- ${demo.controllerEnviar} -- ${demo.enviado}');
                return Container(
                  color: _colorItem(i, demo.controllerEnviar),
                  child: IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          flex: 2,
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
                          flex: 3,
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
                          flex: 4,
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
                          flex: 4,
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

class CustomListTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function onTap;

  CustomListTile(this.icon, this.text, this.onTap);
  @override
  Widget build(BuildContext context) {
    //ToDO
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey.shade400))),
        child: InkWell(
            splashColor: Colors.orangeAccent,
            onTap: () => onTap,
            child: Container(
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(icon),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                        ),
                        Text(
                          text,
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    Icon(Icons.arrow_right)
                  ],
                ))),
      ),
    );
  }
}
