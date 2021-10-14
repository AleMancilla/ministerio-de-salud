import 'package:flutter/material.dart';

class BodyAppBar extends StatelessWidget {
  final String text;

  const BodyAppBar({Key? key, required this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return _appBarBody(size);
  }

  Widget _appBarBody(Size size) {
    if (size.width <= 1000) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _titleBody(),
          _directionContainer(),
        ],
      );
    } else {
      return Row(
        children: [
          _titleBody(),
          Expanded(child: Container()),
          _textContent(),
        ],
      );
    }
  }

  Widget _titleBody() {
    return Text(
      text,
      style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
    );
  }

  Widget _directionContainer() {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(1),
      ),
      width: double.infinity,
      child: _textContent(),
    );
  }

  Row _textContent() {
    return Row(
      children: [
        const Icon(Icons.home),
        const Icon(Icons.chevron_right_outlined),
        Text(text),
      ],
    );
  }
}
