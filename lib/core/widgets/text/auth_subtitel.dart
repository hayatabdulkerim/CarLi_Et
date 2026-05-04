import 'package:flutter/material.dart';

class AuthSubtitle extends StatelessWidget {
  final String text;
  final double fontSize;

  const AuthSubtitle({super.key, required this.text, this.fontSize = 26});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: const Color(0xFF087E8B),
      ),
    );
  }
}
