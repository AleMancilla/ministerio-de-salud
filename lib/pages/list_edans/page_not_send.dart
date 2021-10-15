import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
                CupertinoButton(
                  onPressed: () {
                    navigatorPush(context, const PagePlanillaAtencion());
                  },
                  color: Colors.grey[200],
                  child: const Text(
                    'Planilla Atencion',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
