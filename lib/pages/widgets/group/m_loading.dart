import 'package:flutter/material.dart';

class MLoading extends StatefulWidget {
  const MLoading({Key? key}) : super(key: key);

  @override
  State<MLoading> createState() => _MLoadingState();
}

class _MLoadingState extends State<MLoading> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5), () {
      try {
        Navigator.pop(context);
      } catch (e) {
        print('---- $e');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black26,
      child: Center(
        child: Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: CircularProgressIndicator(
              color: Colors.blueGrey[900],
              strokeWidth: 7,
            ),
          ),
        ),
      ),
    );
  }
}
