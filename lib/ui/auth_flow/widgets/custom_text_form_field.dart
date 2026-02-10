import 'package:flutter/material.dart';

typedef ValidatorFunction = String? Function(String?);

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final ValidatorFunction validator;
  final bool? obscureText;
  final String labelText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final int? maxLines;

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.validator,
    this.obscureText, 
    required this.labelText,
    this.prefixIcon,
    this.suffixIcon, 
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: obscureText ?? false,
      maxLines: maxLines ?? 1,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        labelText: labelText,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
      ),
    );
  }
}