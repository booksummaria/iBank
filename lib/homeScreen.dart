import 'package:flutter/material.dart';
import 'package:ibank/utils/colors.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        backgroundColor: AppColors.deepBlue,
      ),
      body: const Center(child: Text("Welcome to Home Screen")),
    );
  }
}
