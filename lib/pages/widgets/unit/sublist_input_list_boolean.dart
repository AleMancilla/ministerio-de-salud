import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SubListInputListBoolean extends StatefulWidget {
  final TextEditingController controller;
  List<String> options;

  SubListInputListBoolean({
    Key? key,
    required this.options,
    required this.controller,
  }) : super(key: key);

  @override
  State<SubListInputListBoolean> createState() =>
      _SubListInputListBooleanState();
}

class _SubListInputListBooleanState extends State<SubListInputListBoolean> {
  @override
  void initState() {
    super.initState();

    // _selectedGender = widget.options[0];
    if (widget.controller.text.isEmpty) {
      widget.controller.text = widget.options[0];
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      // margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      // margin: const EdgeInsets.only(bottom: 10, top: 10),
      width: double.infinity,
      child: _styleView(size),
    );
  }

  Widget _styleView(Size size) {
    return Wrap(
      children: [
        _itemInput(size),
      ],
    );
  }

  Widget _itemInput(Size size) {
    try {
      return listItemsWrap();
    } catch (e) {
      return const CircularProgressIndicator();
    }
  }

  Widget listItemsWrap() {
    return Wrap(
        direction: Axis.horizontal,
        children: widget.options
            .map((data) => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [Center(child: _selected(data)), Text(data)],
                ))
            .toList());
  }

  Radio<String> _selected(String data) {
    return Radio(
      value: data,
      groupValue: widget.controller.text,
      onChanged: (String? value) {
        setState(() {
          widget.controller.text = value!;
        });
      },
    );
  }
}
