import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String label;
  final String hintText;
  final double width;

  const InputField({super.key, required this.label, required this.hintText, this.width = 0.85});

  @override
  Widget build(BuildContext context) {
    return Align(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // LABEL ABOVE INPUT
            Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 6),

            // TEXT FIELD
            TextField(
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(color: Colors.grey.shade500),

                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),

                // default border
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),

                // when active
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),

                // when focused on
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: Color(0xFF087E8B),
                    width: 2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
