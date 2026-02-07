import 'package:flutter/material.dart';

typedef ValidatorFunction = String? Function(String?);

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final ValidatorFunction validator;
  final bool? obscureText;
  final String labelText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.validator,
    this.obscureText, 
    required this.labelText,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
      ),
    );
  }
}