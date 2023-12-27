import 'package:flutter/material.dart';

class GeneralTextField extends StatelessWidget {
  const GeneralTextField(
      {Key? key,
      this.label,
      this.keyboardType,
      this.validator,
      this.obscureText,
      this.controller,
      this.initialValue,
      this.hintText})
      : super(key: key);

  final String? label;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final TextEditingController? controller;
  final String? initialValue;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      initialValue: initialValue,
      decoration: InputDecoration(labelText: label ?? '', hintText: hintText),
      keyboardType: keyboardType,
      obscureText: obscureText ?? false,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
