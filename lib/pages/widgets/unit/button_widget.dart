import 'package:flutter/material.dart';
import 'package:ministerio_de_salud/utils/theme_utils.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final Color? color;
  final Color textcolor;
  final Function ontap;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double paddingHorizontal;

  const ButtonWidget(
      {Key? key,
      required this.text,
      required this.ontap,
      this.color,
      this.textcolor = Colors.white,
      this.fontWeight,
      this.paddingHorizontal = 20,
      this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color ?? primaryColor,
      child: InkWell(
        onTap: () {
          ontap();
        },
        child: Container(
          // constraints: BoxConstraints(
          //   minWidth: 100,
          // ),
          alignment: Alignment.center,
          padding:
              EdgeInsets.symmetric(horizontal: paddingHorizontal, vertical: 10),
          child: Text(
            text,
            style: TextStyle(
                color: textcolor, fontSize: fontSize, fontWeight: fontWeight),
          ),
        ),
      ),
    );
  }
}
