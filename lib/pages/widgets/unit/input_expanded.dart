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
    print(
        ' _______ ${widget.title}_______ ${widget.initValue} >>>>>>>>>>>>>>> ${widget.isNumber}>> ${widget.initValue}');
    // if ((widget.initValue == null || widget.initValue != '') &&
    //     widget.isNumber) {
    //   widget.controller.text = '0';
    // }
    if (widget.isNumber) {
      if (widget.initValue != null && widget.initValue != '') {
        print(' ---- entro aca');
        widget.controller.text == widget.initValue;
      } else {
        widget.controller.text = '0';
      }
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
            child: SelectableText.rich(
              TextSpan(
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
            child: SelectableText.rich(
              TextSpan(
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
          SizedBox(height: 5),
          _itemInput(),
        ],
      );
    }
  }

  Widget _itemInput() {
    print(
        ' ============>>> ${widget.controller.text} ================ ${widget.title}');
    return Container(
      alignment: Alignment.centerRight,
      // padding: EdgeInsets.symmetric(horizontal: 0),
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
