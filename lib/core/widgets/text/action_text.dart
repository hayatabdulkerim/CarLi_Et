import 'package:flutter/material.dart';

class ActionText extends StatelessWidget {
  final String text;

  const ActionText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(right: 16),
      child: Text(
        text,
        textAlign: TextAlign.end,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Color(0xFF087E8B),
        ),
      ),
    );
  }
}
