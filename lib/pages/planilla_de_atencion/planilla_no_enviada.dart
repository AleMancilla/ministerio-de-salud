import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ministerio_de_salud/bussiness/database/database.dart';
import 'package:ministerio_de_salud/bussiness/database/mysqlphp/mysql_data.dart';
import 'package:ministerio_de_salud/bussiness/models.dart/model_planilla_atencion.dart';
import 'package:ministerio_de_salud/bussiness/models.dart/modelo_planilla_detalle.dart';
import 'package:ministerio_de_salud/bussiness/providers/planillas_no_enviadas_provider.dart';
import 'package:ministerio_de_salud/pages/planilla_de_atencion/planilla_de_atencion.dart';
import 'package:ministerio_de_salud/pages/widgets/group/app_bar_widget.dart';
import 'package:ministerio_de_salud/pages/widgets/group/body_app_bar.dart';
import 'package:ministerio_de_salud/pages/widgets/group/group_planillas_no_enviados.dart';
import 'package:ministerio_de_salud/pages/widgets/unit/button_widget.dart';
import 'package:ministerio_de_salud/pages/widgets/unit/check_box_demo.dart';
import 'package:ministerio_de_salud/utils/navigator_route.dart';
import 'package:provider/provider.dart';

class PlanillaNoEnviada extends StatefulWidget {
  const PlanillaNoEnviada({Key? key}) : super(key: key);

  @override
  State<PlanillaNoEnviada> createState() => _PageNotSendState();
}

class _PageNotSendState extends State<PlanillaNoEnviada> {
  DataBaseEdans db = DataBaseEdans();
  List<ModelPlanillaDeAtencion> listModelPlanillaDeAtencion = [];

  ScrollController scrollControllerPlanillaNoEnviados = ScrollController();

  List<Widget> listPlanillasNoEnviadosWidget = [];

  late PlanillasNoEnviadasProvider planillasProvider;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      _internetConnectListener();
    });
    _cargandoDatos();
    planillasProvider =
        Provider.of<PlanillasNoEnviadasProvider>(context, listen: false);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    planillasProvider =
        Provider.of<PlanillasNoEnviadasProvider>(context, listen: true);
  }

  _cargandoDatos() async {
    Future.delayed(Duration.zero, () {
      planillasProvider.readDataBaseListPlanillas();
      planillasProvider.readDataBaseListtModelListaSintomas();
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
              const BodyAppBar(text: 'PLANILLA DE ATENCION'),
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
    print(planillasProvider);
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: double.infinity),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                planillasProvider.listPlanillasProvider.length > 0
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
                          ontap: () {
                            navigatorPush(context, PagePlanillaAtencion());
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
                            bool st = false;
                            planillasProvider.listPlanillasProvider
                                .forEach((ModelPlanillaDeAtencion planillas) {
                              if (planillas.controllerEnviar ?? false) {
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
                CoolAlert.show(
                    context: context,
                    type: CoolAlertType.loading,
                    text: 'Cargando..');
                bool cerrar = true;
                await db.initDB();
                for (var modelo in planillasProvider.listPlanillasProvider) {
                  if (modelo.controllerEnviar ?? false) {
                    int webPlanillaId = await getLastIdPlanilla();
                    print(' LAST ID ===========>>>> $webPlanillaId');

                    bool resp = await insertPlanilla(modelo)
                        .timeout(
                          Duration(seconds: 10),
                          onTimeout: () => false,
                        )
                        .onError((error, stackTrace) => false);

                    List<ModeloDetallePlanilla> _listOfDetallesDePlanilla =
                        await db.getAllDetallesDePlanilla(
                            int.parse(modelo.codPlanilla.toString()));
                    print(_listOfDetallesDePlanilla);

                    _listOfDetallesDePlanilla.forEach((element) async {
                      element.codPlanilla = webPlanillaId;

                      bool resp = await insertDetallePlanilla(element);
                    });

                    // #############################

                    print(' LA RESPUESTA ES $resp');
                    if (resp) {
                      modelo.enviado = 'SI';
                      modelo.controllerEnviar = false;

                      // db.updateEDAN(edan);
                      await db.initDB();
                      await db.updatePlanilla(modelo.codPlanilla.toString());
                      await db.closeDB();
                      print(' xxxxxxxxxS ${modelo.enviado}');
                      setState(() {});
                    } else {
                      cerrar = false;
                      Navigator.pop(context);
                      CoolAlert.show(
                          context: context,
                          type: CoolAlertType.error,
                          text: 'Hubo un error al cargar los datos');
                    }

                    // List<Desastreestablecimiento> listDesastreestablecimiento =
                    //     await db.getAllDaniosEstablecimientosDeSalud(
                    //         int.parse(edan.codEdan.toString()));
                    // print(listDesastreestablecimiento);
                    // listDesastreestablecimiento.forEach((element) async {
                    //   element.codEdan = webEdanId;

                    //   bool resp = await insertdesastreestablecimiento(element);
                    // });
                  }
                }
                print(' ---- salio -----');
                if (cerrar) {
                  Navigator.pop(context);

                  CoolAlert.show(
                    context: context,
                    type: CoolAlertType.success,
                    text: 'Los datos se cargaron correctamente',
                    // autoCloseDuration: Duration(seconds: 2),
                    onConfirmBtnTap: () {
                      setState(() {});
                      // Future.delayed(Duration(seconds: 1), () {
                      //   setState(() {});
                      // });
                      Navigator.of(context, rootNavigator: true).pop();
                    },
                  );
                }

                planillasProvider.setstate();
                // edanProvider.listEdansProvider.forEach((ModelEdan edan) async {
                //   print(edan.controllerEnviar);
                //   if (edan.controllerEnviar) {
                //     int webEdanId = await getLastIdEdan();
                //     print('======== $webEdanId');
                //     print(edan);
                //     bool resp = await insertEdan(edan);

                //     List<Desastreestablecimiento> listDesastreestablecimiento =
                //         await db.getAllDaniosEstablecimientosDeSalud(
                //             int.parse(edan.codEdan.toString()));
                //     print(listDesastreestablecimiento);
                //     listDesastreestablecimiento.forEach((element) async {
                //       element.codEdan = webEdanId;

                //       bool resp = await insertdesastreestablecimiento(element);
                //     });

                //     List<Danospersonaldesalud> listDanospersonaldesalud =
                //         await db.getAllDaniosPersonalDeSalud(
                //             int.parse(edan.codEdan.toString()));
                //     listDanospersonaldesalud.forEach((element) async {
                //       element.codEdan = webEdanId;

                //       bool resp = await insertDaniosPersonalDeSalud(element);
                //     });

                //     // acciones realizadas hasta el momento
                //     List<Desastreacciones> listDesastreacciones = await db
                //         .getAllAcciones(int.parse(edan.codEdan.toString()));
                //     listDesastreacciones.forEach((element) async {
                //       element.codEdan = webEdanId;

                //       bool resp = await insertDesastreacciones(element);
                //     });

                //     // acciones prioritarias para el control de la situacion
                //     List<Desastreacciones2> listDesastreacciones2 = await db
                //         .getAllAcciones2(int.parse(edan.codEdan.toString()));
                //     listDesastreacciones2.forEach((element) async {
                //       element.codEdan = webEdanId;

                //       bool resp = await insertDesastreacciones2(element);
                //     });

                //     List<Desastrerequerimientos> listDesastrerequerimientos =
                //         await db.getRequerimientoApoyo(
                //             int.parse(edan.codEdan.toString()));
                //     listDesastrerequerimientos.forEach((element) async {
                //       element.codEdan = webEdanId;

                //       bool resp = await insertDesastrerequerimientos(element);
                //     });

                //     // ######################################################
                //     // ######################################################
                //     // ######################################################

                //     print(' LA RESPUESTA ES $resp');
                //     if (resp) {
                //       edan.enviado = 'SI';
                //       edan.controllerEnviar = false;

                //       // db.updateEDAN(edan);
                //       await db.initDB();
                //       await db.updateEviadoEDAN(edan.codEdan.toString());
                //       await db.closeDB();
                //       print(' xxxxxxxxxS ${edan.enviado}');
                //       setState(() {});

                //       CoolAlert.show(
                //         context: context,
                //         type: CoolAlertType.success,
                //         text: 'Los datos se cargaron correctamente',
                //         // autoCloseDuration: Duration(seconds: 2),
                //         onConfirmBtnTap: () {
                //           setState(() {});
                //           print('DAMOS ASDASDASDAD');
                //           // Future.delayed(Duration(seconds: 1), () {
                //           //   setState(() {});
                //           // });
                //           Navigator.of(context, rootNavigator: true).pop();
                //         },
                //       );
                //     } else {
                //       CoolAlert.show(
                //           context: context,
                //           type: CoolAlertType.error,
                //           text: 'Hubo un error al cargar los datos');
                //     }
                //   }
                // });
                // edanProvider.setstate();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _groupDaniosEdansNotSend(Size size) {
    int i = 0;
    return Scrollbar(
      isAlwaysShown: true,
      showTrackOnHover: true,
      controller: scrollControllerPlanillaNoEnviados,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          width: size.width > 1200 ? size.width - 40 : 1200,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.lightBlue),
          ),
          child: GroupPlanillasNoEnviados(listWidgets: [
            ...planillasProvider.listPlanillasProvider
                .map((ModelPlanillaDeAtencion planillaModelo) {
              print(
                  '>>>>> == ${planillaModelo.enviado} == ${planillaModelo.evento} == ${planillaModelo.depto} == ${planillaModelo.municipio} == ${planillaModelo.comunidad} == ${planillaModelo.nomestablecimiento} == ${planillaModelo.fecha}');
              // if (true) {
              if (planillaModelo.enviado == 'null' ||
                  planillaModelo.enviado == 'NO') {
                i++;
                return Container(
                  color: _colorItem(i, planillaModelo.controllerEnviar!),
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
                              controller: planillaModelo.controllerEnviar!,
                              onchange: () {
                                planillaModelo.controllerEnviar =
                                    !planillaModelo.controllerEnviar!;
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
                            child: Text(planillaModelo.codPlanilla!.toString()),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.lightBlue.shade100),
                            ),
                            child: Text(planillaModelo.evento!),
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
                            child: Text(planillaModelo.depto!),
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
                            child: Text(planillaModelo.municipio!),
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
                            child: Text(planillaModelo.comunidad!),
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
                            child: Text(planillaModelo.nomestablecimiento!),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.lightBlue.shade100),
                            ),
                            child: Text(planillaModelo.fecha!),
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
                                    PagePlanillaAtencion(
                                      planillaDeAtencionFather: planillaModelo,
                                    ));
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
                            child: IconButton(
                              padding: const EdgeInsets.all(0),
                              icon: const Icon(Icons.close),
                              onPressed: () async {
                                print(planillaModelo);

                                DataBaseEdans db = DataBaseEdans();

                                await db.initDB();
                                await db.deletePLANILLA(planillaModelo);

                                PlanillasNoEnviadasProvider
                                    planillasNoEnviadasProvider =
                                    Provider.of<PlanillasNoEnviadasProvider>(
                                        context,
                                        listen: false);

                                planillasNoEnviadasProvider
                                    .readDataBaseListPlanillas();
                                Future.delayed(Duration(seconds: 1), () {
                                  db.closeDB();
                                });
                                setState(() {});
                                // navigatorPush(
                                //     context,
                                //     PagePlanillaAtencion(
                                //       planillaDeAtencionFather: planillaModelo,
                                //     ));
                              },
                            ),
                          ),
                        ),
                        // Expanded(
                        //   flex: 2,
                        //   child: Container(
                        //     padding: const EdgeInsets.all(5),
                        //     alignment: Alignment.centerLeft,
                        //     decoration: BoxDecoration(
                        //       border:
                        //           Border.all(color: Colors.lightBlue.shade100),
                        //     ),
                        //     child: ButtonWidget(
                        //         text: 'Detalles de la planilla', ontap: () {}),
                        //   ),
                        // ),
                        // Expanded(
                        //   flex: 2,
                        //   child: Container(
                        //     padding: const EdgeInsets.all(5),
                        //     alignment: Alignment.centerLeft,
                        //     decoration: BoxDecoration(
                        //       border:
                        //           Border.all(color: Colors.lightBlue.shade100),
                        //     ),
                        //     child:
                        //         ButtonWidget(text: 'Ver Informe', ontap: () {}),
                        //   ),
                        // ),
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
            'Planilla',
            'Evento',
            'Departamento',
            'Municipio',
            'Comunidad',
            'Establecimiento',
            'Fecha',
            'Editar',
            'Eliminar',
            'Ver Informe'
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
