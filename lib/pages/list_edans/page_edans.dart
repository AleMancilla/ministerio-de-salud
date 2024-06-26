import 'dart:async';

import 'package:cool_alert/cool_alert.dart';
import 'package:easy_dialog/easy_dialog.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ministerio_de_salud/bussiness/database/database.dart';
import 'package:ministerio_de_salud/bussiness/models.dart/model_danos_personal_de_salud.dart';
import 'package:ministerio_de_salud/bussiness/models.dart/model_desastre_acciones.dart';
import 'package:ministerio_de_salud/bussiness/models.dart/model_desastre_acciones2.dart';
import 'package:ministerio_de_salud/bussiness/models.dart/model_desastre_establecimiento.dart';
import 'package:ministerio_de_salud/bussiness/models.dart/model_desastre_requerimientos.dart';
import 'package:ministerio_de_salud/bussiness/models.dart/model_edan.dart';
import 'package:ministerio_de_salud/bussiness/providers/edan_provider.dart';
import 'package:ministerio_de_salud/pages/widgets/group/app_bar_widget.dart';
import 'package:ministerio_de_salud/pages/widgets/group/body_app_bar.dart';
import 'package:ministerio_de_salud/pages/widgets/group/group_list_acciones.dart';
import 'package:ministerio_de_salud/pages/widgets/group/group_list_danios_personal_de_salud.dart';
import 'package:ministerio_de_salud/pages/widgets/group/group_list_movilizacion_de_personal_salud.dart';
import 'package:ministerio_de_salud/pages/widgets/group/group_list_requerimientos_apoyo.dart';
import 'package:ministerio_de_salud/pages/widgets/unit/button_widget.dart';
import 'package:ministerio_de_salud/pages/widgets/unit/input_date_option.dart';
import 'package:ministerio_de_salud/pages/widgets/unit/input_expanded.dart';
import 'package:ministerio_de_salud/pages/widgets/unit/input_hour_option.dart';
import 'package:ministerio_de_salud/pages/widgets/unit/input_list_boolean.dart';
import 'package:ministerio_de_salud/pages/widgets/unit/input_list_check.dart';
import 'package:ministerio_de_salud/pages/widgets/unit/input_list_option.dart';
import 'package:ministerio_de_salud/pages/widgets/unit/input_text_field.dart';
import 'package:ministerio_de_salud/pages/widgets/unit/input_text_field_description.dart';
import 'package:ministerio_de_salud/pages/widgets/unit/sublist_input_expanded.dart';
import 'package:ministerio_de_salud/pages/widgets/unit/sublist_input_list_boolean.dart';
import 'package:ministerio_de_salud/pages/widgets/unit/sublist_input_list_option.dart';
import 'package:ministerio_de_salud/pages/widgets/unit/title_expansion.dart';
import 'package:ministerio_de_salud/utils/user_preferens.dart';
import 'package:ministerio_de_salud/utils/utils.dart';
import 'package:permission_handler/permission_handler.dart';
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
  TextEditingController controllerTipoEDAN = TextEditingController();
  TextEditingController controllerOtroEvento = TextEditingController();
  bool otroEventoCheck = false;
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
  TextEditingController controllerCanalDeRadiofrecuencia =
      TextEditingController();
  TextEditingController controllerNombreDeLaRadioEmisora =
      TextEditingController();
  TextEditingController controllerDialDeLaEmisora = TextEditingController();
  TextEditingController controllerTelfContactoDeLaRadioEmisora =
      TextEditingController();

  int number = 0;

  /// [SECCION DANIOS GENERALES]
  TextEditingController controllerViviendasAfectadas = TextEditingController();
  TextEditingController controllerFamiliasDamnificadas =
      TextEditingController();

  TextEditingController controllerNinosVulnerables = TextEditingController();
  TextEditingController controllerNinasVulnerables = TextEditingController();
  TextEditingController controllerPersonasConDiscapacidadVaron =
      TextEditingController();
  TextEditingController controllerPersonasConDiscapacidadMujer =
      TextEditingController();
  TextEditingController controllerMujeresEmbarazadas = TextEditingController();
  TextEditingController controllerAdultosMayoresVaron = TextEditingController();
  TextEditingController controllerAdultosMayoresMujer = TextEditingController();
  TextEditingController controllerNroAlbergues = TextEditingController();

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
  TextEditingController controllerEstablecimientosDeSalud =
      TextEditingController();

  /// [DAÑOS_A_LA_SALUD]
  TextEditingController controllerHeridos = TextEditingController();
  TextEditingController controllerFallecidos = TextEditingController();
  TextEditingController controllerDesaparecidos = TextEditingController();
  TextEditingController controllerLesionados = TextEditingController();

  List<Widget> listDaniosEstablecimientosDeSaludWidget = [];
  List<_DaniosEstablecimientosDeSalud> listDaniosEstablecimientosDeSalud = [];

  List<Widget> listDaniosPersonalDeSaludWidget = [];
  List<_DaniosAlPersonalDeSalud> listDaniosPersonalDeSalud = [];

  /// [SECCION_INSTALACION_DE_ALBERGUES]
  ///InstalacionDeAlbergues

  // List<Widget> listInstalacionDeAlberguesWidget = [];
  // List<_InstalacionAlbergues> listInstalacionDeAlbergues = [];

  List<Widget> listAccionesWidget = [];
  List<_Acciones> listAcciones = [];

  List<Widget> listAccionesPrioritariasWidget = [];
  List<_AccionesPrioritarias> listAccionesPrioritarias = [];

  List<Widget> listRequerimientoApoyoWidget = [];
  List<_RequerimientoApoyo> listRequerimientoApoyo = [];

  ///[ACCIONES_REALIZADAS]
  TextEditingController controllerOrganizacionQueRealizeTrabajos =
      TextEditingController();

  TextEditingController controllerSistemaDeComandos = TextEditingController();

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
  UserPreferences prefs = UserPreferences();

  late EdanProvider edanProvider;

  ///

  // double _scrollPositiongroupInstalacionDeAlbergues = 0;
  late ScrollController scrollControllergroupInstalacionDeAlbergues;
  late ScrollController scrollControllergroupAcciones;
  late ScrollController scrollControllergroupAccionesPrioritarias;
  late ScrollController scrollControllergroupRequerimientosDeApoyo;
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
      // controllercodEdan.text = widget.edanModel!.codEdan == null
      //     ? widget.edanModel!.codEdan.toString()
      //     : '0';
      controllerEvento.text = widget.edanModel!.evento.toString();
      controllerTipoEDAN.text = widget.edanModel!.tipoEdan.toString();
      controllerOtroEvento.text = widget.edanModel!.claseEvento.toString();
      controllerFecha.text = widget.edanModel!.fecha.toString();
      controllerHora.text = widget.edanModel!.hora.toString();
      controllerSigueEnDesarrollo.text = widget.edanModel!.continua.toString();
      controllerNombreDeContacto.text = widget.edanModel!.nombre.toString();
      controllerCargoDeContacto.text = widget.edanModel!.cargo.toString();
      controllerDireccionDeContacto.text =
          widget.edanModel!.dreccion.toString();
      controllerTelefonoFijo.text = widget.edanModel!.telFc.toString();
      print(
          '########## 1 CAMBIO #### >>>> ${controllerTelefonoFijo.text} <<<<<');
      controllerTelefonoMovil.text = widget.edanModel!.telCc.toString();
      controllerDepartamento.text = widget.edanModel!.depto.toString();
      controllerMunicipio.text = widget.edanModel!.municipio.toString();
      controllerComunidad.text = widget.edanModel!.comunidad.toString();
      controllerTieneCoordenadas.text = widget.edanModel!.tieneCoord.toString();
      controllerCoordenadaX.text = widget.edanModel!.coordenadaX.toString();
      controllerCoordenadaY.text = widget.edanModel!.coordenadaY.toString();
      controllerViaAerea.text = widget.edanModel!.aereo.toString();
      controllerViaTerrestre.text = widget.edanModel!.terrestre.toString();
      controllerViaFluvial.text = widget.edanModel!.fluvial.toString();
      controllerViaFerroviaria.text = widget.edanModel!.ferroviario.toString();
      controllerParaLlegar.text = widget.edanModel!.partida.toString();
      controllerTiempoLlegada.text = widget.edanModel!.horaLlegada.toString();
      controllerCondicionClimatica.text = widget.edanModel!.clima.toString();
      controllerMediosDeComunicacion.text =
          widget.edanModel!.medioComunicacion.toString();
      controllerCanalDeRadiofrecuencia.text =
          widget.edanModel!.canal.toString();
      controllerNombreDeLaRadioEmisora.text =
          widget.edanModel!.nombreEmisora.toString();
      controllerDialDeLaEmisora.text = widget.edanModel!.dialEmisora.toString();
      controllerTelfContactoDeLaRadioEmisora.text =
          widget.edanModel!.telefonoEmisora.toString();

      controllerViviendasAfectadas.text = widget.edanModel!.viviendas != null
          ? widget.edanModel!.viviendas.toString()
          : '0';
      controllerFamiliasDamnificadas.text = widget.edanModel!.familias != null
          ? widget.edanModel!.familias.toString()
          : '0';
      controllerNinosVulnerables.text = widget.edanModel!.ninios != null
          ? widget.edanModel!.ninios.toString()
          : '0';
      controllerNinasVulnerables.text = widget.edanModel!.ninias != null
          ? widget.edanModel!.ninias.toString()
          : '0';
      controllerPersonasConDiscapacidadVaron.text =
          widget.edanModel!.discapacidad != null
              ? widget.edanModel!.discapacidad.toString()
              : '0';
      controllerPersonasConDiscapacidadMujer.text =
          widget.edanModel!.discapacidadm != null
              ? widget.edanModel!.discapacidadm.toString()
              : '0';
      controllerMujeresEmbarazadas.text = widget.edanModel!.embarazadas != null
          ? widget.edanModel!.embarazadas.toString()
          : '0';
      controllerAdultosMayoresVaron.text = widget.edanModel!.adultoMayor != null
          ? widget.edanModel!.adultoMayor.toString()
          : '0';
      controllerAdultosMayoresMujer.text =
          widget.edanModel!.adultoMayorm != null
              ? widget.edanModel!.adultoMayorm.toString()
              : '0';
      controllerNroAlbergues.text = widget.edanModel!.numAlbergues != null
          ? widget.edanModel!.numAlbergues.toString()
          : '0';
      controllerServicioDeAgua.text = widget.edanModel!.agua.toString();
      controllerServicioDeRecoleccion.text =
          widget.edanModel!.basura.toString();
      controllerServicioDeAlcantarilla.text =
          widget.edanModel!.alcantarillado.toString();
      controllerServicioDeEnergia.text =
          widget.edanModel!.electricidad.toString();
      controllerServicioDeTelecomunicaciones.text =
          widget.edanModel!.telecom.toString();
      controllerServicioDeTransporte.text =
          widget.edanModel!.transporte.toString();

      controllerEstablecimientosDeSalud.text =
          widget.edanModel!.establecimientossalud.toString();

      controllerHeridos.text = widget.edanModel!.heridos != null
          ? widget.edanModel!.heridos.toString()
          : '0';
      controllerFallecidos.text = widget.edanModel!.muertos != null
          ? widget.edanModel!.muertos.toString()
          : '0';
      controllerDesaparecidos.text = widget.edanModel!.desaparecidos != null
          ? widget.edanModel!.desaparecidos.toString()
          : '0';
      controllerLesionados.text = widget.edanModel!.lesionados != null
          ? widget.edanModel!.lesionados.toString()
          : '0';

      controllerOrganizacionQueRealizeTrabajos.text =
          widget.edanModel!.otraOrganizacion.toString();
      controllerSistemaDeComandos.text = widget.edanModel!.sci.toString();
      controllerSistemaDeComandos.text = widget.edanModel!.sciDonde.toString();
      controllerLugarEDAN.text = widget.edanModel!.lugarLle.toString();
      controllerFechaEDAN.text = widget.edanModel!.fechaLle.toString();
      controllerHoraEDAN.text = widget.edanModel!.horaLle.toString();
      controllerResponsableEDAN.text =
          widget.edanModel!.responsableLle.toString();
      controllerCargoEDAN.text = widget.edanModel!.cargoLle.toString();
      controllerTelfFijoEDAN.text = widget.edanModel!.telfFijoLle.toString();
      controllerTelfMovilEDAN.text = widget.edanModel!.telfCelLle.toString();
      controllerCorreoEDAN.text = widget.edanModel!.email.toString();
      //  controllerCorreoEDAN = widget.edanModel!.usuario.toString();
      //  '' = widget.edanModel!.fechap.toString();
      //  '' = widget.edanModel!.enviado.toString();
    } else {
      controllerViviendasAfectadas.text = '0';
      controllerFamiliasDamnificadas.text = '0';
      controllerHeridos.text = '0';
      controllerFallecidos.text = '0';
      controllerDesaparecidos.text = '0';
      controllerNinosVulnerables.text = '0';
      controllerNinasVulnerables.text = '0';
      controllerPersonasConDiscapacidadVaron.text = '0';
      controllerPersonasConDiscapacidadMujer.text = '0';
      controllerMujeresEmbarazadas.text = '0';
      print(
          '########## 2 CAMBIO #### >>>> ${controllerMujeresEmbarazadas.text} <<<<<');
      controllerAdultosMayoresVaron.text = '0';
      controllerAdultosMayoresMujer.text = '0';
      controllerNroAlbergues.text = '0';
      controllerLesionados.text = '0';
      controllerTipoEDAN.text = '8 horas';
      controllerTieneCoordenadas.text = 'No';
      controllerFecha.text =
          '${DateTime.now().day.toString().padLeft(2, '0')}/${DateTime.now().month.toString().padLeft(2, '0')}/${DateTime.now().year}';
      controllerHora.text =
          '${DateTime.now().hour.toString().padLeft(2, '0')}:${DateTime.now().minute.toString().padLeft(2, '0')}';

      controllerFechaEDAN.text =
          '${DateTime.now().day.toString().padLeft(2, '0')}/${DateTime.now().month.toString().padLeft(2, '0')}/${DateTime.now().year}';
      controllerHoraEDAN.text =
          '${DateTime.now().hour.toString().padLeft(2, '0')}:${DateTime.now().minute.toString().padLeft(2, '0')}';
    }
    scrollControllergroupInstalacionDeAlbergues = ScrollController();
    scrollControllergroupAcciones = ScrollController();
    scrollControllergroupAccionesPrioritarias = ScrollController();
    scrollControllergroupRequerimientosDeApoyo = ScrollController();
    scrollControllergroupDaniosEstablecimiendosDeSalud = ScrollController();
    scrollControllergroupDaniosAlPersonalDeSalud = ScrollController();

    print("""
          -------------------------------
          viviendas = -> ${controllerViviendasAfectadas.text}
          familias = -> ${controllerFamiliasDamnificadas.text}
          ninios = -> ${controllerHeridos.text}
          ninias = -> ${controllerFallecidos.text}
          discapacidad = -> ${controllerDesaparecidos.text}
          discapacidadm = -> ${controllerNinosVulnerables.text}
          discapacidadm = -> ${controllerNinasVulnerables.text}
          embarazadas = -> ${controllerPersonasConDiscapacidadVaron.text}
          adultoMayor = -> ${controllerPersonasConDiscapacidadMujer.text}
          adultoMayorm = -> ${controllerMujeresEmbarazadas.text}
          numAlbergues = -> ${controllerAdultosMayoresVaron.text}
          heridos = -> ${controllerAdultosMayoresMujer.text}
          muertos = -> ${controllerNroAlbergues.text}
          desaparecidos = -> ${controllerLesionados.text}
          -------------------------------
          """);
    print(widget.edanModel);

    super.initState();
  }

  List<String> listDepartamentos = [];
  List<String> listMunicipio = [];
  List<String> listHospitales = [];

  void initDB() async {
    await db.initDB();
    Future.delayed(Duration.zero, () async {
      // db.getLastIDEDAN();
      if (widget.edanModel != null) {
        controllercodEdan.text = widget.edanModel!.codEdan!.toString();
        listMunicipio = await db.getListMunicipio(controllerDepartamento.text);
        listHospitales = await db.getListEstablecimientoDeSalud(
            controllerDepartamento.text, controllerMunicipio.text);

        List<Desastreestablecimiento> listDesastreestablecimiento =
            await db.getAllDaniosEstablecimientosDeSalud(
                int.parse(controllercodEdan.text));
        List<Danospersonaldesalud> listDanospersonaldesalud = await db
            .getAllDaniosPersonalDeSalud(int.parse(controllercodEdan.text));
        List<Desastreacciones> listDesastreacciones =
            await db.getAllAcciones(int.parse(controllercodEdan.text));
        List<Desastreacciones2> listDesastreacciones2 =
            await db.getAllAcciones2(int.parse(controllercodEdan.text));
        List<Desastrerequerimientos> listDesastrerequerimientos =
            await db.getRequerimientoApoyo(int.parse(controllercodEdan.text));

        listDaniosEstablecimientosDeSalud =
            listDesastreestablecimiento.map((e) {
          _DaniosEstablecimientosDeSalud model =
              _DaniosEstablecimientosDeSalud();
          model.llenarDatos(
            controllercodEdan: e.codEdan!.toString(),
            coddesastreestablecimiento:
                e.coddesastreestablecimiento!.toString(),
            controllerSalud: e.nomestablecimiento!,
            controllerFunciona: e.funciona!,
            controllerAgua: e.tieneagua!,
            controllerAreaAfectada: e.areaAfectada!,
            listaHospitales: listHospitales,
          );
          return model;
        }).toList();
        _actualizarListaEstableciemientosDeSalud();

        listDaniosPersonalDeSalud = listDanospersonaldesalud.map((e) {
          _DaniosAlPersonalDeSalud model = _DaniosAlPersonalDeSalud();
          model.llenarDatos(
            controllercodEdan: e.codEdan!.toString(),
            controllercodpersalud: e.codpersalud!.toString(),
            controllerPersonalSalud: e.personal!,
            controllerFaleecidos: e.muertos!.toString(),
            controllerHeridos: e.heridos!.toString(),
            controllerEnfermos: e.enfermos!.toString(),
            controllerDisp: e.disponibles!.toString(),
            controllerDesaparecidos: e.desaparecidos!.toString(),
            controllerObservaciones: e.observaciones!.toString(),
          );
          return model;
        }).toList();
        print(listDaniosPersonalDeSalud);
        _actualizarListaAlPersonalDeSalud();

        listAcciones = listDesastreacciones.map((e) {
          _Acciones model = _Acciones();
          model.llenarDatos(
              controllerAccion: e.accion!,
              controllercodEdan: e.codEdan!.toString());
          return model;
        }).toList();

        _actualizarListaAcciones();

        listAccionesPrioritarias = listDesastreacciones2.map((e) {
          _AccionesPrioritarias model = _AccionesPrioritarias();
          model.llenarDatos(
            controllerAccion: e.accion!,
            controllercodEdan: e.codEdan!.toString(),
          );
          return model;
        }).toList();
        _actualizarListaAccionesPrioritarias();

        listRequerimientoApoyo = listDesastrerequerimientos.map((e) {
          _RequerimientoApoyo model = _RequerimientoApoyo();
          model.llenarDatos(
            codEdan: e.codEdan!.toString(),
            codrequerimientos: e.codrequerimientos!.toString(),
            controllerRequerimiento: e.requerimiento!,
            controllerCant: e.cantidad!.toString(),
            controllerTipo: e.observaciones!,
            controllerPrioridad: e.prioridad!,
          );
          return model;
        }).toList();
        _actualizarListaRequerimientoApoyo();
      } else {
        String data = await db.getLastIDEDAN();

        int id = int.parse(data);
        print(id);
        print(id);

        id = id + 1;
        controllercodEdan.text = id.toString();
      }
      // db.closeDB();
      listDepartamentos = await db.getListDepartamento();
      // controllerMunicipio.text = listMunicipio[0];

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          child: AppBarWidget(
            size: size,
            backActivate: true,
          ),
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
                _accionesRealizadasHastaElMomento(size),
                _accionesPrioritariasParaElControl(size),
                _accionesRequerimientosDeApoyo(size),
                _datosLlenadoDelEdan(size),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      ButtonWidget(
                        text: 'Guardar',
                        ontap: () async {
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
                                    'Debes llenar: "Medios de comunicación disponibles"');
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
                            tipoEdan: controllerTipoEDAN.text,
                            evento: controllerEvento.text,
                            claseEvento: controllerOtroEvento.text,
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
                            canal: controllerCanalDeRadiofrecuencia.text,
                            nombreEmisora:
                                controllerNombreDeLaRadioEmisora.text,
                            dialEmisora: controllerDialDeLaEmisora.text,
                            telefonoEmisora:
                                controllerTelfContactoDeLaRadioEmisora.text,
                            viviendas:
                                int.parse(controllerViviendasAfectadas.text),
                            familias:
                                int.parse(controllerFamiliasDamnificadas.text),
                            ninios: int.parse(controllerNinosVulnerables.text),
                            ninias: int.parse(controllerNinasVulnerables.text),
                            discapacidad: int.parse(
                                controllerPersonasConDiscapacidadVaron.text),
                            discapacidadm: int.parse(
                                controllerPersonasConDiscapacidadMujer.text),
                            embarazadas:
                                int.parse(controllerMujeresEmbarazadas.text),
                            adultoMayor:
                                int.parse(controllerAdultosMayoresVaron.text),
                            adultoMayorm:
                                int.parse(controllerAdultosMayoresMujer.text),
                            numAlbergues:
                                int.parse(controllerNroAlbergues.text),
                            agua: controllerServicioDeAgua.text,
                            basura: controllerServicioDeRecoleccion.text,
                            alcantarillado:
                                controllerServicioDeAlcantarilla.text,
                            electricidad: controllerServicioDeEnergia.text,
                            telecom:
                                controllerServicioDeTelecomunicaciones.text,
                            transporte: controllerServicioDeTransporte.text,
                            establecimientossalud:
                                controllerEstablecimientosDeSalud.text,
                            heridos: int.parse(controllerHeridos.text),
                            muertos: int.parse(controllerFallecidos.text),
                            desaparecidos:
                                int.parse(controllerDesaparecidos.text),
                            lesionados: int.parse(controllerLesionados.text),
                            otraOrganizacion:
                                controllerOrganizacionQueRealizeTrabajos.text,
                            sci: controllerSistemaDeComandos.text,
                            sciDonde: controllerSistemaDeComandos.text,
                            lugarLle: controllerLugarEDAN.text,
                            fechaLle: controllerFechaEDAN.text,
                            horaLle: controllerHoraEDAN.text,
                            responsableLle: controllerResponsableEDAN.text,
                            cargoLle: controllerCargoEDAN.text,
                            telfFijoLle: controllerTelfFijoEDAN.text,
                            telfCelLle: controllerTelfMovilEDAN.text,
                            email: controllerCorreoEDAN.text,
                            usuario: prefs.userCarnet,
                            fechap: '',
                            enviado: 'NO',
                          );

                          print(modelo);

                          int idDesastre = int.parse(
                              await db.getLastdesastreestablecimiento());
                          int idDaniosPersonalDeSalud =
                              int.parse(await db.getLastdanospersonaldesalud());
                          int idDesastreRequerimientos = int.parse(
                              await db.getLastdesastrerequerimientos());

                          if (widget.edanModel != null) {
                            print('------- update ');
                            db.updateEDAN(modelo);

                            listDaniosEstablecimientosDeSalud.forEach(
                                (_DaniosEstablecimientosDeSalud element) async {
                              print(
                                  '==========ID ===> ${element.coddesastreestablecimiento.text}');

                              Desastreestablecimiento modelo =
                                  Desastreestablecimiento(
                                coddesastreestablecimiento: int.parse(element
                                            .coddesastreestablecimiento.text !=
                                        ''
                                    ? element.coddesastreestablecimiento.text
                                    : '0'),
                                codEdan: int.parse(controllercodEdan.text),
                                nomestablecimiento:
                                    element.controllerSalud.text,
                                funciona: element.controllerFunciona.text,
                                tieneagua: element.controllerAgua.text,
                                areaAfectada:
                                    element.controllerAreaAfectada.text,
                              );
                              if (element.coddesastreestablecimiento.text !=
                                  '') {
                                await db.updateDaniosEstablecimientosDeSalud(
                                    modelo);
                              } else {
                                idDesastre = idDesastre + 1;
                                modelo.coddesastreestablecimiento = idDesastre;
                                await db.insertDaniosEstablecimientosDeSalud(
                                    modelo);
                              }
                            });

                            ///////////////////////////////

                            listDaniosPersonalDeSalud.forEach(
                                (_DaniosAlPersonalDeSalud element) async {
                              Danospersonaldesalud modelo =
                                  Danospersonaldesalud(
                                codpersalud: int.parse(
                                    element.controllercodpersalud.text != ''
                                        ? element.controllercodpersalud.text
                                        : '0'),
                                codEdan: int.parse(controllercodEdan.text),
                                personal: element.controllerPersonalSalud.text,
                                muertos: int.parse(
                                    element.controllerFaleecidos.text != ''
                                        ? element.controllerFaleecidos.text
                                        : '0'),
                                heridos: int.parse(
                                    element.controllerHeridos.text != ''
                                        ? element.controllerHeridos.text
                                        : '0'),
                                enfermos: int.parse(
                                    element.controllerEnfermos.text != ''
                                        ? element.controllerEnfermos.text
                                        : '0'),
                                disponibles: int.parse(
                                    element.controllerDisp.text != ''
                                        ? element.controllerDisp.text
                                        : '0'),
                                desaparecidos: int.parse(
                                    element.controllerDesaparecidos.text != ''
                                        ? element.controllerDesaparecidos.text
                                        : '0'),
                                observaciones:
                                    element.controllerObservaciones.text,
                              );

                              if (element.controllercodpersalud.text != '') {
                                await db.updateDaniosPersonalDeSalud(modelo);
                              } else {
                                idDaniosPersonalDeSalud =
                                    idDaniosPersonalDeSalud + 1;
                                modelo.codpersalud = idDaniosPersonalDeSalud;
                                await db.insertDaniosPersonalDeSalud(modelo);
                              }
                            });
                            print(listDaniosPersonalDeSalud);

                            ///////////////////////////////
                            // listAcciones.forEach((_Acciones element) async {
                            //   Desastreacciones modelo = Desastreacciones(
                            //     codEdan: int.parse(controllercodEdan.text),
                            //     accion: element.controllerAccion.text,
                            //   );
                            //   await db.insertlistAcciones(modelo);
                            // });
                            // ///////////////////////////////
                            // listAccionesPrioritarias
                            //     .forEach((_AccionesPrioritarias element) async {
                            //   Desastreacciones2 modelo = Desastreacciones2(
                            //     codEdan: int.parse(controllercodEdan.text),
                            //     accion: element.controllerAccion.text,
                            //   );
                            //   await db.insertlistAcciones2(modelo);
                            // });

                            //////////////////////////////////////////////
                            ///
                            listRequerimientoApoyo
                                .forEach((_RequerimientoApoyo element) async {
                              Desastrerequerimientos modelo =
                                  Desastrerequerimientos(
                                codrequerimientos: int.parse(
                                    element.codrequerimientos.text != ''
                                        ? element.codrequerimientos.text
                                        : '0'),
                                codEdan: int.parse(controllercodEdan.text),
                                requerimiento:
                                    element.controllerRequerimiento.text,
                                cantidad: int.parse(
                                    element.controllerCant.text != ''
                                        ? element.controllerCant.text
                                        : '0'),
                                prioridad: element.controllerPrioridad.text,
                                observaciones: element.controllerTipo.text,
                              );

                              if (element.codrequerimientos.text != '') {
                                await db.updateDesastrerequerimientos(modelo);
                              } else {
                                idDesastreRequerimientos =
                                    idDesastreRequerimientos + 1;
                                modelo.codrequerimientos =
                                    idDesastreRequerimientos;
                                await db.insertDesastrerequerimientos(modelo);
                              }
                            });
                            //////////////////////////////
                          } else {
                            print('------- insert ');
                            db.insertEDAN(modelo);

                            listDaniosEstablecimientosDeSalud.forEach(
                                (_DaniosEstablecimientosDeSalud element) async {
                              idDesastre = idDesastre + 1;
                              print('####=====> $idDesastre');
                              Desastreestablecimiento modelo =
                                  Desastreestablecimiento(
                                coddesastreestablecimiento: idDesastre,
                                codEdan: int.parse(controllercodEdan.text),
                                nomestablecimiento:
                                    element.controllerSalud.text,
                                funciona: element.controllerFunciona.text,
                                tieneagua: element.controllerAgua.text,
                                areaAfectada:
                                    element.controllerAreaAfectada.text,
                              );
                              await db
                                  .insertDaniosEstablecimientosDeSalud(modelo);
                            });
                            listDaniosPersonalDeSalud.forEach(
                                (_DaniosAlPersonalDeSalud element) async {
                              idDaniosPersonalDeSalud =
                                  idDaniosPersonalDeSalud + 1;
                              Danospersonaldesalud modelo =
                                  Danospersonaldesalud(
                                codpersalud: idDaniosPersonalDeSalud,
                                codEdan: int.parse(controllercodEdan.text),
                                personal: element.controllerPersonalSalud.text,
                                muertos: int.parse(
                                    element.controllerFaleecidos.text != ''
                                        ? element.controllerFaleecidos.text
                                        : '0'),
                                heridos: int.parse(
                                    element.controllerHeridos.text != ''
                                        ? element.controllerHeridos.text
                                        : '0'),
                                enfermos: int.parse(
                                    element.controllerEnfermos.text != ''
                                        ? element.controllerEnfermos.text
                                        : '0'),
                                disponibles: int.parse(
                                    element.controllerDisp.text != ''
                                        ? element.controllerDisp.text
                                        : '0'),
                                desaparecidos: int.parse(
                                    element.controllerDesaparecidos.text != ''
                                        ? element.controllerDesaparecidos.text
                                        : '0'),
                                observaciones:
                                    element.controllerObservaciones.text,
                              );

                              await db.insertDaniosPersonalDeSalud(modelo);
                            });
                            print(listDaniosPersonalDeSalud);

                            listAcciones.forEach((_Acciones element) async {
                              Desastreacciones modelo = Desastreacciones(
                                codEdan: int.parse(controllercodEdan.text),
                                accion: element.controllerAccion.text,
                              );
                              await db.insertlistAcciones(modelo);
                            });
                            listAccionesPrioritarias
                                .forEach((_AccionesPrioritarias element) async {
                              Desastreacciones2 modelo = Desastreacciones2(
                                codEdan: int.parse(controllercodEdan.text),
                                accion: element.controllerAccion.text,
                              );
                              await db.insertlistAcciones2(modelo);
                            });
                            listRequerimientoApoyo
                                .forEach((_RequerimientoApoyo element) async {
                              idDesastreRequerimientos =
                                  idDesastreRequerimientos + 1;
                              Desastrerequerimientos modelo =
                                  Desastrerequerimientos(
                                codrequerimientos: idDesastreRequerimientos,
                                codEdan: int.parse(controllercodEdan.text),
                                requerimiento:
                                    element.controllerRequerimiento.text,
                                cantidad:
                                    int.parse(element.controllerCant.text),
                                prioridad: element.controllerPrioridad.text,
                                observaciones: element.controllerTipo.text,
                              );
                              await db.insertDesastrerequerimientos(modelo);
                            });
                            print(listRequerimientoApoyo);
                          }

                          edanProvider.readDataBaseListEdans();
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

  Widget _subTitle(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      child: SelectableText(
        text,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _datosGenerales(Size size) {
    print(' ________ _datosGenerales _________ ${controllerTelefonoFijo.text}');
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
              title: 'Tipo de EDAN',
              controller: controllerTipoEDAN,
              onselect: () {},
              isRequired: true,
              options: const [
                '8 horas',
                '72 horas',
              ],
            ),
            _subTitle('1.1 TIPO DE EVENTO'),
            InputListOption(
              title: 'Evento',
              controller: controllerEvento,
              onselect: () {
                setState(() {
                  print(controllerEvento.text);
                });
              },
              isRequired: true,
              options: const [
                'Accidentes por prod. y sust. peligrosas',
                'Convulsión social',
                'Covid 20',
                'Deslizamiento',
                'Desporde de rio(inund. rapida)',
                'Granizada',
                'Helada',
                'Incendio',
                'Inundación lenta',
                'Mazamorra',
                'Nevada',
                'Otros',
                'Plagas',
                'Riada',
                'Sequia',
                'Sismo (temblor, terremoto)',
              ],
            ),
            if (controllerEvento.text == 'Otros')
              InputExpanded(
                title: 'Otro Evento',
                controller: controllerOtroEvento,
              ),
            _subTitle('1.2 FECHA Y HORA DE LA OCURRENCIA'),
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
            _subTitle('1.3 PERSONA DE CONTACTO DE LA ZONA AFECTADA'),
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
                controller: controllerTelefonoFijo,
                initValue: controllerTelefonoFijo.text,
                isNumber: true),
            InputExpanded(
              title: 'Telefono movil de contacto',
              controller: controllerTelefonoMovil,
              isNumber: true,
              initValue: controllerTelefonoMovil.text,
              isRequired: true,
            ),
            _subTitle('1.4 UBICACIÓN GEOGRÁFICA DE LA ZONA AFECTADA'),
            InputListOption(
              title: 'Departamento',
              controller: controllerDepartamento,
              options: listDepartamentos,
              isRequired: true,
              onselect: () async {
                print(' ====> ${controllerDepartamento.text}');
                listMunicipio =
                    await db.getListMunicipio(controllerDepartamento.text);
                // controllerMunicipio.text = listMunicipio[0];
                print('## ${controllerMunicipio.text}');

                setState(() {});
              },
            ),
            InputListOption(
              title: 'Municipio',
              options: listMunicipio,
              controller: controllerMunicipio,
              isRequired: true,
              onselect: () async {
                print('# ${controllerMunicipio.text}');
                listHospitales = await db.getListEstablecimientoDeSalud(
                    controllerDepartamento.text, controllerMunicipio.text);
                setState(() {});
              },
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
              onselect: () {
                print(controllerTieneCoordenadas.text);
                setState(() {});
              },
            ),
            if (controllerTieneCoordenadas.text == 'Si')
              ..._getCoordinatesWidget(),
            _subTitle('1.5 VIAS DE ACCESO DISPONIBLES A LA ZONA AFECTADA'),
            InputListBoolean(
              title: 'Via aerea disponible',
              controller: controllerViaAerea,
              options: const [
                'Sin Daño',
                'Afectado',
                'Destruido',
                'Es Transitable',
                'No existe',
              ],
            ),
            InputListBoolean(
              title: 'Via terrestre disponible',
              controller: controllerViaTerrestre,
              options: const [
                'Sin Daño',
                'Afectado',
                'Destruido',
                'Es Transitable',
                'No existe',
              ],
            ),
            InputListBoolean(
              title: 'Via fluvial disponible',
              controller: controllerViaFluvial,
              options: const [
                'Sin Daño',
                'Afectado',
                'Destruido',
                'Es Transitable',
                'No existe',
              ],
            ),
            InputListBoolean(
              title: 'Via ferroviaria disponible',
              controller: controllerViaFerroviaria,
              options: const [
                'Sin Daño',
                'Afectado',
                'Destruido',
                'Es Transitable',
                'No existe',
              ],
            ),

            InputExpanded(
              title: 'Para llegar al lugar se parte de (lugar):',
              controller: controllerParaLlegar,
            ),
            InputExpanded(
                title: 'Tiempo de llegada al lugar (en horas y minutos)',
                controller: controllerTiempoLlegada),

            InputListSelectedCheck(
              title: 'Condicion climatica actual',
              controller: controllerCondicionClimatica,
              options: const [
                'Lluvioso',
                'Nublado',
                'Con viento',
                'Despejado',
              ],
            ),

            _subTitle('1.6 MEDIOS DE COMUNICACIÓN'),
            InputListSelectedCheck(
              title: 'Medios de comunicación disponibles',
              controller: controllerMediosDeComunicacion,
              options: const [
                'Radio frecuencia 20/40 m',
                'Telefono fijo',
                'Telefono movil',
                'Television',
                'Internet',
                'Radio emisora'
              ],
            ),
            InputExpanded(
              title: 'Canal de Radio Frecuencia:',
              controller: controllerCanalDeRadiofrecuencia,
            ),
            InputExpanded(
              title: 'Nombre de la Radio Emisora:',
              controller: controllerNombreDeLaRadioEmisora,
            ),
            InputExpanded(
              title: 'Dial de la Radio Emisora:',
              controller: controllerDialDeLaEmisora,
            ),
            InputExpanded(
              title: 'Telefono de Contacto de la Radio Emisora:',
              controller: controllerTelfContactoDeLaRadioEmisora,
              initValue: controllerTelfContactoDeLaRadioEmisora.text,
              isNumber: true,
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

  List<Widget> _getCoordinatesWidget() {
    return [
      Material(
        child: InkWell(
          onTap: () async {
            Position? position = await _getMyLocation();
            if (position != null) {
              controllerCoordenadaX.text = position.latitude.toString();
              controllerCoordenadaY.text = position.longitude.toString();
              setState(() {});
            } else {
              CoolAlert.show(
                  context: context,
                  type: CoolAlertType.error,
                  text:
                      'No pudimos obtener las coordenadas de tu dispositivo, por favor revisa los permisos de la aplicacion');
            }
          },
          child: Ink(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(10),
              border: Border.all(),
            ),
            child: Text('Obtener las coordenadas del dispositivo'),
          ),
        ),
      ),
      InputExpanded(
        title: 'Coordenada UTM X',
        controller: controllerCoordenadaX,
      ),
      InputExpanded(
        title: 'Coordenada UTM Y',
        controller: controllerCoordenadaY,
      ),
      const SizedBox(height: 15),
    ];
  }

  Future<Position?> _getMyLocation() async {
    Position? localPosition = await getLocationCoordinates();
    return localPosition;
  }

  Widget _daniosGenerales(Size size) {
    print(
        '########## MUESTRAO #### >>>> ${controllerMujeresEmbarazadas.text} <<<<<');

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
              title: '2.1 Cant. viviendas afectadas',
              controller: controllerViviendasAfectadas,
              isRequired: true,
              initValue: controllerViviendasAfectadas.text,
              isNumber: true,
            ),
            InputExpanded(
              title: '2.2 Cant. Flias. damnificadas',
              controller: controllerFamiliasDamnificadas,
              isRequired: true,
              isNumber: true,
              initValue: controllerFamiliasDamnificadas.text,
            ),

            InputExpanded(
              title: '2.3 Cant. Niños',
              controller: controllerNinosVulnerables,
              isRequired: true,
              isNumber: true,
              initValue: controllerNinosVulnerables.text,
            ),
            InputExpanded(
              title: 'Cant. Niñas',
              controller: controllerNinasVulnerables,
              isRequired: true,
              isNumber: true,
              initValue: controllerNinasVulnerables.text,
            ),

            InputExpanded(
              title: '2.4 Cant. Personas con Discapacidad Varon',
              controller: controllerPersonasConDiscapacidadVaron,
              isRequired: true,
              isNumber: true,
              initValue: controllerPersonasConDiscapacidadVaron.text,
            ),
            InputExpanded(
              title: 'Cant. Personas con Discapacidad Mujer',
              controller: controllerPersonasConDiscapacidadMujer,
              isRequired: true,
              isNumber: true,
              initValue: controllerPersonasConDiscapacidadMujer.text,
            ),
            InputExpanded(
              title: '2.5 Cant. Mujeres Embarazadas',
              isNumber: true,
              controller: controllerMujeresEmbarazadas,
              isRequired: true,
              initValue: controllerMujeresEmbarazadas.text,
            ),
            InputExpanded(
              title: '2.6 Cant. Adultos Mayores Varon',
              controller: controllerAdultosMayoresVaron,
              isRequired: true,
              isNumber: true,
              initValue: controllerAdultosMayoresVaron.text,
            ),
            InputExpanded(
              title: 'Cant. Adultos Mayores Mujer',
              controller: controllerAdultosMayoresMujer,
              isNumber: true,
              isRequired: true,
              initValue: controllerAdultosMayoresMujer.text,
            ),
            InputExpanded(
              title: '2.7 Numero de Albergues',
              controller: controllerNroAlbergues,
              isRequired: true,
              isNumber: true,
              initValue: controllerNroAlbergues.text,
            ),
            _subTitle(
                '2.8 SERVICIOS AFECTADOS DE LA ZONA AFECTADA Y/O POBLACIÓN'),

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

            InputListBoolean(
              title: 'Establecimientos de Salud',
              controller: controllerEstablecimientosDeSalud,
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
              title: '3.1 Cant. Heridos',
              controller: controllerHeridos,
              isRequired: true,
              isNumber: true,
              initValue: controllerHeridos.text,
            ),
            InputExpanded(
              title: '3.2 Cant. Fallecidos',
              controller: controllerFallecidos,
              isNumber: true,
              isRequired: true,
              initValue: controllerFallecidos.text,
            ),
            InputExpanded(
              title: '3.3 Cant. Desaparecidos',
              controller: controllerDesaparecidos,
              isNumber: true,
              initValue: controllerDesaparecidos.text,
              isRequired: true,
            ),
            // InputExpanded(
            //   title: '3.4 Cant. Lesionados',
            //   controller: controllerLesionados,
            //   isNumber: true,
            //   initValue: controllerLesionados.text,
            // ),
            ExpansionTile(
              initiallyExpanded: true,
              title: const TitleExpansion(
                  texto: '3.4 Daños a establecimientos de salud'),
              children: [_groupDaniosEstablecimiendosDeSalud(size)],
            ),
            ExpansionTile(
              initiallyExpanded: true,
              title:
                  const TitleExpansion(texto: '3.5 Daños al personal de salud'),
              children: [_groupDaniosAlPersonalDeSalud(size)],
            )
          ],
        ),
        const Divider()
      ],
    );
  }

  Widget _accionesRealizadasHastaElMomento(Size size) {
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
              texto: '4.- ACCIONES REALIZADAS HASTA EL MOMENTO'),
          children: <Widget>[
            ExpansionTile(
              initiallyExpanded: true,
              title: const TitleExpansion(
                  texto: 'Acciones Realizadas hasta el Momento'),
              children: [_groupAcciones(size)],
            ),
            InputExpanded(
              title: 'Existe otra Organización que Realiza Trabajos',
              controller: controllerOrganizacionQueRealizeTrabajos,
            ),

            InputListBoolean(
              title:
                  'Se ha Instalado un Sistema de Comando de Incidentes - SCI',
              controller: controllerSistemaDeComandos,
              options: const ['Si', 'No'],
            ),
            // ExpansionTile(
            //   title: const TitleExpansion(
            //       texto:
            //           'Daños al personal de salud'),
            //   children: [_groupDaniosAlPersonalDeSalud(size)],
            // )
          ],
        ),
        const Divider()
      ],
    );
  }

  Widget _accionesPrioritariasParaElControl(Size size) {
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
                  '5.- ACCIONES PRIORITARIAS PARA EL CONTROL DE LA SITUACIÓN Y ATENCIÓN DE LA SALUD'),
          children: <Widget>[
            ExpansionTile(
              initiallyExpanded: true,
              title: const TitleExpansion(
                  texto:
                      'Acciones Prioritarias para el Control de la Situación y Atención de la Salud'),
              children: [_groupAccionesPrioritarias(size)],
            ),
          ],
        ),
        const Divider()
      ],
    );
  }

  Widget _accionesRequerimientosDeApoyo(Size size) {
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
                  '6.- REQUERIMIENTOS DE APOYO PARA LA EJECUCIÓN DE ACCIONES PRIORITARIAS'),
          children: <Widget>[
            ExpansionTile(
              initiallyExpanded: true,
              title: const TitleExpansion(
                  texto:
                      'Requerimiento de apoyo para la ejecución de acciones prioritarias'),
              children: [_groupRequerimientosDeApoyo(size)],
            ),
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
              initValue: controllerResponsableEDAN.text,
            ),
            InputExpanded(
              title: 'Cargo',
              controller: controllerCargoEDAN,
            ),
            InputExpanded(
              title: 'Telf. fijo',
              controller: controllerTelfFijoEDAN,
              isNumber: true,
              initValue: controllerTelfFijoEDAN.text,
            ),
            InputExpanded(
              title: 'Telf. movil',
              controller: controllerTelfMovilEDAN,
              initValue: controllerTelfMovilEDAN.text,
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
            buttonPlus(
              onTap: () async {
                _DaniosEstablecimientosDeSalud _demo =
                    _DaniosEstablecimientosDeSalud();
                _demo.actualizarListaHospitales(listHospitales);

                print(_demo.listaHospitales);

                listDaniosEstablecimientosDeSalud.add(_demo);
                await _actualizarListaEstableciemientosDeSalud();
              },
            ),
          ], titles: const [
            'Estab. de Salud',
            'Funciona',
            'Tiene agua',
            'Area afectada'
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
                  flex: 2,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.lightBlue.shade100),
                    ),
                    child: Center(
                      child: SubListInputListOption(
                        controller: demo.controllerSalud,
                        options: demo.listaHospitales,
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
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.lightBlue.shade100),
                    ),
                    child: InputTextFielfDescriptionWidget(
                      controller: demo.controllerAreaAfectada,
                      hint: 'Area afectada',
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
          width: size.width > 700 ? size.width - 20 : 700,
          // constraints: BoxConstraints(minWidth: 600),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.lightBlue),
          ),
          child: GroupDaniosPersonalDeSalud(listWidgets: [
            ...listDaniosPersonalDeSaludWidget,
            buttonPlus(
              onTap: () async {
                listDaniosPersonalDeSalud.add(_DaniosAlPersonalDeSalud());
                await _actualizarListaAlPersonalDeSalud();
              },
            ),
          ], titles: const [
            'Pers. de Salud',
            'Fallec.',
            'Heri.',
            'Enfermos',
            'Disp.',
            'Desap.',
            'Observaciones'
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
                  flex: 8,
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
                          'Otros profesionales en salud',
                          'tecnicos',
                          'Personal Administrativo'
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
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
                  flex: 4,
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
                  flex: 4,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.lightBlue.shade100),
                    ),
                    child: SublistInputExpanded(
                      controller: demo.controllerEnfermos,
                      isNumber: true,
                      hint: '0',
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
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
                  flex: 4,
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
                  flex: 8,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.lightBlue.shade100),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InputTextFielfDescriptionWidget(
                        controller: demo.controllerObservaciones,
                        hint: 'Observacion',
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

  // /////////////////////////////////////////////////////////
  // /////////////////////////////////////////////////////////
  // /////////////////////////////////////////////////////////
  // Widget _groupInstalacionDeAlbergues(Size size) {
  //   return Scrollbar(
  //     isAlwaysShown: true,
  //     showTrackOnHover: true,
  //     controller: scrollControllergroupInstalacionDeAlbergues,
  //     child: SingleChildScrollView(
  //       scrollDirection: Axis.horizontal,
  //       child: Container(
  //         width: size.width > 600 ? size.width - 20 : 600,
  //         margin: const EdgeInsets.all(10),
  //         decoration: BoxDecoration(
  //           border: Border.all(color: Colors.lightBlue),
  //         ),
  //         child: GroupInstalacionDeAlbergues(listWidgets: [
  //           ...listInstalacionDeAlberguesWidget,
  //           Material(
  //             color: Colors.grey.shade100,
  //             child: InkWell(
  //               onTap: () async {
  //                 listInstalacionDeAlbergues.add(_InstalacionAlbergues());
  //                 await _actualizarListaInstalacionAlbergues();
  //               },
  //               child: Container(
  //                 decoration: BoxDecoration(
  //                   border: Border.all(color: Colors.blueGrey.shade200),
  //                   borderRadius: BorderRadius.circular(5),
  //                 ),
  //                 padding: const EdgeInsets.all(10),
  //                 child: const Icon(Icons.add),
  //               ),
  //             ),
  //           ),
  //         ], titles: const [
  //           'Cant. albergues',
  //           'Lugar de albergues',
  //         ]),
  //       ),
  //     ),
  //   );
  // }

  /////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////
  Widget _groupAcciones(Size size) {
    return Scrollbar(
      isAlwaysShown: true,
      showTrackOnHover: true,
      controller: scrollControllergroupAcciones,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          width: size.width - 20,
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.lightBlue),
          ),
          child: GroupAcciones(listWidgets: [
            ...listAccionesWidget,
            buttonPlus(onTap: () async {
              listAcciones.add(_Acciones());
              await _actualizarListaAcciones();
            })
          ], titles: const [
            'Acción',
          ]),
        ),
      ),
    );
  }

  /////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////
  Widget _groupAccionesPrioritarias(Size size) {
    return Scrollbar(
      isAlwaysShown: true,
      showTrackOnHover: true,
      controller: scrollControllergroupAccionesPrioritarias,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          width: size.width - 20,
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.lightBlue),
          ),
          child: GroupAcciones(listWidgets: [
            ...listAccionesPrioritariasWidget,
            buttonPlus(onTap: () async {
              listAccionesPrioritarias.add(_AccionesPrioritarias());
              await _actualizarListaAccionesPrioritarias();
            })
          ], titles: const [
            'Acción',
          ]),
        ),
      ),
    );
  }

  /////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////
  Widget _groupRequerimientosDeApoyo(Size size) {
    return Scrollbar(
      isAlwaysShown: true,
      showTrackOnHover: true,
      controller: scrollControllergroupRequerimientosDeApoyo,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          width: size.width > 600 ? size.width - 20 : 600,
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.lightBlue),
          ),
          child: GroupRequerimientosApoyo(listWidgets: [
            ...listRequerimientoApoyoWidget,
            buttonPlus(onTap: () async {
              listRequerimientoApoyo.add(_RequerimientoApoyo());
              await _actualizarListaRequerimientoApoyo();
            })
          ], titles: const [
            'Requerimiento',
            'Cant.',
            'Tipo',
            'Prioridad',
          ]),
        ),
      ),
    );
  }

  // Future<void> _actualizarListaInstalacionAlbergues() async {
  //   listInstalacionDeAlberguesWidget = [];
  //   int i = 0;
  //   Future.delayed(Duration.zero, () {
  //     listInstalacionDeAlberguesWidget = listInstalacionDeAlbergues.map((demo) {
  //       i++;
  //       return Container(
  //         color: i % 2 == 0 ? Colors.blue[50] : Colors.white,
  //         child: IntrinsicHeight(
  //           child: Row(
  //             crossAxisAlignment: CrossAxisAlignment.stretch,
  //             children: [
  //               Expanded(
  //                 flex: 2,
  //                 child: Container(
  //                   decoration: BoxDecoration(
  //                     border: Border.all(color: Colors.lightBlue.shade100),
  //                   ),
  //                   child: SublistInputExpanded(
  //                     controller: demo.controllerCantidad,
  //                     isNumber: true,
  //                     hint: '0',
  //                   ),
  //                 ),
  //               ),
  //               Expanded(
  //                 flex: 3,
  //                 child: Container(
  //                   decoration: BoxDecoration(
  //                     border: Border.all(color: Colors.lightBlue.shade100),
  //                   ),
  //                   child: SublistInputExpanded(
  //                     controller: demo.controllerLugarDeAlbergue,
  //                     hint: 'Lugar de albergues',
  //                   ),
  //                 ),
  //               ),
  //               Expanded(
  //                 flex: 1,
  //                 child: Container(
  //                   decoration: BoxDecoration(
  //                     border: Border.all(color: Colors.lightBlue.shade100),
  //                   ),
  //                   child: IconButton(
  //                     onPressed: () {
  //                       listInstalacionDeAlbergues.remove(demo);
  //                       _actualizarListaInstalacionAlbergues();
  //                       setState(() {});
  //                     },
  //                     icon: const Icon(Icons.remove_circle_outlined),
  //                   ),
  //                 ),
  //               )
  //             ],
  //           ),
  //         ),
  //       );
  //     }).toList();
  //     setState(() {});
  //   });
  // }
  /////////////////////////////////

  Future<void> _actualizarListaAcciones() async {
    listAccionesWidget = [];
    int i = 0;
    Future.delayed(Duration.zero, () {
      listAccionesWidget = listAcciones.map((demo) {
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
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.lightBlue.shade100),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InputTextFielfDescriptionWidget(
                        controller: demo.controllerAccion,
                        hint: 'Acción',
                      ),
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
                        listAcciones.remove(demo);
                        _actualizarListaAcciones();
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

  Future<void> _actualizarListaAccionesPrioritarias() async {
    listAccionesPrioritariasWidget = [];
    int i = 0;
    Future.delayed(Duration.zero, () {
      listAccionesPrioritariasWidget = listAccionesPrioritarias.map((demo) {
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
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.lightBlue.shade100),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InputTextFielfDescriptionWidget(
                        controller: demo.controllerAccion,
                        hint: 'Acción',
                      ),
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
                        listAccionesPrioritarias.remove(demo);
                        _actualizarListaAccionesPrioritarias();
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

  Future<void> _actualizarListaRequerimientoApoyo() async {
    listRequerimientoApoyoWidget = [];
    int i = 0;
    Future.delayed(Duration.zero, () {
      listRequerimientoApoyoWidget = listRequerimientoApoyo.map((demo) {
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
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.lightBlue.shade100),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SubListInputListOption(
                        controller: demo.controllerRequerimiento,
                        options: const [
                          'Medicamentos e insumos médicos',
                          'Agua y saneamiento ambiental',
                          'Productos químicos (plaguicidas e insecticidas)',
                          'Alimentos y bebidas',
                          'Albergue vivienda electricidad construcción',
                          'Necesidades personales',
                          'Recursos humanos',
                          'Equipamiento médico',
                          'Carpa para consultorio ambulante',
                          'Combustibles y lubricantes',
                          'Material eléctrico',
                          'Generadores eléctricos',
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
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InputTextFielfWidget(
                        controller: demo.controllerCant,
                        hint: '0',
                        isNumber: true,
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
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InputTextFielfDescriptionWidget(
                        controller: demo.controllerTipo,
                        hint: 'Tipo',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.lightBlue.shade100),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SubListInputListBoolean(
                        controller: demo.controllerPrioridad,
                        options: const ['Alta', 'Media', 'Baja'],
                      ),
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
                        listRequerimientoApoyo.remove(demo);
                        _actualizarListaRequerimientoApoyo();
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

Future<Position?> getLocationCoordinates() async {
  // Verificar si tienes permiso de ubicación
  PermissionStatus permissionStatus = await Permission.location.status;
  if (permissionStatus.isGranted) {
    // Ya tienes permiso para acceder a la ubicación, obtén las coordenadas
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.medium,
        forceAndroidLocationManager: true,
      );
      return position;
    } catch (e) {
      // Error al obtener las coordenadas
      print('Error al obtener las coordenadas: $e');
      return null;
    }
  } else {
    // No tienes permiso de ubicación, solicita permiso al usuario
    await Permission.location.request();
    // Verifica si el usuario otorgó permiso después de la solicitud
    if (await Permission.location.isGranted) {
      // El usuario otorgó permiso, obtén las coordenadas
      try {
        Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );
        return position;
      } catch (e) {
        // Error al obtener las coordenadas
        print('Error al obtener las coordenadas: $e');
        return null;
      }
    } else {
      // El usuario denegó el permiso, devuelve null
      return null;
    }
  }
}

class _DaniosEstablecimientosDeSalud {
  TextEditingController coddesastreestablecimiento = TextEditingController();
  TextEditingController controllercodEdan = TextEditingController();
  TextEditingController controllerSalud = TextEditingController();
  TextEditingController controllerFunciona = TextEditingController();
  TextEditingController controllerAgua = TextEditingController();
  TextEditingController controllerAreaAfectada = TextEditingController();
  List<String> listaHospitales = [];

  actualizarListaHospitales(List<String> list) {
    this.listaHospitales = list;
  }

  _DaniosEstablecimientosDeSalud();
  llenarDatos({
    required String coddesastreestablecimiento,
    required String controllercodEdan,
    required String controllerSalud,
    required String controllerFunciona,
    required String controllerAgua,
    required String controllerAreaAfectada,
    required List<String> listaHospitales,
  }) {
    this.coddesastreestablecimiento.text = coddesastreestablecimiento;
    this.controllercodEdan.text = controllercodEdan;
    this.controllerSalud.text = controllerSalud;
    this.controllerFunciona.text = controllerFunciona;
    this.controllerAgua.text = controllerAgua;
    this.controllerAreaAfectada.text = controllerAreaAfectada;
    this.listaHospitales = listaHospitales;
  }
}

class _DaniosAlPersonalDeSalud {
  TextEditingController controllercodpersalud = TextEditingController();
  TextEditingController controllercodEdan = TextEditingController();
  TextEditingController controllerPersonalSalud = TextEditingController();
  TextEditingController controllerFaleecidos = TextEditingController();
  TextEditingController controllerHeridos = TextEditingController();
  TextEditingController controllerEnfermos = TextEditingController();
  TextEditingController controllerDisp = TextEditingController();
  TextEditingController controllerDesaparecidos = TextEditingController();
  TextEditingController controllerObservaciones = TextEditingController();

  _DaniosAlPersonalDeSalud();
  llenarDatos({
    required String controllercodpersalud,
    required String controllercodEdan,
    required String controllerPersonalSalud,
    required String controllerFaleecidos,
    required String controllerHeridos,
    required String controllerEnfermos,
    required String controllerDisp,
    required String controllerDesaparecidos,
    required String controllerObservaciones,
  }) {
    this.controllercodpersalud.text = controllercodpersalud;
    this.controllercodEdan.text = controllercodEdan;
    this.controllerPersonalSalud.text = controllerPersonalSalud;
    this.controllerFaleecidos.text = controllerFaleecidos;
    this.controllerHeridos.text = controllerHeridos;
    this.controllerEnfermos.text = controllerEnfermos;
    this.controllerDisp.text = controllerDisp;
    this.controllerDesaparecidos.text = controllerDesaparecidos;
    this.controllerObservaciones.text = controllerObservaciones;
  }
}

// class _InstalacionAlbergues {
//   TextEditingController controllerCantidad = TextEditingController();
//   TextEditingController controllerLugarDeAlbergue = TextEditingController();

//   _InstalacionAlbergues();
//   llenarDatos({
//     required String controllerCantidad,
//     required String controllerLugarDeAlbergue,
//   }) {
//     this.controllerCantidad.text = controllerCantidad;
//     this.controllerLugarDeAlbergue.text = controllerLugarDeAlbergue;
//   }
// }

class _Acciones {
  TextEditingController controllercodEdan = TextEditingController();
  TextEditingController controllerAccion = TextEditingController();

  _Acciones();
  llenarDatos({
    required String controllercodEdan,
    required String controllerAccion,
  }) {
    this.controllercodEdan.text = controllercodEdan;
    this.controllerAccion.text = controllerAccion;
  }
}

class _AccionesPrioritarias {
  TextEditingController controllercodEdan = TextEditingController();
  TextEditingController controllerAccion = TextEditingController();

  _AccionesPrioritarias();
  llenarDatos({
    required String controllercodEdan,
    required String controllerAccion,
  }) {
    this.controllercodEdan.text = controllercodEdan;
    this.controllerAccion.text = controllerAccion;
  }
}

class _RequerimientoApoyo {
  TextEditingController codrequerimientos = TextEditingController();
  TextEditingController codEdan = TextEditingController();
  TextEditingController controllerRequerimiento = TextEditingController();
  TextEditingController controllerCant = TextEditingController();
  TextEditingController controllerTipo = TextEditingController();
  TextEditingController controllerPrioridad = TextEditingController();

  _RequerimientoApoyo();
  llenarDatos({
    required String codrequerimientos,
    required String codEdan,
    required String controllerRequerimiento,
    required String controllerCant,
    required String controllerTipo,
    required String controllerPrioridad,
  }) {
    this.codrequerimientos.text = codrequerimientos;
    this.codEdan.text = codEdan;
    this.controllerRequerimiento.text = controllerRequerimiento;
    this.controllerCant.text = controllerCant;
    this.controllerTipo.text = controllerTipo;
    this.controllerPrioridad.text = controllerPrioridad;
  }
}
