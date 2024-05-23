import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  String labelText;
  String errorText;
  String hintText;
  Color borderSideColor;
  bool obscureText;
  int? maxLength;
  TextInputType keyboardType;
  TextEditingController controller;
  IconData? icon;
  Color iconColor;
  final String? Function(String?)? validator;
  CustomTextField(
      {super.key,
      required this.controller,
      this.labelText = '',
      this.errorText = '',
      this.hintText = '',
      this.borderSideColor = Colors.black45,
      this.obscureText = false,
      this.maxLength,
      this.keyboardType = TextInputType.text,
      this.validator,
      this.icon,
      this.iconColor = Colors.lightBlue});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        prefixIcon: Icon(
          icon,
          color: iconColor,
        ),
        errorStyle: TextStyle(fontSize: 18.0),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.all(Radius.circular(9.0))),
      ),
      obscureText: obscureText,
      maxLength: maxLength,
      keyboardType: keyboardType,
      maxLines: obscureText ? 1 : null,
    );
  }
}
