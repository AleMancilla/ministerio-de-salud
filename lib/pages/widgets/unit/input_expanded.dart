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
    this.hint = '',
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
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      // margin: const EdgeInsets.only(bottom: 10, top: 10),
      width: double.infinity,
      child: Row(
        children: [
          Container(
            constraints: BoxConstraints(minWidth: 300, maxWidth: 500),
            child: Text(
              widget.title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Container(
              height: 40,
              child: TextField(
                // minLines: (widget.descrip) ? 3 : 1,
                // maxLines: (widget.descrip) ? 10 : 1,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                  border: const OutlineInputBorder(),
                  hintText: widget.title,
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
            ),
          )
        ],
      ),
    );
  }
}
