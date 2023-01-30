import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool obsecure;
  final TextInputType? textInputType;
  final FormFieldValidator? validator;
  
  const MyTextField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.obsecure,
    this.textInputType = TextInputType.name,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      obscureText: obsecure,
      controller: controller,
      keyboardType: textInputType,
      cursorHeight: 25,
      decoration: InputDecoration(
        hintText: hintText,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(width: 1.0, color: Color(0xff4E4B66))),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(width: 1.0, color: Color(0xff4E4B66))),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
