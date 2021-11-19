import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CheckBoxDemo extends StatefulWidget {
  CheckBoxDemo({Key? key, this.controller = false, required this.onchange})
      : super(key: key);
  bool controller;
  Function onchange;

  @override
  _CheckBoxDemoState createState() => _CheckBoxDemoState();
}

class _CheckBoxDemoState extends State<CheckBoxDemo> {
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: widget.controller,
      onChanged: (value) {
        widget.onchange();
        setState(() {
          widget.controller = value!;
        });
      },
    );
  }
}
