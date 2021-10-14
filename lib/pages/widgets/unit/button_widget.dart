import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final Color color;
  final Color textcolor;
  final Function ontap;

  const ButtonWidget({
    Key? key,
    required this.text,
    required this.ontap,
    this.color = Colors.blue,
    this.textcolor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      child: InkWell(
        onTap: () {
          ontap();
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Text(
            text,
            style: TextStyle(color: textcolor),
          ),
        ),
      ),
    );
  }
}
