import 'package:flutter/material.dart';
import 'package:ministerio_de_salud/bussiness/database/database.dart';
import 'package:ministerio_de_salud/pages/widgets/unit/input_expanded.dart';
import 'package:ministerio_de_salud/pages/widgets/unit/title_expansion.dart';

class PageEdans extends StatefulWidget {
  const PageEdans({Key? key}) : super(key: key);

  @override
  State<PageEdans> createState() => _PageEdansState();
}

class _PageEdansState extends State<PageEdans> {
  List<Widget> listWidgets = [
    Container(
        width: double.infinity,
        height: 100,
        padding: EdgeInsets.all(20),
        color: Colors.red),
    Container(
        width: double.infinity,
        height: 100,
        padding: EdgeInsets.all(20),
        color: Colors.blue),
    Container(
        width: double.infinity,
        height: 100,
        padding: EdgeInsets.all(20),
        color: Colors.orange),
  ];

  Widget cont = Container(
      width: double.infinity,
      height: 100,
      padding: EdgeInsets.all(20),
      color: Colors.blueGrey[900]);

  final listKey = GlobalKey<AnimatedListState>();

  TextEditingController controllerNombre = TextEditingController();
  TaskDataBase db = TaskDataBase();
  int number = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          number = number + 1;
          db.insert(Task('numero $number --'));
          setState(() {});
        },
      ),
      body: Container(
          color: Colors.grey[50],
          child: FutureBuilder(
            future: db.initDB(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return _showList(context);
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          )
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     AppBarWidget(size: size),
          //     const SizedBox(width: double.infinity),
          //     const Padding(
          //       padding: EdgeInsets.all(20.0),
          //       child: Text('Lista EDANs NO enviados'),
          //     ),
          //     Expanded(
          //       child: SingleChildScrollView(
          //         child: Column(
          //           children: [
          //             _datosGenerales(size),
          //             _datosGenerales(size),
          //             _datosGenerales(size),
          //             _datosGenerales(size),
          //             _buttonSelect('Guardar'),
          //           ],
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          ),
    );
  }

  _showList(BuildContext context) {
    return FutureBuilder(
      future: db.getAllTask(),
      builder: (BuildContext context, AsyncSnapshot<List<Task>> snapshot) {
        if (snapshot.hasData) {
          return ListView(
            children: [
              for (Task task in snapshot.data!)
                ListTile(
                  title: Text(task.name),
                )
            ],
          );
        } else {
          return Center(
            child: Text('agregar'),
          );
        }
      },
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
        ExpansionTile(
          title: const TitleExpansion(texto: '1.- DATOS GENERALES'),
          children: <Widget>[
            InputExpanded(
                title: 'Nombre de contacto', controller: controllerNombre),
            InputExpanded(
                title: 'Cargo de contacto', controller: controllerNombre),
            InputExpanded(
                title: 'Dirección de contacto', controller: controllerNombre),
            InputExpanded(
                title: 'Telefono fijo de contacto',
                controller: controllerNombre),
            InputExpanded(
                title: 'Telefono movil de contacto',
                controller: controllerNombre),
            InputExpanded(
                title: 'Comunidad o zona', controller: controllerNombre),
            InputExpanded(
                title: 'Para llegar al lugar se parte de (lugar):',
                controller: controllerNombre),
            InputExpanded(
                title: 'Tiempo de llegada al lugar (en horas)',
                controller: controllerNombre),
          ],
        ),
        Divider()
      ],
    );
  }

  Widget _buttonSelect(String text) {
    return Material(
      color: Colors.cyan[700],
      child: InkWell(
        child: Container(
          child: Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
          padding: EdgeInsets.all(10),
          // color: Colors.cyan[700],
        ),
        onTap: () {
          print('object');
        },
      ),
    );
  }
}
