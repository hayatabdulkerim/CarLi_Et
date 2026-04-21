import 'package:flutter/material.dart';

class InputBarWidget extends StatefulWidget {
  final String label;
  final String hintText;
  final double width;
  final double height;
  final bool obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;

  const InputBarWidget({
    Key? key,
    required this.label,
    required this.hintText,
    this.width = 300,
    this.height = 40,
    this.obscureText = false,
    this.controller,
    this.validator,
    this.onChanged,
  }) : super(key: key) ;

  @override
  State<InputBarWidget> createState() => _InputBarWidgetState();
}

class _InputBarWidgetState extends State<InputBarWidget> {
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  void dispose() {
    if (widget.controller != null) {
    }
    super.dispose();
  }

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Center(
        child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.label,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: widget.width,
                height: widget.height,
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF9C9A9A), width: 1),
                        borderRadius: BorderRadius.circular(15.06),
                      ),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 1)
                      ),
                      hintText: widget.hintText,
                      hintStyle: TextStyle(
                        fontSize: 14
                      ),
                      suffixIcon: widget.obscureText
                          ? IconButton(
                        icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
                        onPressed: _toggleVisibility,
                      ) : null,
                  ),
                  controller: widget.controller,
                  obscureText: _obscureText,
                  validator: widget.validator,
                  onChanged: widget.onChanged,
                ),
              )
            ],
          )
      )
    );
  }
}