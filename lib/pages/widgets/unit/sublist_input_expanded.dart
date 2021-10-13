import 'package:flutter/material.dart';

class SublistInputExpanded extends StatefulWidget {
  final String hint;
  final bool isNumber;
  final TextEditingController controller;

  const SublistInputExpanded({
    Key? key,
    required this.hint,
    this.isNumber = false,
    required this.controller,
  }) : super(key: key);

  @override
  State<SublistInputExpanded> createState() => _SublistInputExpandedState();
}

class _SublistInputExpandedState extends State<SublistInputExpanded> {
  @override
  void initState() {
    // widget.controller.text = '0';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      // margin: const EdgeInsets.only(bottom: 10, top: 10),
      width: double.infinity,
      child: _itemInput(),
    );
  }

  SizedBox _itemInput() {
    return SizedBox(
      height: 35,
      child: TextField(
        // minLines: (widget.descrip) ? 3 : 1,
        // maxLines: (widget.descrip) ? 10 : 1,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 15),
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
    );
  }
}
