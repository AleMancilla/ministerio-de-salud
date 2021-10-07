import 'package:flutter/material.dart';
import 'package:ministerio_de_salud/utils/theme_utils.dart';

class AppBarWidget extends StatefulWidget {
  final Size size;

  const AppBarWidget({Key? key, required this.size}) : super(key: key);
  @override
  _AppBarWidgetState createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      width: double.infinity,
      height: 50,
      child: Row(
        children: [
          if (widget.size.width > 720)
            Container(
              height: 50,
              width: 230,
              child: Image.asset('assets/images/logo_p.png'),
              color: backgroundPrimaryColor,
            ),
          Expanded(
            child: Row(
              children: [
                iconButtonSelect(
                  const SizedBox(
                    height: 50,
                    child: Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                  ),
                  () {
                    Navigator.pop(context);
                    // print('object');
                  },
                ),
                const Expanded(child: Text('data')),
                iconButtonSelect(
                  const SizedBox(
                    height: 50,
                    child: Icon(
                      Icons.person_rounded,
                      color: Colors.white,
                    ),
                  ),
                  () {
                    // print('object');
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget iconButtonSelect(Widget icon, Function ontap) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: icon,
        ),
        onTap: () {
          ontap();
        },
      ),
    );
  }
}
