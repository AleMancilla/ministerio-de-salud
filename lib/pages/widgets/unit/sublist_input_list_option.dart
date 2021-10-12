import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SubListInputListOption extends StatefulWidget {
  final TextEditingController controller;
  List<String> options;

  SubListInputListOption({
    Key? key,
    required this.options,
    required this.controller,
  }) : super(key: key);

  @override
  State<SubListInputListOption> createState() => _SubListInputListOptionState();
}

class _SubListInputListOptionState extends State<SubListInputListOption> {
  late String _chosenValue;
  @override
  void initState() {
    super.initState();
    print(widget.controller.text);

    if (widget.controller.text == '- Seleccione una opción -' ||
        widget.controller.text == '' ||
        widget.controller.text.isEmpty) {
      widget.options = ['- Seleccione una opción -', ...widget.options];
      _chosenValue = widget.options[0];
    } else {
      _chosenValue = widget.controller.text;
    }
    widget.controller.text = _chosenValue;
  }

  @override
  void dispose() {
    // print(widget.options);
    if (widget.options.contains('- Seleccione una opción -')) {
      widget.options.remove('- Seleccione una opción -');
    }
    super.dispose();
  }

  agregarPrimeraOpcion() {
    if (!widget.options.contains('- Seleccione una opción -')) {
      widget.options = ['- Seleccione una opción -', ...widget.options];
    }
  }

  @override
  Widget build(BuildContext context) {
    agregarPrimeraOpcion();
    return Container(
      // margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.only(bottom: 0, top: 0),
      // width: double.infinity,
      child: _itemInput(),
    );
  }

  // Widget _styleView(Size size) {
  //   if (size.width >= 720) {
  //     return Row(
  //       children: [
  //         Expanded(
  //           child: _itemInput(),
  //         )
  //       ],
  //     );
  //   } else {
  //     return Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         _itemInput(),
  //       ],
  //     );
  //   }
  // }

  Widget _itemInput() {
    try {
      return DropdownButton<String>(
        focusColor: Colors.white,
        value: _chosenValue,
        isDense: true,
        isExpanded: true,
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
        onChanged: (value) {
          setState(() {
            _chosenValue = value!;
            widget.controller.text = _chosenValue;
          });
        },
      );
    } catch (e) {
      return const CircularProgressIndicator();
    }
  }
}
