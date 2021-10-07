import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InputListOption extends StatefulWidget {
  final String title;
  final bool isRequired;
  final TextEditingController controller;
  List<String> options;

  InputListOption({
    Key? key,
    required this.title,
    this.isRequired = false,
    required this.options,
    required this.controller,
  }) : super(key: key);

  @override
  State<InputListOption> createState() => _InputListOptionState();
}

class _InputListOptionState extends State<InputListOption> {
  late String _chosenValue;
  @override
  void initState() {
    super.initState();
    widget.options = [' -- Seleccione una opción --', ...widget.options];
    _chosenValue = widget.options[0];
    if (widget.controller.text != ' -- Seleccione una opción --' ||
        widget.controller.text != '' ||
        widget.controller.text.isNotEmpty) {
      _chosenValue = widget.controller.text;
    }
    widget.controller.text = _chosenValue;
  }

  @override
  void dispose() {
    // print(widget.options);
    if (widget.options.contains(' -- Seleccione una opción --')) {
      widget.options.remove(' -- Seleccione una opción --');
    }
    super.dispose();
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
    try {
      return DropdownButton<String>(
        focusColor: Colors.white,

        value: _chosenValue,
        //elevation: 5,
        style: const TextStyle(color: Colors.white),
        iconEnabledColor: Colors.black,
        items: widget.options.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: const TextStyle(color: Colors.black),
            ),
          );
        }).toList(),
        hint: Text(
          widget.title,
          style: const TextStyle(
              color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
        ),
        onChanged: (value) {
          setState(() {
            _chosenValue = value!;
            widget.controller.text = _chosenValue;
          });
        },
      );
    } catch (e) {
      return CircularProgressIndicator();
    }
  }
}
