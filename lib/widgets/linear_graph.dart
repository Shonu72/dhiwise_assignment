import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class LinearProgressBar extends StatelessWidget {
  const LinearProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: <Widget>[
            LinearPercentIndicator(
              width: 300,
              lineHeight: 10,
              percent: 0.5,
              // ignore: deprecated_member_use
              linearStrokeCap: LinearStrokeCap.roundAll,
              progressColor: Colors.redAccent,
              backgroundColor: Colors.indigo,
              animation: true,
              animationDuration: 2000,
              barRadius: Radius.circular(50),
            ),
          ],
        ),
      ],
    );
  }
}
