import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class LinearProgressBar extends StatelessWidget {
  final double percentage;
  const LinearProgressBar({super.key, required this.percentage});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: LinearPercentIndicator(
                width: 300,
                lineHeight: 10,
                percent: percentage,
                // ignore: deprecated_member_use
                linearStrokeCap: LinearStrokeCap.roundAll,
                progressColor: Colors.green,
                backgroundColor: Colors.grey,
                animation: true,
                animationDuration: 2000,
                barRadius: const Radius.circular(50),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
