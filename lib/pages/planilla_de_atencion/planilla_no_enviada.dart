import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ministerio_de_salud/bussiness/database/database.dart';
import 'package:ministerio_de_salud/bussiness/models.dart/model_planilla_atencion.dart';
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
                            navigatorPush(
                                context, const PagePlanillaAtencion());
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
                            planillasProvider.listPlanillasProvider
                                .forEach((ModelPlanillaDeAtencion planillas) {
                              print(planillas.controllerEnviar);
                            });
                          },
                          color: Colors.grey[200],
                          text: 'Enviar al PNCAD',
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
                .map((ModelPlanillaDeAtencion demo) {
              print(
                  '>>>>> == ${demo.enviado} == ${demo.evento} == ${demo.depto} == ${demo.municipio} == ${demo.comunidad} == ${demo.nomestablecimiento} == ${demo.fecha}');
              // if (demo.enviado == 'no') {
              if (demo.enviado == 'SI' || demo.enviado == 'null') {
                i++;
                return Container(
                  color: _colorItem(i, demo.controllerEnviar!),
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
                            child: Text(demo.codPlanilla!.toString()),
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
                            child: Text(demo.depto!),
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
                            child: Text(demo.municipio!),
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
                            child: Text(demo.comunidad!),
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
                            child: Text(demo.nomestablecimiento!),
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
                                // navigatorPush(
                                //     context,
                                //     PageEdans(
                                //       edanModel: demo,
                                //     ));
                              },
                            ),
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
                            child: ButtonWidget(
                                text: 'Detalles de la planilla', ontap: () {}),
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
                            child:
                                ButtonWidget(text: 'Ver Informe', ontap: () {}),
                          ),
                        ),
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
            ' ',
            'Detalle de planilla',
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
