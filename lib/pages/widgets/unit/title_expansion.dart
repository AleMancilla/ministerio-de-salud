import 'package:flutter/material.dart';
import 'package:ministerio_de_salud/utils/theme_utils.dart';

class TitleExpansion extends StatelessWidget {
  final String texto;

  const TitleExpansion({Key? key, required this.texto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      texto,
      style: TextStyle(color: primaryColor),
    );
  }
}
