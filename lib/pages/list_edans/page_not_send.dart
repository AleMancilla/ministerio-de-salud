import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ministerio_de_salud/bussiness/database/database.dart';
import 'package:ministerio_de_salud/bussiness/models.dart/model_edan.dart';
import 'package:ministerio_de_salud/bussiness/models.dart/model_evento.dart';
import 'package:ministerio_de_salud/bussiness/models.dart/model_lista_sintomas.dart';
import 'package:ministerio_de_salud/pages/list_edans/page_edans.dart';
import 'package:ministerio_de_salud/pages/planilla_de_atencion/planilla_de_atencion.dart';
import 'package:ministerio_de_salud/pages/widgets/group/app_bar_widget.dart';
import 'package:ministerio_de_salud/pages/widgets/group/body_app_bar.dart';
import 'package:ministerio_de_salud/utils/navigator_route.dart';

class PageNotSend extends StatefulWidget {
  const PageNotSend({Key? key}) : super(key: key);

  @override
  State<PageNotSend> createState() => _PageNotSendState();
}

class _PageNotSendState extends State<PageNotSend> {
  DataBaseEdans db = DataBaseEdans();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        child: AppBarWidget(size: size),
        preferredSize: const Size(double.infinity, 50),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const BodyAppBar(text: 'Lista EDANs NO enviados'),
            _boddy(),
          ],
        ),
      ),
    );
  }

  Widget _boddy() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: double.infinity),
            Column(
              children: [
                CupertinoButton(
                  onPressed: () {
                    navigatorPush(context, const PageEdans());
                  },
                  color: Colors.grey[200],
                  child: const Text(
                    'Registrar Nuevo',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                // CupertinoButton(
                //   onPressed: () {
                //     navigatorPush(context, const PagePlanillaAtencion());
                //   },
                //   color: Colors.grey[200],
                //   child: const Text(
                //     'Planilla Atencion',
                //     style: TextStyle(color: Colors.black),
                //   ),
                // ),
                Container(
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
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  _showList(BuildContext context) {
    return SizedBox(
      width: 500,
      height: 350,
      child: FutureBuilder(
        future: db.getAllEdans(),
        builder:
            (BuildContext context, AsyncSnapshot<List<ModelEdan>> snapshot) {
          if (snapshot.hasData) {
            return ListView(
              children: [
                for (ModelEdan task in snapshot.data!)
                  ListTile(
                    title: Text(task.nombre!),
                    // subtitle: Text(task.codevento!.toString()),
                  )
              ],
            );
          } else {
            return Center(
              child: Text('agregar'),
            );
          }
        },
      ),
    );
  }
}
