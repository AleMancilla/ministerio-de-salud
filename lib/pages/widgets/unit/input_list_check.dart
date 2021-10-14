import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InputListSelectedCheck extends StatefulWidget {
  final String title;
  final bool isRequired;
  final TextEditingController controller;
  List<String> options;

  InputListSelectedCheck({
    Key? key,
    required this.title,
    this.isRequired = false,
    required this.options,
    required this.controller,
  }) : super(key: key);

  @override
  State<InputListSelectedCheck> createState() => _InputListSelectedCheckState();
}

class _InputListSelectedCheckState extends State<InputListSelectedCheck> {
  @override
  void initState() {
    super.initState();

    // _selectedGender = widget.options[0];
    if (widget.controller.text.isEmpty) {
      widget.controller.text = widget.options[0];
    }
    listOptions = widget.controller.text.split(',');

    for (var i = 0; i < widget.options.length; i++) {
      if (listOptions.contains(widget.options[i])) {
        listSelect.add(true);
      } else {
        listSelect.add(false);
      }
    }
  }

  @override
  void dispose() {
    listSelect = [];
    listCheckbox = [];
    listOptions = [];
    super.dispose();
  }

  List<bool> listSelect = [];
  List<Widget> listCheckbox = [];
  List<String> listOptions = [];

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

  Widget _itemInput(Size size) {
    try {
      if (size.width > 765) {
        return listItemsRow();
      } else {
        return listItemsColumn();
      }
    } catch (e) {
      print(e);
      return const CircularProgressIndicator();
    }
  }

  Widget listItemsColumn() {
    int i = -1;
    return Column(
        children: widget.options.map((data) {
      i++;
      return Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Row(
          children: [_selected(data, i), Text(data)],
        ),
      );
    }).toList());
  }

  Widget listItemsRow() {
    int i = -1;
    return Wrap(
        // mainAxisAlignment: MainAxisAlignment.start,
        direction: Axis.horizontal,
        children: widget.options.map((data) {
          i++;
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [_selected(data, i), Text(data)],
            ),
          );
        }).toList());
  }

  Widget _selected(String data, int i) {
    return Checkbox(
      value: listSelect[i],
      onChanged: (value) {
        setState(() {
          listSelect[i] = value!;
        });
        if (listSelect[i]) {
          widget.controller.text =
              widget.controller.text + ',${widget.options[i]}';
        } else {
          widget.controller.text = widget.controller.text
              .replaceAll(',${widget.options[i]}', '')
              .replaceAll(widget.options[i], '');
        }
        print(widget.controller.text);
        _limpiarComasAlaIzquierda();
      },
    );
  }

  _limpiarComasAlaIzquierda() {
    try {
      if (widget.controller.text.substring(0, 1) == ',') {
        widget.controller.text = widget.controller.text.substring(1);
      }
    } catch (e) {
      print(e);
    }
    // for (var i = 0; i < widget.controller.text.length; i++) {
    //   print(widget.controller.text.substring(i, i + 1));
    // }
  }
}
