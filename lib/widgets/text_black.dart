import 'package:flutter/material.dart';

class AppBlackText extends StatelessWidget {
  final String text;
  double size;
  final Color color;
  final FontWeight fontWeight;
  AppBlackText(
      {super.key, required this.text, required this.size, required this.color, required this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
