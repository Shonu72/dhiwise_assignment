import 'package:finance/widgets/text_black.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Center(
        child: AppBlackText(
          text: "Profile Page",
          size: 30,
          color: Colors.black,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
