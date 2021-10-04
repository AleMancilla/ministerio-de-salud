import 'package:flutter/material.dart';

class InputExpanded extends StatefulWidget {
  final String title;
  final String hint;
  final bool isRequired;
  final bool isNumber;
  final TextEditingController controller;

  const InputExpanded({
    Key? key,
    required this.title,
    required this.hint,
    this.isRequired = true,
    this.isNumber = false,
    required this.controller,
  }) : super(key: key);

  @override
  State<InputExpanded> createState() => _InputExpandedState();
}

class _InputExpandedState extends State<InputExpanded> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
      // margin: const EdgeInsets.only(bottom: 10, top: 10),
      width: double.infinity,
      child: Row(
        children: [
          Text(widget.title),
          Expanded(
            child: TextField(
              // minLines: (widget.descrip) ? 3 : 1,
              // maxLines: (widget.descrip) ? 10 : 1,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: widget.hint,
                // helperText: widget.helptext,
              ),
              keyboardType:
                  widget.isNumber ? TextInputType.phone : TextInputType.text,
              controller: widget.controller,
              onChanged: (value) {
                setState(() {});
              },
              // onChanged: (n) {
              //   print("completo########");
              //   if(!ordenData.flagEdit){ordenData.flagEdit = true;}
              // },
            ),
          )
        ],
      ),
    );
  }
}
