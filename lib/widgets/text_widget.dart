import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  double size;
  
   AppText({super.key, required this.text, required this.size});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}
