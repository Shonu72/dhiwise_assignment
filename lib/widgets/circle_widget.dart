import 'package:finance/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CircleIndicator extends StatelessWidget {
  final double percentage;
  final String text;
  CircleIndicator({
    super.key,
    required this.percentage,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(10),
          child: CircularPercentIndicator(
            startAngle: 0,
            radius: 100.0, //radius for circle
            lineWidth: 5.0, //width of circle line
            animation: true,
            animationDuration: 2000,
            arcType: ArcType.FULL,
            arcBackgroundColor: Colors.grey,
            percent: percentage,
            center: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.home,
                  size: 50.0,
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Text(
                  text,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "You saved",
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 14.0,
                      color: Colors.white.withOpacity(0.8)),
                )
              ],
            ),

            circularStrokeCap: CircularStrokeCap.round,
            progressColor: Colors.white,
          ),
        ),
      ],
    );
  }
}
