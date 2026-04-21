import 'package:flutter/material.dart';

class SelectBoxWidget extends StatefulWidget {
  final String label;
  final String hintText;
  final double width;
  final double height;
  final List<String> items;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;


  const SelectBoxWidget({
    required this.label,
    required this.hintText,
    required this.width,
    required this.height,
    required this.items,
    this.validator,
    this.onChanged,
    super.key
  });

  @override
  State<SelectBoxWidget> createState() => _SelectBoxWidgetState();
}

class _SelectBoxWidgetState extends State<SelectBoxWidget> {
  String? selectedValue = null;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        DropdownButtonFormField<String>(
          borderRadius: BorderRadius.circular(10),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF9C9A9A), width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          value: selectedValue,
          hint: Text(
            widget.hintText,
            style: TextStyle(
              color: Color(0xFF9C9A9A),
              fontWeight: FontWeight.w400,
              fontSize: 14
            ),
            textAlign: TextAlign.left,
          ),
          isExpanded: true,
          onChanged: (value) {
            setState(() => selectedValue = value);
            if (widget.onChanged != null) widget.onChanged!(value);
          },
          items: widget.items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Roboto",
                  fontSize: 14
                ),
              ),
              onTap: () => print(selectedValue),
            );
          }).toList(),
          validator: widget.validator, // This links it to the _formKey
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
