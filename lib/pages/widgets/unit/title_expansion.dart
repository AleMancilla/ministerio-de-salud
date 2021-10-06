import 'package:flutter/material.dart';

class TitleExpansion extends StatelessWidget {
  final String texto;

  const TitleExpansion({Key? key, required this.texto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      texto,
      style: const TextStyle(color: Colors.blue),
    );
  }
}
