import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum TextType { success, error }

class TextResult extends StatelessWidget {
  final String textValue;
  final TextType type;

  TextResult({required this.textValue, required this.type});

  @override
  Widget build(BuildContext context) {
    return Text(
      textValue,
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w500,
        color: type.name == 'error' ? Colors.red : Colors.grey,
      ),
    );
  }
}
