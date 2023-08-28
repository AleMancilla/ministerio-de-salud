import 'package:easy_dialog/easy_dialog.dart';
import 'package:flutter/material.dart';
import 'package:ministerio_de_salud/bussiness/database/database.dart';
import 'package:ministerio_de_salud/bussiness/models.dart/model_desastre_establecimiento.dart';
import 'package:ministerio_de_salud/bussiness/models.dart/model_detalle_de_planilla.dart';
import 'package:ministerio_de_salud/bussiness/models.dart/model_lista_sintomas.dart';
import 'package:ministerio_de_salud/bussiness/models.dart/model_planilla_atencion.dart';
import 'package:ministerio_de_salud/bussiness/models.dart/modelo_planilla_detalle.dart';
import 'package:ministerio_de_salud/bussiness/providers/planillas_no_enviadas_provider.dart';
import 'package:ministerio_de_salud/pages/widgets/group/app_bar_widget.dart';
import 'package:ministerio_de_salud/pages/widgets/group/body_app_bar.dart';
import 'package:ministerio_de_salud/pages/widgets/group/group_detalle_planilla.dart';
import 'package:ministerio_de_salud/pages/widgets/unit/button_widget.dart';
import 'package:ministerio_de_salud/pages/widgets/unit/input_date_option.dart';
import 'package:ministerio_de_salud/pages/widgets/unit/input_expanded.dart';
import 'package:ministerio_de_salud/pages/widgets/unit/input_hour_option.dart';
import 'package:ministerio_de_salud/pages/widgets/unit/input_list_option.dart';
import 'package:ministerio_de_salud/utils/user_preferens.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';

class PagePlanillaAtencion extends StatefulWidget {
  PagePlanillaAtencion({Key? key, this.planillaDeAtencionFather})
      : super(key: key);
  ModelPlanillaDeAtencion? planillaDeAtencionFather;

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
  TextEditingController controllerCodPlanilla = TextEditingController();

  int number = 0;
  DataBaseEdans db = DataBaseEdans();
  UserPreferences prefs = UserPreferences();
  late PlanillasNoEnviadasProvider planillasNoEnviadasProvider;

  List<String> listDepartamentos = [];
  List<String> listMunicipio = [];
  List<String> listHospitales = [];

  @override
  void initState() {
    listOfDetallesDePlanilla = [];
    initDB();
    if (widget.planillaDeAtencionFather == null) {
      controllerFecha.text =
          '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}';
      controllerHora.text = '${DateTime.now().hour}:${DateTime.now().minute}';
      planillasNoEnviadasProvider =
          Provider.of<PlanillasNoEnviadasProvider>(context, listen: false);
      planillasNoEnviadasProvider.listDetalleDePlanilla.clear();
    } else {
      controllerCodPlanilla.text =
          (widget.planillaDeAtencionFather?.codPlanilla.toString() ?? '');
      controllerEvento.text = (widget.planillaDeAtencionFather?.evento ?? '');
      controllerDepartamento.text =
          (widget.planillaDeAtencionFather?.depto ?? '');
      controllerMunicipio.text =
          (widget.planillaDeAtencionFather?.municipio ?? '');
      controllerComunidad.text =
          (widget.planillaDeAtencionFather?.comunidad ?? '');
      controllerEstablecimiento.text =
          (widget.planillaDeAtencionFather?.nomestablecimiento ?? '');
      controllerGerenciaDeRed.text =
          (widget.planillaDeAtencionFather?.gerenciaRed ?? '');
      controllerPoblacion.text =
          (widget.planillaDeAtencionFather?.poblacion.toString() ?? '');
      controllerFecha.text = (widget.planillaDeAtencionFather?.fecha ?? '');
      controllerHora.text = (widget.planillaDeAtencionFather?.hora ?? '');
      controllerNombreResponsable.text =
          (widget.planillaDeAtencionFather?.nombreResponsable ?? '');
      controllerCargoResponsable.text =
          (widget.planillaDeAtencionFather?.cargoResponsable ?? '');
      controllerTelfResponsable.text =
          (widget.planillaDeAtencionFather?.telfResponsable ?? '');
    }
    super.initState();
  }

  List<FileAndDirection> listOfSelectedFile = [];

  Future<File?> pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType
          .custom, // Puedes ajustar el tipo de archivo según tus necesidades
      allowedExtensions: ['jpg', 'pdf'], // Extensiones permitidas
    );

    if (result != null) {
      // listOfSelectedFile.add(File(result.files.single.path ?? 'no_info'));
      return File(result.files.single.path ?? 'no_info');
      // selectedFile = File(result.files.single.path ?? 'no_info');
    }
    return null;
  }

  Future<String> saveImageOrPdfLocally(File file) async {
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/${file.path.split('/').last}';

    final newFile = await file.copy(filePath);
    return newFile.path;
  }

  Future _reloadListOfDepartamento() async {
    listDepartamentos = await db.getListDepartamento();
    await _reloadListOfMunicipios();
  }

  Future _reloadListOfMunicipios() async {
    listMunicipio = await db.getListMunicipio(controllerDepartamento.text);
    await _reloadListEstablecimientos();
  }

  Future _reloadListEstablecimientos() async {
    listHospitales = await db.getListEstablecimientoDeSalud(
        controllerDepartamento.text, controllerMunicipio.text);
  }

  List<ModeloDetallePlanilla> listOfDetallesDePlanilla = [];
  Future<void> initDB() async {
    await db.initDB();
    Future.delayed(Duration.zero, () async {
      await _reloadListOfDepartamento();
      if (widget.planillaDeAtencionFather != null) {
        print('''

  ENTRO AQUIIIIIIIIII


''');
        controllerCodPlanilla.text =
            widget.planillaDeAtencionFather!.codPlanilla!.toString();
        listOfDetallesDePlanilla = await db
            .getAllDetallesDePlanilla(int.parse(controllerCodPlanilla.text));
        print(listOfDetallesDePlanilla);
        planillasNoEnviadasProvider.listDetalleDePlanilla =
            listOfDetallesDePlanilla
                .map((e) => ModelDetalleDePlanilla()
                  ..sexo.text = e.sexo ?? ''
                  ..edad.text = e.edad.toString()
                  ..diagnostico.text = e.diagnostico ?? ''
                  ..codDetalle = e.codDetalle)
                .toList();
        List<String> listPath =
            (widget.planillaDeAtencionFather!.foto ?? '').split(',');
        listPath.forEach((element) {
          File _tempFile = File(element);
          FileAndDirection fileAndDirection =
              FileAndDirection(file: _tempFile, direction: element);
          listOfSelectedFile.add(fileAndDirection);
        });
      } else {
        String data = await db.getLastIDPlanillaAtencion();

        int id = int.parse(data);
        id = id + 1;
        controllerCodPlanilla.text = id.toString();
      }
      setState(() {});
    });
  }

  @override
  void didChangeDependencies() {
    planillasNoEnviadasProvider =
        Provider.of<PlanillasNoEnviadasProvider>(context, listen: true);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.planillaDeAtencionFather);
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
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: _groupDetallesDePlanilla(size),
                ),
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Material(
                    color: Colors.grey.shade100,
                    child: InkWell(
                      onTap: () async {
                        planillasNoEnviadasProvider.addModelDetalleDePlanilla();
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
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Text(
                        'Fotos de planilla',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        ),
                      ),
                      Material(
                        child: InkWell(
                          onTap: () async {
                            File? _tempFile = await pickFile();
                            if (_tempFile != null) {
                              final savedFilePath =
                                  await saveImageOrPdfLocally(_tempFile);
                              print(
                                  '_____ $savedFilePath ______ savedFilePath');
                              listOfSelectedFile.add(FileAndDirection(
                                  file: _tempFile, direction: savedFilePath));
                              setState(() {});
                              // Guarda la ruta `savedFilePath` en la base de datos Sqflite
                            }
                          },
                          child: Ink(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Text('Examinar...'),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ...listOfSelectedFile.map((e) {
                  try {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Row(
                        children: [
                          if (e.file.path.endsWith('.jpg') ||
                              e.file.path.endsWith('.jpeg') ||
                              e.file.path.endsWith('.png'))
                            Image.file(
                              e.file,
                              width: 70,
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                          if (e.file.path.endsWith('.pdf'))
                            Container(
                              width: 70,
                              height: 70,
                              child: Icon(Icons.picture_as_pdf),
                            ),
                          SizedBox(width: 10),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(e.file.path.split('/').last),
                              Text(
                                  '${double.parse((e.file.lengthSync() / 1024).toStringAsFixed(2))} Kb.',
                                  style: TextStyle(color: Colors.grey)),
                            ],
                          )),
                          SizedBox(width: 10),
                          // Text('${(e.file.lengthSync() / 1024)} Kb.'),
                          IconButton(
                            onPressed: () {
                              listOfSelectedFile.remove(e);
                              setState(() {});
                            },
                            icon: Icon(Icons.close),
                          )
                        ],
                      ),
                    );
                  } catch (e) {
                    return Container();
                  }
                }).toList(),
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

                          String _listOfFotos = '';
                          listOfSelectedFile.forEach((element) {
                            if (_listOfFotos != '') {
                              _listOfFotos =
                                  _listOfFotos + ',${element.file.path}';
                            } else {
                              _listOfFotos =
                                  _listOfFotos + '${element.file.path}';
                            }
                          });
                          print('vvvvvvvvvvvvvvvvvvvvvvvvvvvvv');
                          print(_listOfFotos);

                          ModelPlanillaDeAtencion modelo =
                              ModelPlanillaDeAtencion(
                                  usuario: prefs.userCarnet,
                                  codPlanilla:
                                      int.parse(controllerCodPlanilla.text),
                                  codEdan: 0,
                                  depto: controllerDepartamento.text,
                                  municipio: controllerMunicipio.text,
                                  comunidad: controllerComunidad.text,
                                  nomestablecimiento:
                                      controllerEstablecimiento.text,
                                  gerenciaRed: controllerGerenciaDeRed.text,
                                  poblacion: controllerPoblacion.text != ''
                                      ? int.parse(controllerPoblacion.text)
                                      : 0,
                                  fecha: controllerFecha.text,
                                  hora: controllerHora.text,
                                  evento: controllerEvento.text,
                                  nombreResponsable:
                                      controllerNombreResponsable.text,
                                  cargoResponsable:
                                      controllerCargoResponsable.text,
                                  telfResponsable:
                                      controllerTelfResponsable.text,
                                  foto: _listOfFotos,
                                  enviado: 'NO');

                          // if (widget.edanModel != null) {
                          //   db.updateEDAN(modelo);
                          // } else {
                          //   db.insertEDAN(modelo);
                          // }

                          DataBaseEdans db = DataBaseEdans();

                          await db.initDB();
                          if (widget.planillaDeAtencionFather != null) {
                            db.updatePLANILLA(modelo);

                            planillasNoEnviadasProvider.listDetalleDePlanilla
                                .forEach(
                                    (ModelDetalleDePlanilla element) async {
                              ModeloDetallePlanilla modelo =
                                  ModeloDetallePlanilla(
                                      codDetalle: element.codDetalle,
                                      edad: int.parse(element.edad.text),
                                      sexo: element.sexo.text,
                                      diagnostico: element.diagnostico.text,
                                      codPlanilla:
                                          int.parse(controllerCodPlanilla.text),
                                      cantidad: 1);
                              if (element.codDetalle != null) {
                                print(
                                    ' ======= UPDATE  updatePlanillaDetalle ======= ');
                                print(modelo);
                                await db.updatePlanillaDetalle(modelo);
                              } else {
                                int _codDetalle = int.parse(
                                    await db.getLastIDPlanillaDetalle());
                                print(
                                    ' ======= insert  updatePlanillaDetalle ======= ');
                                _codDetalle = _codDetalle + 1;
                                modelo.codDetalle = _codDetalle;
                                await db.insertPlanillaDetalle(modelo);
                              }
                            });

                            ///////////////////////////////
                          } else {
                            int _codDetalle =
                                int.parse(await db.getLastIDPlanillaDetalle());
                            print(modelo);
                            db.insertPLANILLA(modelo);
                            planillasNoEnviadasProvider.listDetalleDePlanilla
                                .forEach((ModelDetalleDePlanilla
                                    modelDetalleDePlanilla) async {
                              _codDetalle = _codDetalle + 1;
                              ModeloDetallePlanilla modeloToSql =
                                  ModeloDetallePlanilla(
                                      codDetalle: _codDetalle,
                                      edad:
                                          int.parse(
                                              modelDetalleDePlanilla.edad.text),
                                      sexo: modelDetalleDePlanilla.sexo.text,
                                      diagnostico: modelDetalleDePlanilla
                                          .diagnostico.text,
                                      codPlanilla:
                                          int.parse(controllerCodPlanilla.text),
                                      cantidad: 1);

                              await db.insertPlanillaDetalle(modeloToSql);
                            });
                          }
                          planillasNoEnviadasProvider
                              .readDataBaseListPlanillas();
                          Future.delayed(Duration(seconds: 1), () {
                            db.closeDB();
                          });
                          Navigator.pop(context);

                          planillasNoEnviadasProvider.listDetalleDePlanilla
                              .clear();
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
        InputExpanded(
          title: 'Evento',
          controller: controllerEvento,
          isRequired: true,
        ),
        InputListOption(
          title: 'Departamento',
          controller: controllerDepartamento,
          isRequired: true,
          onselect: () async {
            // if()
            await _reloadListOfMunicipios();
            // controllerMunicipio.text = listMunicipio[0];
            print('## ${controllerMunicipio.text}');

            setState(() {});
          },
          options: listDepartamentos,
        ),
        InputListOption(
          title: 'Municipio',
          controller: controllerMunicipio,
          isRequired: true,
          onselect: () async {
            print('# ${controllerMunicipio.text}');
            await _reloadListEstablecimientos();
            // listHospitales = await db.getListEstablecimientoDeSalud(
            //     controllerDepartamento.text, controllerMunicipio.text);
            setState(() {});
          },
          options: listMunicipio,
        ),
        InputExpanded(
          title: 'Comunidad',
          controller: controllerComunidad,
          isRequired: true,
        ),
        InputListOption(
          title: 'Establecimiento',
          controller: controllerEstablecimiento,
          isRequired: true,
          onselect: () async {
            // print('# ${controllerMunicipio.text}');
            // listHospitales = await db.getListEstablecimientoDeSalud(
            //     controllerDepartamento.text, controllerMunicipio.text);
            // setState(() {});
          },
          options: listHospitales,
        ),
        InputExpanded(
          title: 'Gerencia de Red',
          controller: controllerGerenciaDeRed,
        ),
        InputExpanded(
          title: 'Poblacion',
          controller: controllerPoblacion,
          isNumber: true,
          initValue: controllerPoblacion.text,
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
          initValue: controllerTelfResponsable.text,
          isNumber: true,
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

  ScrollController scrollControllerEdansNoEnviados = ScrollController();

  Widget _groupDetallesDePlanilla(Size size) {
    int i = 0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Detalle de Planilla',
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 5),
        Scrollbar(
          isAlwaysShown: true,
          showTrackOnHover: true,
          controller: scrollControllerEdansNoEnviados,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              alignment: Alignment.center,
              width: size.width > 600 ? size.width - 40 : 600,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.lightBlue),
              ),
              child: GroupDetallePlanilla(listWidgets: [
                ...planillasNoEnviadasProvider.listDetalleDePlanilla
                    .map((ModelDetalleDePlanilla demo) {
                  // print(demo.enviado);
                  // if (demo.enviado == 'no') {
                  i++;
                  return Container(
                    color: _colorItem(i),
                    child: IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.lightBlue.shade100),
                              ),
                              child: _itemInput(demo),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.lightBlue.shade100),
                              ),
                              child: Row(
                                children: [
                                  _selected('Hombre', demo),
                                  Text('Hombre'),
                                  _selected('Mujer', demo),
                                  Text('Mujer'),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.lightBlue.shade100),
                              ),
                              child: _itemSelectedInputText(demo),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.lightBlue.shade100),
                              ),
                              child: IconButton(
                                padding: const EdgeInsets.all(0),
                                icon: const Icon(Icons.remove_circle),
                                onPressed: () {
                                  // print(demo.nombre);
                                  planillasNoEnviadasProvider
                                      .removeModelDetalleDePlanilla(demo);
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ], titles: const [
                'Edad',
                'Sexo',
                'Diagnostico',
              ]),
            ),
          ),
        ),
      ],
    );
  }

  Color? _colorItem(int i) {
    if (i % 2 == 0) {
      return Colors.blue[50];
    } else {
      return Colors.white;
    }
  }

  SizedBox _itemInput(ModelDetalleDePlanilla demo) {
    return SizedBox(
      height: 35,
      child: TextField(
        // minLines: (widget.descrip) ? 3 : 1,
        // maxLines: (widget.descrip) ? 10 : 1,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 15),
          border: OutlineInputBorder(),
          hintText: 'Edad',
          // helperText: widget.helptext,
        ),
        keyboardType: TextInputType.phone,
        controller: demo.edad,
        onChanged: (value) {
          setState(() {});
        },
        // onChanged: (n) {
        //   print("completo########");
        //   if(!ordenData.flagEdit){ordenData.flagEdit = true;}
        // },
      ),
    );
  }

  final FocusNode _textFieldFocusNode = FocusNode();
  Widget _itemSelectedInputText(ModelDetalleDePlanilla demo) {
    return InkWell(
      child: SizedBox(
        height: 35,
        child: TextField(
          focusNode: _textFieldFocusNode,
          onTap: () {
            _textFieldFocusNode.unfocus();
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  titlePadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  title: const Text('Buscar - Diagnóstico'),
                  content: Container(
                      width: 600,
                      height: 400,
                      child: CustomSearchBar(
                        items:
                            planillasNoEnviadasProvider.listModelListaSintomas,
                        edadController: demo.diagnostico,
                      )),
                );
              },
            );
          },

          // minLines: (widget.descrip) ? 3 : 1,
          // maxLines: (widget.descrip) ? 10 : 1,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 15),
            border: OutlineInputBorder(),
            hintText: '- Seleccione una opcion -',
            // helperText: widget.helptext,
          ),
          keyboardType: TextInputType.phone,
          controller: demo.diagnostico,
          onChanged: (value) {
            setState(() {});
          },
        ),
      ),
    );
  }

  Radio<String> _selected(String data, ModelDetalleDePlanilla demo) {
    return Radio(
      value: data,
      groupValue: demo.sexo.text,
      onChanged: (String? value) {
        setState(() {
          demo.sexo.text = value!;
        });
      },
    );
  }
}

class CustomSearchBar extends StatefulWidget {
  final List<ModelListaSintomas> items;
  final TextEditingController edadController;

  CustomSearchBar({required this.items, required this.edadController});

  @override
  _CustomSearchBarState createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  late List<ModelListaSintomas> filteredItems;

  @override
  void initState() {
    super.initState();
    filteredItems = widget.items;
  }

  void _filterItems(String query) {
    setState(() {
      filteredItems = widget.items
          .where((item) =>
              (item.sintoma ?? '').toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  TextEditingController? controllerBuscador = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: controllerBuscador,
          onChanged: _filterItems,
          decoration: InputDecoration(
            hintText: 'Buscar...',
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: filteredItems.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  widget.edadController.text =
                      (filteredItems[index].sintoma ?? '_');
                  Navigator.pop(context);
                },
                child: ListTile(
                  title: Row(
                    children: [
                      // Icon(Icons.search),
                      // SizedBox(width: 20),
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                            children: highlightOccurrences(
                                controllerBuscador!.text,
                                (filteredItems[index].sintoma ?? '_')),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Text(filteredItems[index].nombre),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  List<TextSpan> highlightOccurrences(String query, String text) {
    List<TextSpan> spans = [];
    final pattern = RegExp(query, caseSensitive: false);
    final matches = pattern.allMatches(text);
    int previousMatchEnd = 0;
    for (Match match in matches) {
      spans.add(TextSpan(
        text: text.substring(previousMatchEnd, match.start),
      ));
      spans.add(TextSpan(
        text: text.substring(match.start, match.end),
        style: TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.bold,
        ),
      ));
      previousMatchEnd = match.end;
    }
    spans.add(TextSpan(
      text: text.substring(previousMatchEnd),
    ));
    return spans;
  }
}

class FileAndDirection {
  File file;
  String direction;

  FileAndDirection({
    required this.file,
    required this.direction,
  });
}
