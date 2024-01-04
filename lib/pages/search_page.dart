import 'package:finance/widgets/text_black.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
      ),
      body: Center(
          child: AppBlackText(
        text: "Search Page",
        size: 30,
        color: Colors.black,
        fontWeight: FontWeight.normal,
      )),
    );
  }
}
