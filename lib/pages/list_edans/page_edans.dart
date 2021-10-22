import 'dart:async';

import 'package:easy_dialog/easy_dialog.dart';
import 'package:flutter/material.dart';
import 'package:ministerio_de_salud/bussiness/database/database.dart';
import 'package:ministerio_de_salud/bussiness/models.dart/model_edan.dart';
import 'package:ministerio_de_salud/bussiness/providers/edan_provider.dart';
import 'package:ministerio_de_salud/pages/widgets/group/app_bar_widget.dart';
import 'package:ministerio_de_salud/pages/widgets/group/body_app_bar.dart';
import 'package:ministerio_de_salud/pages/widgets/unit/button_widget.dart';
import 'package:ministerio_de_salud/pages/widgets/unit/group_list_danios_establecimientos_de_salud.dart';
import 'package:ministerio_de_salud/pages/widgets/unit/group_list_danios_personal_de_salud.dart';
import 'package:ministerio_de_salud/pages/widgets/unit/group_list_instalacion_albergues.dart';
import 'package:ministerio_de_salud/pages/widgets/unit/input_date_option.dart';
import 'package:ministerio_de_salud/pages/widgets/unit/input_expanded.dart';
import 'package:ministerio_de_salud/pages/widgets/unit/input_hour_option.dart';
import 'package:ministerio_de_salud/pages/widgets/unit/input_list_boolean.dart';
import 'package:ministerio_de_salud/pages/widgets/unit/input_list_check.dart';
import 'package:ministerio_de_salud/pages/widgets/unit/input_list_option.dart';
import 'package:ministerio_de_salud/pages/widgets/unit/sublist_input_expanded.dart';
import 'package:ministerio_de_salud/pages/widgets/unit/sublist_input_list_boolean.dart';
import 'package:ministerio_de_salud/pages/widgets/unit/sublist_input_list_option.dart';
import 'package:ministerio_de_salud/pages/widgets/unit/title_expansion.dart';
import 'package:provider/provider.dart';

class PageEdans extends StatefulWidget {
  const PageEdans({Key? key, this.edanModel}) : super(key: key);
  final ModelEdan? edanModel;

  @override
  State<PageEdans> createState() => _PageEdansState();
}

class _PageEdansState extends State<PageEdans> {
  ///[SECCION DATOS GENERALES]
  TextEditingController controllerEvento = TextEditingController();
  TextEditingController controllerFecha = TextEditingController();
  TextEditingController controllerHora = TextEditingController();

  TextEditingController controllerSigueEnDesarrollo = TextEditingController();
  TextEditingController controllerNombreDeContacto = TextEditingController();
  TextEditingController controllerCargoDeContacto = TextEditingController();
  TextEditingController controllerDireccionDeContacto = TextEditingController();
  TextEditingController controllerTelefonoFijo = TextEditingController();
  TextEditingController controllerTelefonoMovil = TextEditingController();
  TextEditingController controllerDepartamento = TextEditingController();
  TextEditingController controllerMunicipio = TextEditingController();
  TextEditingController controllerComunidad = TextEditingController();

  TextEditingController controllerTieneCoordenadas = TextEditingController();
  TextEditingController controllerCoordenadaX = TextEditingController();
  TextEditingController controllerCoordenadaY = TextEditingController();
  TextEditingController controllerViaAerea = TextEditingController();
  TextEditingController controllerViaTerrestre = TextEditingController();
  TextEditingController controllerViaFluvial = TextEditingController();
  TextEditingController controllerViaFerroviaria = TextEditingController();

  TextEditingController controllerParaLlegar = TextEditingController();
  TextEditingController controllerTiempoLlegada = TextEditingController();

  TextEditingController controllerCondicionClimatica = TextEditingController();
  TextEditingController controllerMediosDeComunicacion =
      TextEditingController();

  int number = 0;

  /// [SECCION DANIOS GENERALES]
  TextEditingController controllerViviendasAfectadas = TextEditingController();
  TextEditingController controllerFamiliasDamnificadas =
      TextEditingController();

  TextEditingController controllerServicioDeAgua = TextEditingController();
  TextEditingController controllerServicioDeRecoleccion =
      TextEditingController();
  TextEditingController controllerServicioDeAlcantarilla =
      TextEditingController();
  TextEditingController controllerServicioDeEnergia = TextEditingController();
  TextEditingController controllerServicioDeTelecomunicaciones =
      TextEditingController();
  TextEditingController controllerServicioDeTransporte =
      TextEditingController();

  /// [DAÑOS_A_LA_SALUD]
  TextEditingController controllerHeridos = TextEditingController();
  TextEditingController controllerFallecidos = TextEditingController();
  TextEditingController controllerDesaparecidos = TextEditingController();

  List<Widget> listDaniosEstablecimientosDeSaludWidget = [];
  List<_DaniosEstablecimientosDeSalud> listDaniosEstablecimientosDeSalud = [];

  List<Widget> listDaniosPersonalDeSaludWidget = [];
  List<_DaniosAlPersonalDeSalud> listDaniosPersonalDeSalud = [];

  /// [SECCION_INSTALACION_DE_ALBERGUES]
  ///InstalacionDeAlbergues

  List<Widget> listInstalacionDeAlberguesWidget = [];
  List<_InstalacionAlbergues> listInstalacionDeAlbergues = [];

  ///[ACCIONES_REALIZADAS]
  TextEditingController controllerAccionesPrioritarias =
      TextEditingController();

  ///[SECCION DATOS GENERALES]
  TextEditingController controllerLugarEDAN = TextEditingController();
  TextEditingController controllerFechaEDAN = TextEditingController();
  TextEditingController controllerHoraEDAN = TextEditingController();
  TextEditingController controllerResponsableEDAN = TextEditingController();
  TextEditingController controllerCargoEDAN = TextEditingController();
  TextEditingController controllerTelfFijoEDAN = TextEditingController();
  TextEditingController controllerTelfMovilEDAN = TextEditingController();
  TextEditingController controllerCorreoEDAN = TextEditingController();
  TextEditingController controllerFechaAuxEDAN = TextEditingController();

  ///[DATABASE]
  DataBaseEdans db = DataBaseEdans();

  late EdanProvider edanProvider;

  ///

  // double _scrollPositiongroupInstalacionDeAlbergues = 0;
  late ScrollController scrollControllergroupInstalacionDeAlbergues;
  // double _scrollPositiongroupDaniosEstablecimiendosDeSalud = 0;
  late ScrollController scrollControllergroupDaniosEstablecimiendosDeSalud;
  // double _scrollPositiongroupDaniosAlPersonalDeSalud = 0;
  late ScrollController scrollControllergroupDaniosAlPersonalDeSalud;

  //////////////////////////////////////////////////////
  ///[CONTROLLERUNICOS]
  TextEditingController controllercodEdan = TextEditingController();
  TextEditingController controllerclaseEvento = TextEditingController();
  TextEditingController controllerfechap = TextEditingController();
  TextEditingController controllerenviado = TextEditingController();

  @override
  void initState() {
    edanProvider = Provider.of<EdanProvider>(context, listen: false);
    initDB();
    if (widget.edanModel != null) {
      controllercodEdan.text = widget.edanModel!.codEdan!.toString();
      controllerEvento.text = widget.edanModel!.evento ?? '';
      controllerclaseEvento.text = widget.edanModel!.claseEvento ?? '';
      controllerFecha.text = widget.edanModel!.fecha ?? '';
      controllerHora.text = widget.edanModel!.hora ?? '';
      controllerSigueEnDesarrollo.text = widget.edanModel!.continua ?? '';
      controllerNombreDeContacto.text = widget.edanModel!.nombre ?? '';
      controllerCargoDeContacto.text = widget.edanModel!.cargo ?? '';
      controllerDireccionDeContacto.text = widget.edanModel!.dreccion ?? '';
      controllerTelefonoFijo.text = widget.edanModel!.telFc ?? '';
      controllerTelefonoMovil.text = widget.edanModel!.telCc ?? '';
      controllerDepartamento.text = widget.edanModel!.depto ?? '';
      controllerMunicipio.text = widget.edanModel!.municipio ?? '';
      controllerComunidad.text = widget.edanModel!.comunidad ?? '';
      controllerTieneCoordenadas.text = widget.edanModel!.tieneCoord ?? '';
      controllerCoordenadaX.text = widget.edanModel!.coordenadaX ?? '';
      controllerCoordenadaY.text = widget.edanModel!.coordenadaY ?? '';
      controllerViaAerea.text = widget.edanModel!.aereo ?? '';
      controllerViaTerrestre.text = widget.edanModel!.terrestre ?? '';
      controllerViaFluvial.text = widget.edanModel!.fluvial ?? '';
      controllerViaFerroviaria.text = widget.edanModel!.ferroviario ?? '';
      controllerParaLlegar.text = widget.edanModel!.partida ?? '';
      controllerTiempoLlegada.text = widget.edanModel!.horaLlegada ?? '';
      controllerCondicionClimatica.text = widget.edanModel!.clima ?? '';
      controllerMediosDeComunicacion.text =
          widget.edanModel!.medioComunicacion ?? '';
      controllerViviendasAfectadas.text = widget.edanModel!.viviendas == null
          ? widget.edanModel!.viviendas.toString()
          : '0';
      controllerFamiliasDamnificadas.text = widget.edanModel!.familias == null
          ? widget.edanModel!.familias.toString()
          : '0';
      controllerServicioDeAgua.text = widget.edanModel!.agua ?? '';
      controllerServicioDeRecoleccion.text = widget.edanModel!.basura ?? '';
      controllerServicioDeAlcantarilla.text =
          widget.edanModel!.alcantarillado ?? '';
      controllerServicioDeEnergia.text = widget.edanModel!.electricidad ?? '';
      controllerServicioDeTelecomunicaciones.text =
          widget.edanModel!.telecom ?? '';
      controllerServicioDeTransporte.text = widget.edanModel!.transporte ?? '';
      controllerHeridos.text = widget.edanModel!.heridos == null
          ? widget.edanModel!.heridos.toString()
          : '0';
      controllerFallecidos.text = widget.edanModel!.muertos == null
          ? widget.edanModel!.muertos.toString()
          : '0';
      controllerDesaparecidos.text = widget.edanModel!.desaparecidos == null
          ? widget.edanModel!.desaparecidos.toString()
          : '0';
      controllerAccionesPrioritarias.text =
          widget.edanModel!.accionesPrioritarias == null
              ? widget.edanModel!.accionesPrioritarias.toString()
              : '0';
      controllerLugarEDAN.text = widget.edanModel!.lugarLle == null
          ? widget.edanModel!.accionesPrioritarias.toString()
          : '0';
      controllerFechaEDAN.text = widget.edanModel!.fechaLle ?? '';
      controllerHoraEDAN.text = widget.edanModel!.horaLle ?? '';
      controllerResponsableEDAN.text = widget.edanModel!.responsableLle ?? '';
      controllerCargoEDAN.text = widget.edanModel!.cargoLle ?? '';
      controllerTelfFijoEDAN.text = widget.edanModel!.telfFijoLle ?? '';
      controllerTelfMovilEDAN.text = widget.edanModel!.telfCelLle ?? '';
      controllerCorreoEDAN.text = widget.edanModel!.email ?? '';
      controllerFechaAuxEDAN.text = widget.edanModel!.usuario ?? '';
      controllerfechap.text = widget.edanModel!.fechap ?? '';
      controllerenviado.text = widget.edanModel!.enviado ?? '';
    } else {
      controllerFecha.text =
          '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}';
      controllerHora.text = '${DateTime.now().hour}:${DateTime.now().minute}';

      controllerFechaEDAN.text =
          '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}';
      controllerHoraEDAN.text =
          '${DateTime.now().hour}:${DateTime.now().minute}';
    }
    scrollControllergroupInstalacionDeAlbergues = ScrollController();
    scrollControllergroupDaniosEstablecimiendosDeSalud = ScrollController();
    scrollControllergroupDaniosAlPersonalDeSalud = ScrollController();
    super.initState();
  }

  void initDB() async {
    db.initDB();
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
                  child: BodyAppBar(text: 'Lista EDANs NO enviados'),
                ),
                _datosGenerales(size),
                _daniosGenerales(size),
                _daniosALaSalud(size),
                _accionesARealizar(size),
                _datosLlenadoDelEdan(size),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      ButtonWidget(
                        text: 'Guardar',
                        ontap: () {
                          // log('''
                          // controllerEvento => ${controllerEvento.text}
                          // controllerFecha => ${controllerFecha.text}
                          // controllerHora => ${controllerHora.text}
                          // controllerSigueEnDesarrollo => ${controllerSigueEnDesarrollo.text}
                          // controllerNombreDeContacto => ${controllerNombreDeContacto.text}
                          // controllerCargoDeContacto => ${controllerCargoDeContacto.text}
                          // controllerDireccionDeContacto => ${controllerDireccionDeContacto.text}
                          // controllerTelefonoFijo => ${controllerTelefonoFijo.text}
                          // controllerTelefonoMovil => ${controllerTelefonoMovil.text}
                          // controllerDepartamento => ${controllerDepartamento.text}
                          // controllerMunicipio => ${controllerMunicipio.text}
                          // controllerComunidad => ${controllerComunidad.text}
                          // controllerTieneCoordenadas => ${controllerTieneCoordenadas.text}
                          // controllerViaAerea => ${controllerViaAerea.text}
                          // controllerViaTerrestre => ${controllerViaTerrestre.text}
                          // controllerViaFluvial => ${controllerViaFluvial.text}
                          // controllerViaFerroviaria => ${controllerViaFerroviaria.text}
                          // controllerParaLlegar => ${controllerParaLlegar.text}
                          // controllerTiempoLlegada => ${controllerTiempoLlegada.text}
                          // controllerCondicionClimatica => ${controllerCondicionClimatica.text}
                          // controllerMediosDeComunicacion => ${controllerMediosDeComunicacion.text}
                          // controllerViviendasAfectadas => ${controllerViviendasAfectadas.text}
                          // controllerFamiliasDamnificadas => ${controllerFamiliasDamnificadas.text}
                          // controllerServivioDeAgua => ${controllerServivioDeAgua.text}
                          // controllerServicioDeRecoleccion => ${controllerServicioDeRecoleccion.text}
                          // controllerServicioDeAlcantarilla => ${controllerServicioDeAlcantarilla.text}
                          // controllerServicioDeEnergia => ${controllerServicioDeEnergia.text}
                          // controllerServicioDeTelecomunicaciones => ${controllerServicioDeTelecomunicaciones.text}
                          // controllerServicioDeTransporte => ${controllerServicioDeTransporte.text}
                          // controllerHeridos => ${controllerHeridos.text}
                          // controllerFallecidos => ${controllerFallecidos.text}
                          // controllerDesaparecidos => ${controllerDesaparecidos.text}
                          // controllerLugarEDAN => ${controllerLugarEDAN.text}
                          // controllerFechaEDAN => ${controllerFechaEDAN.text}
                          // controllerHoraEDAN => ${controllerHoraEDAN.text}
                          // controllerResponsableEDAN => ${controllerResponsableEDAN.text}
                          // controllerCargoEDAN => ${controllerCargoEDAN.text}
                          // controllerTelfFijoEDAN => ${controllerTelfFijoEDAN.text}
                          // controllerTelfMovilEDAN => ${controllerTelfMovilEDAN.text}
                          // controllerCorreoEDAN => ${controllerCorreoEDAN.text}
                          // controllerFechaAuxEDAN => ${controllerFechaAuxEDAN.text}
                          // ''');

                          if (controllerEvento.text ==
                              '- Seleccione una opción -') {
                            _showDialogMessage(
                                titulo: 'Campo obligatorio no llenado',
                                descripcion: 'Debes llenar: "Evento"');
                            return;
                          }
                          if (controllerFecha.text.isEmpty) {
                            _showDialogMessage(
                                titulo: 'Campo obligatorio no llenado',
                                descripcion: 'Debes llenar: "Fecha"');
                            return;
                          }
                          if (controllerNombreDeContacto.text.isEmpty) {
                            _showDialogMessage(
                                titulo: 'Campo obligatorio no llenado',
                                descripcion:
                                    'Debes llenar: "Nombre de contacto"');
                            return;
                          }
                          if (controllerCargoDeContacto.text.isEmpty) {
                            _showDialogMessage(
                                titulo: 'Campo obligatorio no llenado',
                                descripcion:
                                    'Debes llenar: "Cargo de contacto"');
                            return;
                          }
                          if (controllerTelefonoMovil.text.isEmpty) {
                            _showDialogMessage(
                                titulo: 'Campo obligatorio no llenado',
                                descripcion:
                                    'Debes llenar: "Telefono movil de contacto"');
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
                                descripcion:
                                    'Debes llenar: "Comunidad o zona"');
                            return;
                          }
                          if (controllerCondicionClimatica.text.isEmpty) {
                            _showDialogMessage(
                                titulo: 'Campo obligatorio no llenado',
                                descripcion:
                                    'Debes llenar: "Condicion climatica actual"');
                            return;
                          }
                          if (controllerMediosDeComunicacion.text.isEmpty) {
                            _showDialogMessage(
                                titulo: 'Campo obligatorio no llenado',
                                descripcion:
                                    'Debes llenar: "Medios de comunicacion disponibles"');
                            return;
                          }
                          if (controllerViviendasAfectadas.text.isEmpty) {
                            _showDialogMessage(
                                titulo: 'Campo obligatorio no llenado',
                                descripcion:
                                    'Debes llenar: "Viviendas afectadas"');
                            return;
                          }
                          if (controllerFamiliasDamnificadas.text.isEmpty) {
                            _showDialogMessage(
                                titulo: 'Campo obligatorio no llenado',
                                descripcion:
                                    'Debes llenar: "Familias damnificadas"');
                            return;
                          }
                          if (controllerHeridos.text.isEmpty) {
                            _showDialogMessage(
                                titulo: 'Campo obligatorio no llenado',
                                descripcion: 'Debes llenar: "Heridos"');
                            return;
                          }
                          if (controllerFallecidos.text.isEmpty) {
                            _showDialogMessage(
                                titulo: 'Campo obligatorio no llenado',
                                descripcion: 'Debes llenar: "Fallecidos"');
                            return;
                          }
                          if (controllerDesaparecidos.text.isEmpty) {
                            _showDialogMessage(
                                titulo: 'Campo obligatorio no llenado',
                                descripcion: 'Debes llenar: "Desaparecidos"');
                            return;
                          }
                          ModelEdan modelo = ModelEdan(
                            // ignore: unnecessary_null_comparison
                            codEdan: controllercodEdan.text != ''
                                ? int.parse(controllercodEdan.text)
                                : 0,
                            evento: controllerEvento.text,
                            fecha: controllerFecha.text,
                            hora: controllerHora.text,
                            continua: controllerSigueEnDesarrollo.text,
                            nombre: controllerNombreDeContacto.text,
                            cargo: controllerCargoDeContacto.text,
                            dreccion: controllerDireccionDeContacto.text,
                            telFc: controllerTelefonoFijo.text,
                            telCc: controllerTelefonoMovil.text,
                            depto: controllerDepartamento.text,
                            municipio: controllerMunicipio.text,
                            comunidad: controllerComunidad.text,
                            tieneCoord: controllerTieneCoordenadas.text,
                            coordenadaX: controllerCoordenadaX.text,
                            coordenadaY: controllerCoordenadaY.text,
                            aereo: controllerViaAerea.text,
                            terrestre: controllerViaTerrestre.text,
                            fluvial: controllerViaFluvial.text,
                            ferroviario: controllerViaFerroviaria.text,
                            partida: controllerParaLlegar.text,
                            horaLlegada: controllerTiempoLlegada.text,
                            clima: controllerCondicionClimatica.text,
                            medioComunicacion:
                                controllerMediosDeComunicacion.text,
                            viviendas:
                                int.parse(controllerViviendasAfectadas.text),
                            familias:
                                int.parse(controllerFamiliasDamnificadas.text),
                            agua: controllerServicioDeAgua.text,
                            basura: controllerServicioDeRecoleccion.text,
                            alcantarillado:
                                controllerServicioDeAlcantarilla.text,
                            electricidad: controllerServicioDeEnergia.text,
                            telecom:
                                controllerServicioDeTelecomunicaciones.text,
                            transporte: controllerServicioDeTransporte.text,
                            heridos: int.parse(controllerHeridos.text),
                            muertos: int.parse(controllerFallecidos.text),
                            desaparecidos:
                                int.parse(controllerDesaparecidos.text),
                            accionesPrioritarias:
                                controllerAccionesPrioritarias.text,
                            lugarLle: controllerLugarEDAN.text,
                            fechaLle: controllerFechaEDAN.text,
                            horaLle: controllerHoraEDAN.text,
                            responsableLle: controllerResponsableEDAN.text,
                            cargoLle: controllerCargoEDAN.text,
                            telfFijoLle: controllerTelfFijoEDAN.text,
                            telfCelLle: controllerTelfMovilEDAN.text,
                            email: controllerCorreoEDAN.text,
                            usuario: '',
                            fechap: '',
                            enviado: '',
                          );

                          if (widget.edanModel != null) {
                            db.updateEDAN(modelo);
                          } else {
                            db.insertEDAN(modelo);
                          }

                          edanProvider.readDataBase();
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
          initiallyExpanded: true,
          title: const TitleExpansion(texto: '1.- DATOS GENERALES'),
          children: <Widget>[
            InputListOption(
              title: 'Evento',
              controller: controllerEvento,
              isRequired: true,
              options: const [
                'Accidentes por prod. y sust. peligrosas',
                'Biológico',
                'Convulsión social',
                'Deslizamiento',
                'Desporde de rio(inund. rapida)',
                'Granizada',
                'Helada',
                'Incendio',
                'Inundación lenta',
                'Mazamorra',
                'Nevada',
                'Otros de excepcion',
                'Plagas',
                'Riada',
                'Sequia',
                'Terremoto',
              ],
            ),
            InputDateOption(
              title: 'Fecha',
              controller: controllerFecha,
              isRequired: true,
            ),
            InputHourOption(
              title: 'Hora probable de inicio',
              controller: controllerHora,
            ),
            InputListBoolean(
              title: 'Sigue en desarrollo la ocurrencia?',
              controller: controllerSigueEnDesarrollo,
              options: const ['Si', 'No'],
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
              controller: controllerTelefonoMovil,
              isRequired: true,
            ),
            InputExpanded(
              title: 'Departamento',
              controller: controllerDepartamento,
              isRequired: true,
            ),
            InputExpanded(
              title: 'Municipio',
              controller: controllerMunicipio,
              isRequired: true,
            ),
            InputExpanded(
              title: 'Comunidad o zona',
              controller: controllerComunidad,
              isRequired: true,
            ),

            InputListBoolean(
              title: 'Tiene coordenadas geograficas de GPS?',
              controller: controllerTieneCoordenadas,
              options: const ['Si', 'No'],
            ),
            InputListBoolean(
              title: 'Via aerea disponible',
              controller: controllerViaAerea,
              options: const ['Sin Daño', 'Afectado', 'Destruido'],
            ),
            InputListBoolean(
              title: 'Via terrestre disponible',
              controller: controllerViaTerrestre,
              options: const ['Sin Daño', 'Afectado', 'Destruido'],
            ),
            InputListBoolean(
              title: 'Via fluvial disponible',
              controller: controllerViaFluvial,
              options: const ['Sin Daño', 'Afectado', 'Destruido'],
            ),
            InputListBoolean(
              title: 'Via ferroviaria disponible',
              controller: controllerViaFerroviaria,
              options: const ['Sin Daño', 'Afectado', 'Destruido'],
            ),

            InputExpanded(
              title: 'Para llegar al lugar se parte de (lugar):',
              controller: controllerParaLlegar,
            ),
            InputExpanded(
                title: 'Tiempo de llegada al lugar (en horas)',
                controller: controllerTiempoLlegada),

            InputListSelectedCheck(
              title: 'Condicion climatica actual',
              controller: controllerCondicionClimatica,
              isRequired: true,
              options: const ['Lluvioso', 'Nublado', 'Con viento'],
            ),

            InputListSelectedCheck(
              title: 'Medios de comunicacion disponibles',
              controller: controllerMediosDeComunicacion,
              isRequired: true,
              options: const [
                'Radio frecuencia 20/40 m',
                'Telefono fijo',
                'Telefono movil',
                'Television',
                'Internet',
                'Radio emisora'
              ],
            ),
            // ExpansionTile(
            //   title: const TitleExpansion(texto: '1.- DEMO 1'),
            //   children: [_groupDaniosEstablecimiendosDeSalud()],
            // ),
            // ExpansionTile(
            //   title: const TitleExpansion(texto: '1.- DEMO 2'),
            //   children: [_groupDaniosAlPersonalDeSalud()],
            // )
          ],
        ),
        const Divider()
      ],
    );
  }

  Widget _daniosGenerales(Size size) {
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
          title: const TitleExpansion(texto: '2.- DAÑOS GENERALES'),
          children: <Widget>[
            InputExpanded(
              title: 'Viviendas afectadas',
              controller: controllerViviendasAfectadas,
              isRequired: true,
              initValue: '0',
            ),
            InputExpanded(
              title: 'Flias. damnificadas',
              controller: controllerFamiliasDamnificadas,
              isRequired: true,
              initValue: '0',
            ),
            InputListBoolean(
              title: 'Servicio de agua potable',
              controller: controllerServicioDeAgua,
              options: const ['Sin daño', 'Afectado', 'Destruido', 'No existe'],
            ),
            InputListBoolean(
              title: 'Servicio de recoleccion de basura',
              controller: controllerServicioDeRecoleccion,
              options: const ['Sin daño', 'Afectado', 'Destruido', 'No existe'],
            ),
            InputListBoolean(
              title: 'Servicio de alcantarillado',
              controller: controllerServicioDeAlcantarilla,
              options: const ['Sin daño', 'Afectado', 'Destruido', 'No existe'],
            ),
            InputListBoolean(
              title: 'Servicio de energia electrica',
              controller: controllerServicioDeEnergia,
              options: const ['Sin daño', 'Afectado', 'Destruido', 'No existe'],
            ),
            InputListBoolean(
              title: 'Servicio de telecomunicaciones',
              controller: controllerServicioDeTelecomunicaciones,
              options: const ['Sin daño', 'Afectado', 'Destruido', 'No existe'],
            ),
            InputListBoolean(
              title: 'Servicio de transporte',
              controller: controllerServicioDeTransporte,
              options: const ['Sin daño', 'Afectado', 'Destruido', 'No existe'],
            ),

            // ExpansionTile(
            //   title: const TitleExpansion(texto: '1.- DEMO 1'),
            //   children: [_groupDaniosEstablecimiendosDeSalud()],
            // ),
            // ExpansionTile(
            //   title: const TitleExpansion(texto: '1.- DEMO 2'),
            //   children: [_groupDaniosAlPersonalDeSalud()],
            // )
          ],
        ),
        const Divider()
      ],
    );
  }

  Widget _accionesARealizar(Size size) {
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
          title: const TitleExpansion(
              texto:
                  '4.- ACCIONES REALIZADAS, 5.- ACCIONES PRIORITARIAS, 6.- REQUERIMIENTOS'),
          children: <Widget>[
            ExpansionTile(
              title: const TitleExpansion(texto: 'Instalación de albergues'),
              children: [_groupInstalacionDeAlbergues(size)],
            ),
            InputExpanded(
              title:
                  '5.- Acciones prioritarias para el control de la situación y atencion en salud',
              controller: controllerAccionesPrioritarias,
              isRequired: true,
            ),
            // ExpansionTile(
            //   title: const TitleExpansion(
            //       texto:
            //           'Daños al personal de salud(muertos, heridos, disponibles y desaparecidos)'),
            //   children: [_groupDaniosAlPersonalDeSalud(size)],
            // )
          ],
        ),
        const Divider()
      ],
    );
  }

  Widget _daniosALaSalud(Size size) {
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
          title: const TitleExpansion(texto: '3.- DAÑOS A LA SALUD'),
          children: <Widget>[
            InputExpanded(
              title: 'Heridos',
              controller: controllerHeridos,
              isRequired: true,
              initValue: '0',
            ),
            InputExpanded(
              title: 'Fallecidos',
              controller: controllerFallecidos,
              isRequired: true,
              initValue: '0',
            ),
            InputExpanded(
              title: 'Desaparecidos',
              controller: controllerDesaparecidos,
              initValue: '0',
              isRequired: true,
            ),
            ExpansionTile(
              title: const TitleExpansion(
                  texto: 'Daños a establecimientos de salud'),
              children: [_groupDaniosEstablecimiendosDeSalud(size)],
            ),
            ExpansionTile(
              title: const TitleExpansion(
                  texto:
                      'Daños al personal de salud(muertos, heridos, disponibles y desaparecidos)'),
              children: [_groupDaniosAlPersonalDeSalud(size)],
            )
          ],
        ),
        const Divider()
      ],
    );
  }

  Widget _datosLlenadoDelEdan(Size size) {
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
          title: const TitleExpansion(texto: '7.- DATOS DEL LLENADO DEL EDAN'),
          children: <Widget>[
            InputExpanded(
              title: 'Lugar',
              controller: controllerLugarEDAN,
            ),
            InputDateOption(
              title: 'Fecha',
              controller: controllerFechaEDAN,
            ),
            InputHourOption(
              title: 'Hora',
              controller: controllerHoraEDAN,
            ),
            InputExpanded(
              title: 'Responsable',
              controller: controllerResponsableEDAN,
            ),
            InputExpanded(
              title: 'Cargo',
              controller: controllerCargoEDAN,
            ),
            InputExpanded(
              title: 'Telf. fijo',
              controller: controllerTelfFijoEDAN,
              isNumber: true,
            ),
            InputExpanded(
              title: 'Telf. movil',
              controller: controllerTelfMovilEDAN,
              isNumber: true,
            ),
            InputExpanded(
              title: 'Correo electronico',
              controller: controllerCorreoEDAN,
            ),
          ],
        ),
        const Divider()
      ],
    );
  }

  Widget _groupDaniosEstablecimiendosDeSalud(Size size) {
    return Scrollbar(
      isAlwaysShown: true,
      showTrackOnHover: true,
      controller: scrollControllergroupDaniosEstablecimiendosDeSalud,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          width: size.width > 600 ? size.width - 20 : 600,
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
        ),
      ),
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
  Widget _groupDaniosAlPersonalDeSalud(Size size) {
    return Scrollbar(
      isAlwaysShown: true,
      showTrackOnHover: true,
      controller: scrollControllergroupDaniosAlPersonalDeSalud,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          width: size.width > 600 ? size.width - 20 : 600,
          // constraints: BoxConstraints(minWidth: 600),
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
        ),
      ),
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

  /////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////
  Widget _groupInstalacionDeAlbergues(Size size) {
    return Scrollbar(
      isAlwaysShown: true,
      showTrackOnHover: true,
      controller: scrollControllergroupInstalacionDeAlbergues,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          width: size.width > 600 ? size.width - 20 : 600,
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.lightBlue),
          ),
          child: GroupInstalacionDeAlbergues(listWidgets: [
            ...listInstalacionDeAlberguesWidget,
            Material(
              color: Colors.grey.shade100,
              child: InkWell(
                onTap: () async {
                  listInstalacionDeAlbergues.add(_InstalacionAlbergues());
                  await _actualizarListaInstalacionAlbergues();
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
            'Cant. albergues',
            'Lugar de albergues',
          ]),
        ),
      ),
    );
  }

  Future<void> _actualizarListaInstalacionAlbergues() async {
    listInstalacionDeAlberguesWidget = [];
    int i = 0;
    Future.delayed(Duration.zero, () {
      listInstalacionDeAlberguesWidget = listInstalacionDeAlbergues.map((demo) {
        i++;
        return Container(
          color: i % 2 == 0 ? Colors.blue[50] : Colors.white,
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.lightBlue.shade100),
                    ),
                    child: SublistInputExpanded(
                      controller: demo.controllerCantidad,
                      isNumber: true,
                      hint: '0',
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.lightBlue.shade100),
                    ),
                    child: SublistInputExpanded(
                      controller: demo.controllerLugarDeAlbergue,
                      hint: 'Lugar de albergues',
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
                        listInstalacionDeAlbergues.remove(demo);
                        _actualizarListaInstalacionAlbergues();
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

class _InstalacionAlbergues {
  TextEditingController controllerCantidad = TextEditingController();
  TextEditingController controllerLugarDeAlbergue = TextEditingController();

  _InstalacionAlbergues();
}
