import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomTextField extends StatelessWidget {
  String labelText;
  String errorText;
  Color borderSideColor;
  bool obscureText;
  int? maxLength;
  TextInputType keyboardType;
  TextEditingController controller;
  final String? Function(String?)? validator;
  CustomTextField(
      {super.key,
      required this.controller,
      this.labelText = '',
      this.errorText = '',
      this.borderSideColor = Colors.black45,
      this.obscureText = false,
      this.maxLength,
      this.keyboardType = TextInputType.text,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        errorText: errorText,
        errorStyle: TextStyle(color: Colors.red),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
      obscureText: obscureText,
      maxLength: maxLength,
      keyboardType: keyboardType,
      maxLines: obscureText ? 1 : null,
    );
  }
}
