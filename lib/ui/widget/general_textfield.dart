import 'package:flutter/material.dart';

class GeneralTextField extends StatelessWidget {
  const GeneralTextField({
    Key? key,
    this.label,
    this.keyboardType,
    this.validator,
    this.obscureText,
    this.controller,
    this.initialValue,
  }) : super(key: key);

  final String? label;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final TextEditingController? controller;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      initialValue: initialValue,
      decoration: InputDecoration(labelText: label ?? '', hintText: "coba"),
      keyboardType: keyboardType,
      obscureText: obscureText ?? false,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
