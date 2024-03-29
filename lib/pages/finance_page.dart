import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance/pages/history_page.dart';
import 'package:finance/widgets/history_widget.dart';
import 'package:finance/widgets/circle_widget.dart';
import 'package:finance/widgets/dots_widget.dart';
import 'package:finance/widgets/linear_graph.dart';
import 'package:finance/widgets/text_black.dart';
import 'package:finance/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class FinanceApp extends StatefulWidget {
  @override
  _FinanceAppState createState() => _FinanceAppState();
}

// Firebase
FirebaseFirestore firestore = FirebaseFirestore.instance;
Future<Map<String, dynamic>> fetchGoalData() async {
  try {
    var documentSnapshot = await FirebaseFirestore.instance
        .collection('goals')
        .doc('00qixqqDP3dKG5rmMSnx')
        .get();

    return documentSnapshot.data() as Map<String, dynamic>;
  } catch (e) {
    print('Error fetching data: $e');
    return {};
  }
}

class _FinanceAppState extends State<FinanceApp>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Map<String, dynamic>? goalData;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 15),
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    );
    // firebase data received
    fetchGoalData().then((data) {
      setState(() {
        goalData = data;
      });
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (goalData == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    int restAmount = goalData!['currentAmount'];
    double totalSaved = restAmount.toDouble();

    int target = goalData!['totalAmount'] ?? 0;
    double targetAmount = target.toDouble();
    int goalAmount = targetAmount.round();
    double remainingAmount = targetAmount - totalSaved;
    double progressPercentage = ((totalSaved / targetAmount) * 100) / 100;
    double needyMoney = targetAmount - remainingAmount;
    double monthlySavingProjection = remainingAmount / 12;
    int monthlysaving = monthlySavingProjection.round();
    String amount =
        goalData!.entries.map((e) => e.value).toList()[1]["amount"].toString();
    int amountInt = int.parse(amount);
    double progressLinear = ((amountInt / remainingAmount) * 100) / 100;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 86, 45, 199),
      // appBar: AppBar(),
      body: Container(
        margin: const EdgeInsets.only(top: 70),
        alignment: Alignment.center,
        height: double.maxFinite,
        child: Column(
          children: [
            AppText(text: goalData!["goalName"], size: 30),
            const SizedBox(
              height: 20,
            ),
            CircleIndicator(
              percentage: progressPercentage,
              text: "\$$remainingAmount",
            ),
            const DotsWidgets(),
            const SizedBox(
              height: 30,
            ),
            Container(
              margin: const EdgeInsets.only(left: 60, right: 60),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(text: "Goal", size: 20),
                      AppText(text: "\$$goalAmount", size: 20),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "by Jan 2025",
                        style: TextStyle(color: Colors.white.withOpacity(0.8)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              height: 100,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 53, 114, 219),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(text: "Need more savings", size: 18),
                        AppText(text: "\$$needyMoney", size: 18),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(text: "Monthly saving projection", size: 18),
                        AppText(text: "\$$monthlysaving", size: 18),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: Container(
                // height: 200,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 40, right: 40, left: 40),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppBlackText(
                            text: "Contributions",
                            size: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HistoryPage(),
                                ),
                              );
                            },
                            child: AppBlackText(
                              text: "Show History",
                              size: 16,
                              fontWeight: FontWeight.normal,
                              color: Colors.black.withOpacity(0.8),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          LinearProgressBar(percentage: progressLinear),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      HistoryWidget(amount: "\$$amount"),
                      const SizedBox(
                        height: 10,
                      ),
                      HistoryWidget(amount: "\$$amount"),
                      const SizedBox(
                        height: 10,
                      ),
                      HistoryWidget(amount: "\$$amount"),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
