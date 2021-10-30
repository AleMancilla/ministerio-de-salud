import 'package:flutter/material.dart';

class GroupInstalacionDeAlbergues extends StatelessWidget {
  final List<Widget> listWidgets;
  final List<String> titles;

  const GroupInstalacionDeAlbergues(
      {Key? key, required this.listWidgets, required this.titles})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.indigo.shade700,
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.lightBlue),
                    ),
                    child: Text(
                      titles[0],
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.lightBlue),
                    ),
                    child: Text(
                      titles[1],
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                const Expanded(
                  flex: 1,
                  child: Text(
                    ' ',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
          ),
        ),
        ...listWidgets
      ],
    );
  }
}
