import 'package:evently/core/constants/app_images.dart';
import 'package:evently/core/constants/app_routes.dart';
import 'package:evently/core/utils/dialog_utils.dart';
import 'package:evently/core/utils/toast_utils.dart';
import 'package:evently/services/firebase_auth_service.dart';
import 'package:evently/ui/auth_flow/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class AuthWithgoogleButton extends StatelessWidget {
  final String label;
  final String toastMessage;
  const AuthWithgoogleButton({
    super.key,
    required this.label,
    required this.toastMessage,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: () async {
        try {
          DialogUtils.showLoadingDialog(context);

          final credential = await FirebaseAuthService().signInWithGoogle();

          Navigator.pop(context);

          if (credential == null) {
            return;
          }

          ToastUtils.showToast(
            toastMessage,
            context,
          );

          Navigator.pushReplacementNamed(context, AppRoutes.mainLayoutView);
        } catch (e) {
          Navigator.pop(context);
          ToastUtils.showErrorToast(e.toString(), context);
          print("Error is: $e");
        }
      },
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
