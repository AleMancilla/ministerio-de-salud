import 'package:flutter/material.dart';
import 'package:ministerio_de_salud/pages/widgets/group/app_bar_widget.dart';
import 'package:ministerio_de_salud/pages/widgets/group/body_app_bar.dart';
import 'package:ministerio_de_salud/pages/widgets/unit/input_date_option.dart';
import 'package:ministerio_de_salud/pages/widgets/unit/input_expanded.dart';
import 'package:ministerio_de_salud/pages/widgets/unit/input_hour_option.dart';
import 'package:ministerio_de_salud/pages/widgets/unit/input_list_option.dart';

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

  @override
  void initState() {
    controllerFecha.text =
        '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}';
    controllerHora.text = '${DateTime.now().hour}:${DateTime.now().minute}';
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
}
