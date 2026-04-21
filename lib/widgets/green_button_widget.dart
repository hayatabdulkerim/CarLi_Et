import 'package:flutter/material.dart';

class GreenButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final double width;
  final double height;

  const GreenButtonWidget({
    required this.onPressed,
    required this.buttonText,
    required this.width,
    required this.height,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF005E5E),
          foregroundColor: Colors.white,
          fixedSize: Size(width, height),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.06),
          ),
        ),
        child:  Text(
          buttonText,
        ),
      ),
    );
  }
}
