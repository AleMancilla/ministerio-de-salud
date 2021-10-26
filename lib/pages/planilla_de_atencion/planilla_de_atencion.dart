import 'package:easy_dialog/easy_dialog.dart';
import 'package:flutter/material.dart';
import 'package:ministerio_de_salud/bussiness/database/database.dart';
import 'package:ministerio_de_salud/bussiness/models.dart/model_planilla_atencion.dart';
import 'package:ministerio_de_salud/bussiness/providers/planillas_no_enviadas_provider.dart';
import 'package:ministerio_de_salud/pages/widgets/group/app_bar_widget.dart';
import 'package:ministerio_de_salud/pages/widgets/group/body_app_bar.dart';
import 'package:ministerio_de_salud/pages/widgets/unit/button_widget.dart';
import 'package:ministerio_de_salud/pages/widgets/unit/input_date_option.dart';
import 'package:ministerio_de_salud/pages/widgets/unit/input_expanded.dart';
import 'package:ministerio_de_salud/pages/widgets/unit/input_hour_option.dart';
import 'package:ministerio_de_salud/pages/widgets/unit/input_list_option.dart';
import 'package:ministerio_de_salud/utils/user_preferens.dart';
import 'package:provider/provider.dart';

class PagePlanillaAtencion extends StatefulWidget {
  const PagePlanillaAtencion({Key? key}) : super(key: key);

  @override
  State<PagePlanillaAtencion> createState() => _PagePlanillaAtencionState();
}

class _PagePlanillaAtencionState extends State<PagePlanillaAtencion> {
  ///[SECCION DATOS GENERALES]
  TextEditingController controllerEvento = TextEditingController();
  TextEditingController controllerDepartamento = TextEditingController();
  TextEditingController controllerMunicipio = TextEditingController();
  TextEditingController controllerComunidad = TextEditingController();
  TextEditingController controllerEstablecimiento = TextEditingController();
  TextEditingController controllerGerenciaDeRed = TextEditingController();
  TextEditingController controllerPoblacion = TextEditingController();
  TextEditingController controllerFecha = TextEditingController();
  TextEditingController controllerHora = TextEditingController();
  TextEditingController controllerNombreResponsable = TextEditingController();
  TextEditingController controllerCargoResponsable = TextEditingController();
  TextEditingController controllerTelfResponsable = TextEditingController();

  int number = 0;
  DataBaseEdans db = DataBaseEdans();
  UserPreferences prefs = UserPreferences();
  late PlanillasNoEnviadasProvider planillasNoEnviadasProvider;

  @override
  void initState() {
    controllerFecha.text =
        '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}';
    controllerHora.text = '${DateTime.now().hour}:${DateTime.now().minute}';
    planillasNoEnviadasProvider =
        Provider.of<PlanillasNoEnviadasProvider>(context, listen: false);
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
                  child: BodyAppBar(text: 'PLANILLA DE ATENCION'),
                ),
                _datosGenerales(size),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      ButtonWidget(
                        text: 'Guardar',
                        ontap: () {
                          if (controllerEvento.text ==
                              '- Seleccione una opción -') {
                            _showDialogMessage(
                                titulo: 'Campo obligatorio no llenado',
                                descripcion: 'Debes llenar: "Evento"');
                            return;
                          }
                          if (controllerDepartamento.text.isEmpty) {
                            _showDialogMessage(
                                titulo: 'Campo obligatorio no llenado',
                                descripcion: 'Debes llenar: "Departamento"');
                            return;
                          }
                          if (controllerMunicipio.text.isEmpty) {
                            _showDialogMessage(
                                titulo: 'Campo obligatorio no llenado',
                                descripcion: 'Debes llenar: "Municipio"');
                            return;
                          }
                          if (controllerComunidad.text.isEmpty) {
                            _showDialogMessage(
                                titulo: 'Campo obligatorio no llenado',
                                descripcion: 'Debes llenar: "Comunidad"');
                            return;
                          }
                          if (controllerEstablecimiento.text.isEmpty) {
                            _showDialogMessage(
                                titulo: 'Campo obligatorio no llenado',
                                descripcion: 'Debes llenar: "Establecimiento"');
                            return;
                          }
                          if (controllerFecha.text.isEmpty) {
                            _showDialogMessage(
                                titulo: 'Campo obligatorio no llenado',
                                descripcion: 'Debes llenar: "Fecha"');
                            return;
                          }
                          if (controllerHora.text.isEmpty) {
                            _showDialogMessage(
                                titulo: 'Campo obligatorio no llenado',
                                descripcion: 'Debes llenar: "Hora"');
                            return;
                          }

                          if (controllerNombreResponsable.text.isEmpty) {
                            _showDialogMessage(
                                titulo: 'Campo obligatorio no llenado',
                                descripcion:
                                    'Debes llenar: "Nombre de responsable"');
                            return;
                          }
                          if (controllerCargoResponsable.text.isEmpty) {
                            _showDialogMessage(
                                titulo: 'Campo obligatorio no llenado',
                                descripcion:
                                    'Debes llenar: "Cargo de responsable"');
                            return;
                          }
                          if (controllerTelfResponsable.text.isEmpty) {
                            _showDialogMessage(
                                titulo: 'Campo obligatorio no llenado',
                                descripcion:
                                    'Debes llenar: "Telf. de contacto responsable"');
                            return;
                          }

                          ModelPlanillaDeAtencion modelo =
                              ModelPlanillaDeAtencion(
                            usuario: prefs.userCarnet,
                            codPlanilla: 0,
                            codEdan: 0,
                            depto: controllerDepartamento.text,
                            municipio: controllerMunicipio.text,
                            comunidad: controllerComunidad.text,
                            nomestablecimiento: controllerEstablecimiento.text,
                            gerenciaRed: controllerGerenciaDeRed.text,
                            poblacion: controllerPoblacion.text != ''
                                ? int.parse(controllerPoblacion.text)
                                : 0,
                            fecha: controllerFecha.text,
                            hora: controllerHora.text,
                            evento: controllerEvento.text,
                            nombreResponsable: controllerNombreResponsable.text,
                            cargoResponsable: controllerCargoResponsable.text,
                            telfResponsable: controllerTelfResponsable.text,
                          );

                          // if (widget.edanModel != null) {
                          //   db.updateEDAN(modelo);
                          // } else {
                          //   db.insertEDAN(modelo);
                          // }
                          db.insertPLANILLA(modelo);
                          planillasNoEnviadasProvider.readDataBase();
                          Navigator.pop(context);
                          // db.insertEVENTO();
                        },
                      ),
                      const SizedBox(width: 10),
                      ButtonWidget(
                        text: 'Cancelar',
                        ontap: () {
                          Navigator.pop(context);
                          // db.insertEVENTO();
                        },
                        color: Colors.grey.shade200,
                        textcolor: Colors.black,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 250,
                ),
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
        InputListOption(
          title: 'Evento',
          controller: controllerEvento,
          isRequired: true,
          options: const [],
        ),
        InputListOption(
          title: 'Departamento',
          controller: controllerDepartamento,
          isRequired: true,
          options: const [
            'BENI',
            'CHUQUISACA',
            'COCHABAMBA',
            'LA PAZ',
            'ORURO',
            'PANDO',
            'POTOSI',
            'SANTA CRUZ',
            'TARIJA'
          ],
        ),
        InputListOption(
          title: 'Municipio',
          controller: controllerMunicipio,
          isRequired: true,
          options: const [],
        ),
        InputExpanded(
          title: 'Comunidad',
          controller: controllerComunidad,
          isRequired: true,
        ),
        InputExpanded(
          title: 'Establecimiento',
          controller: controllerEstablecimiento,
          isRequired: true,
        ),
        InputExpanded(
          title: 'Gerencia de Red',
          controller: controllerGerenciaDeRed,
        ),
        InputExpanded(
          title: 'Poblacion',
          controller: controllerPoblacion,
        ),
        InputDateOption(
          title: 'Fecha',
          controller: controllerFecha,
          isRequired: true,
        ),
        InputHourOption(
          title: 'Hora',
          controller: controllerHora,
          isRequired: true,
        ),
        InputExpanded(
          title: 'Nombre de Responsable',
          controller: controllerNombreResponsable,
          isRequired: true,
        ),
        InputExpanded(
          title: 'Cargo de Responsable',
          controller: controllerCargoResponsable,
          isRequired: true,
        ),
        InputExpanded(
          title: 'Telf. de contacto Responsable',
          controller: controllerTelfResponsable,
          isRequired: true,
        ),
        const Divider()
      ],
    );
  }

  void _showDialogMessage(
      {required String titulo, required String descripcion}) {
    EasyDialog(
      title: Text(
        titulo,
        style: const TextStyle(fontWeight: FontWeight.bold),
        textScaleFactor: 1.2,
      ),
      description: Text(
        descripcion,
        textScaleFactor: 1.1,
        textAlign: TextAlign.center,
      ),
    ).show(context);
  }
}
