import 'package:finance/widgets/text_black.dart';
import 'package:flutter/material.dart';

class HistoryWidget extends StatelessWidget {
  final String amount;
  const HistoryWidget({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              margin: const EdgeInsets.all(5),
              width: 10,
              height: 10,
              decoration: const BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            AppBlackText(
              text: "Monthly Salary",
              size: 16,
              color: Colors.black,
              fontWeight: FontWeight.normal,
            ),
            const SizedBox(
              width: 100,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35),
              child: AppBlackText(
                text: amount,
                size: 16,
                color: Colors.black,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
