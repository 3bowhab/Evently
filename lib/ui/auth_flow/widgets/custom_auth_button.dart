import 'package:flutter/material.dart';

class CustomAuthButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget label;
  final Widget? icon;
  final Color? backgroundColor;
  final Color? borderSideColor;
  const CustomAuthButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.icon,
    this.backgroundColor,
    this.borderSideColor,
  });
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      label: label,
      icon: icon ?? SizedBox.shrink(),
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        side: BorderSide(color: borderSideColor ?? Colors.transparent),
      ),
    );
  }
}
