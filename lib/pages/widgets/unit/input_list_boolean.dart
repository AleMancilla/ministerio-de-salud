import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InputListBoolean extends StatefulWidget {
  final String title;
  final bool isRequired;
  final TextEditingController controller;
  List<String> options;

  InputListBoolean({
    Key? key,
    required this.title,
    this.isRequired = false,
    required this.options,
    required this.controller,
  }) : super(key: key);

  @override
  State<InputListBoolean> createState() => _InputListBooleanState();
}

class _InputListBooleanState extends State<InputListBoolean> {
  @override
  void initState() {
    super.initState();

    // _selectedGender = widget.options[0];
    print(
        '==== ${widget.controller.text} 00 ${widget.controller.text.isEmpty}');
    if (widget.controller.text.isEmpty) {
      widget.controller.text = widget.options[0];
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
          SizedBox(
            width: 170,
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
          Expanded(
            child: _itemInput(size),
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
          _itemInput(size),
        ],
      );
    }
  }

  String _selectedGender = '';
  Widget _itemInput(Size size) {
    try {
      if (size.width > 765) {
        return listItemsRow();
      } else {
        return listItemsColumn();
      }
    } catch (e) {
      return CircularProgressIndicator();
    }
  }

  Widget listItemsColumn() {
    return Column(
        children: widget.options
            .map((data) => Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Row(
                    children: [
                      Radio(
                        value: data,
                        groupValue: widget.controller.text,
                        onChanged: (String? value) {
                          setState(() {
                            widget.controller.text = value!;
                            print(widget.controller.text);
                          });
                        },
                      ),
                      Text(data)
                    ],
                  ),
                ))
            .toList());
  }

  Widget listItemsRow() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: widget.options
            .map((data) => Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Row(
                    children: [
                      Radio(
                        value: data,
                        groupValue: widget.controller.text,
                        onChanged: (String? value) {
                          setState(() {
                            widget.controller.text = value!;
                            print(widget.controller.text);
                          });
                        },
                      ),
                      Text(data)
                    ],
                  ),
                ))
            .toList());
  }
}
