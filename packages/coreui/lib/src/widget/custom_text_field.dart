import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String text;

  const CustomTextField({super.key, required this.text});

  @override
  State<CustomTextField> createState() => _CustomWidget();
}

class _CustomWidget extends State<CustomTextField> {
  @override
  Widget build(Object context) {
    return Container(
      padding: const EdgeInsets.all(4),
      child: Text(
        widget.text,
        style: const TextStyle(fontSize: 20, color: Colors.orange),
      ),
    );
  }
}
