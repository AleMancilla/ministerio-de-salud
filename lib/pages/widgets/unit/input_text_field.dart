import 'package:flutter/material.dart';

class InputTextFielfWidget extends StatefulWidget {
  final String? hint;
  final bool isNumber;
  final TextEditingController controller;

  const InputTextFielfWidget({
    Key? key,
    this.hint,
    this.isNumber = false,
    required this.controller,
  }) : super(key: key);
  @override
  State<InputTextFielfWidget> createState() => _InputTextFielfWidgetState();
}

class _InputTextFielfWidgetState extends State<InputTextFielfWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      // minLines: (widget.descrip) ? 3 : 1,
      // maxLines: (widget.descrip) ? 10 : 1,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 15),
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
