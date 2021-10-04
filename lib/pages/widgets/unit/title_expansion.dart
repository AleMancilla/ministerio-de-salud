import 'package:flutter/material.dart';

class TitleExpansion extends StatelessWidget {
  final String texto;

  const TitleExpansion({Key? key, required this.texto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        texto,
        style: TextStyle(color: Colors.blue),
      ),
    );
  }
}
