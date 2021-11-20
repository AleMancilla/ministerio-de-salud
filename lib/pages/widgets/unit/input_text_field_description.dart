import 'package:flutter/material.dart';

class InputTextFielfDescriptionWidget extends StatefulWidget {
  final String? hint;
  final bool isNumber;
  final TextEditingController controller;

  const InputTextFielfDescriptionWidget({
    Key? key,
    this.hint,
    this.isNumber = false,
    required this.controller,
  }) : super(key: key);
  @override
  State<InputTextFielfDescriptionWidget> createState() =>
      _InputTextFielfWidgetState();
}

class _InputTextFielfWidgetState
    extends State<InputTextFielfDescriptionWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      minLines: 3,
      maxLines: 7,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        border: const OutlineInputBorder(),
        hintText: widget.hint,
        // helperText: widget.helptext,
      ),
      keyboardType: widget.isNumber ? TextInputType.phone : TextInputType.text,
      controller: widget.controller,
      onChanged: (value) {
        setState(() {});
      },
      // onChanged: (n) {
      //   print("completo########");
      //   if(!ordenData.flagEdit){ordenData.flagEdit = true;}
      // },
    );
  }
}
