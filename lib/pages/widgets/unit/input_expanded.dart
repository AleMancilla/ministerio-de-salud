import 'package:flutter/material.dart';

class InputExpanded extends StatefulWidget {
  final String title;
  final String hint;
  final bool isRequired;
  final bool isNumber;
  final TextEditingController controller;
  final String? initValue;

  const InputExpanded({
    Key? key,
    required this.title,
    this.hint = '',
    this.isRequired = false,
    this.isNumber = false,
    required this.controller,
    this.initValue,
  }) : super(key: key);

  @override
  State<InputExpanded> createState() => _InputExpandedState();
}

class _InputExpandedState extends State<InputExpanded> {
  @override
  void initState() {
    super.initState();
    if (widget.initValue != null) {
      widget.controller.text = widget.initValue!;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      // margin: const EdgeInsets.only(bottom: 10, top: 10),
      width: double.infinity,
      child: _styleView(size),
    );
  }

  Widget _styleView(Size size) {
    if (size.width >= 720) {
      return Row(
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(horizontal: 15),
            width: 170,
            child: RichText(
              text: TextSpan(
                  text: widget.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    if (widget.isRequired)
                      const TextSpan(
                        text: ' *',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.red),
                      )
                  ]),
            ),
          ),
          Expanded(
            child: _itemInput(),
          )
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: RichText(
              text: TextSpan(
                  text: widget.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                  children: <TextSpan>[
                    if (widget.isRequired)
                      const TextSpan(
                        text: ' *',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.red),
                      )
                  ]),
            ),
          ),
          _itemInput(),
        ],
      );
    }
  }

  Widget _itemInput() {
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.symmetric(horizontal: 15),
      height: 35,
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
    );
  }
}
