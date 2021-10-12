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
          Expanded(
            child: _itemInput(size),
          )
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                    children: [_selected(data), Text(data)],
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
                    children: [_selected(data), Text(data)],
                  ),
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
          print(widget.controller.text);
        });
      },
    );
  }
}
