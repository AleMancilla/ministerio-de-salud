import 'package:flutter/material.dart';

void navigatorPushReplacement(BuildContext context, Widget page) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute<void>(
      builder: (BuildContext context) => page,
    ),
  );
}

void navigatorPush(BuildContext context, Widget page) {
  Navigator.push(
    context,
    MaterialPageRoute<void>(
      builder: (BuildContext context) => page,
    ),
  );
}
