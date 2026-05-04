import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget {
  final double fontSize;
  final TextAlign textAlign;

  const AppTitle({
    super.key,
    this.fontSize = 22,
    this.textAlign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign,
      text: TextSpan(
        style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
        children: const [
          TextSpan(
            text: 'CarLi_Et ',
            style: TextStyle(color: Color.fromARGB(255, 186, 178, 178)),
          ),
          TextSpan(
            text: 'Internship \nManagment',
            style: TextStyle(color: Color.fromARGB(255, 50, 50, 50)),
          ),
        ],
      ),
    );
  }
}
