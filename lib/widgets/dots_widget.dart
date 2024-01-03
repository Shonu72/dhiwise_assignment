import 'package:flutter/material.dart';

class DotsWidgets extends StatelessWidget {
  const DotsWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
            5,
            (indexdots) => Container(
                  margin: const EdgeInsets.all(5),
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: indexdots == 0 ? Colors.white : Colors.grey,
                    shape: BoxShape.circle,
                  ),
                ),
                ),
                );
  }
}
