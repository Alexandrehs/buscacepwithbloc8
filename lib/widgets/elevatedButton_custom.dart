import 'package:flutter/material.dart';

class ElevatedButtonCustom extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  ElevatedButtonCustom({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(10),
        textStyle: const TextStyle(fontSize: 25),
      ),
    );
  }
}
