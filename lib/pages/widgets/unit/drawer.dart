import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:ministerio_de_salud/bussiness/database/mysqlphp/mysql_data.dart';

class InkWellDrawer extends StatelessWidget {
  const InkWellDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext ctxt) {
    Size size = MediaQuery.of(ctxt).size;
    return Material(
      color: Colors.transparent,
      child: Row(
        children: [
          Container(
            height: size.height,
            width: 250,
            color: Colors.blueGrey[900],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 100),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () async {
                      CoolAlert.show(
                          context: ctxt,
                          type: CoolAlertType.loading,
                          text: 'Cargando..');
                      await upgradeAllUsers();
                      Navigator.pop(ctxt);
                    },
                    child: Ink(
                      child: Row(
                        children: [
                          Container(
                            color: Colors.cyan,
                            width: 2,
                            height: 40,
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              'Actualizar usuarios',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 18.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: GestureDetector(
            onTap: () {
              Navigator.pop(ctxt);
            },
            child: Container(
              color: Colors.transparent,
            ),
          ))
        ],
      ),
    );
  }
}
