import 'package:evently/core/constants/app_images.dart';
import 'package:evently/ui/auth_flow/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class AuthWithgoogleButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  const AuthWithgoogleButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: onPressed,
      isGoogleButton: true,
      labelWidget: Text(
        label,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      icon: Image.asset(Assets.imagesGoogle),
      backgroundColor: Theme.of(context).colorScheme.surface,
      borderSideColor: Theme.of(context).colorScheme.onSurface,
    );
  }
}
