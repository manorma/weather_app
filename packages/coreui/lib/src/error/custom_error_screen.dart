import 'package:flutter/material.dart';

class CustomErrorScreen extends StatelessWidget {
  final String message;
  const CustomErrorScreen({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20, color: Colors.red),
      ),
    );
  }
}
