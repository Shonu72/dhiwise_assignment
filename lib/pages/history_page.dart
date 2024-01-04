import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

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

class _HistoryPageState extends State<HistoryPage> {
  late Map<String, dynamic>? goalData = {};

  @override
  void initState() {
    super.initState();
    fetchGoalData().then((data) {
      setState(() {
        goalData = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (goalData == null || goalData!.isEmpty || goalData!.length < 2) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    String amount = goalData!.entries.map((e) => e.value).toList()[1]["amount"];
    String date = goalData!.entries.map((e) => e.value).toList()[1]["date"];
    String salary = goalData!.entries.map((e) => e.value).toList()[1]["salary"];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 86, 45, 199),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 86, 45, 199),
        title: AppText(text: "History", size: 20),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: const Icon(
                Icons.food_bank,
                color: Colors.white,
              ),
              title: AppText(text: salary, size: 20),
              subtitle: AppText(text: date, size: 16),
              trailing: AppText(text: "\$$amount", size: 20),
            ),
          );
        },
      ),
    );
  }
}
