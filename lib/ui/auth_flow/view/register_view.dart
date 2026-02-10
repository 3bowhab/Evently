import 'package:evently/core/constants/app_images.dart';
import 'package:evently/core/constants/app_padding.dart';
import 'package:evently/core/constants/app_routes.dart';
import 'package:evently/core/extensions/responsive_size_extension.dart';
import 'package:evently/core/extensions/responsive_sized_box_extension.dart';
import 'package:evently/core/responsive/responsive_config.dart';
import 'package:evently/core/utils/app_utils.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/ui/auth_flow/widgets/auth_withgoogle_button.dart';
import 'package:evently/ui/auth_flow/widgets/create_or_dont_have_account.dart';
import 'package:evently/ui/auth_flow/widgets/custom_button.dart';
import 'package:evently/ui/auth_flow/widgets/custom_text_form_field.dart';
import 'package:evently/ui/auth_flow/widgets/or_row.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ResponsiveConfig.init(context);

    return GestureDetector(
      onTap: () => AppUtils.hideKeyboard(context),
      child: Scaffold(
        appBar: AppBar(
          title: Image.asset(
            Theme.of(context).brightness == Brightness.dark
                ? Assets.imagesEventlyIconDark
                : Assets.imagesEventlyIcon,
            height: 28.height,
          ),
        ),
        body: Padding(
          padding: AppPadding.view,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: .start,
              children: [
                // Register text
                20.verticalSizedBox,
                Text(
                  AppLocalizations.of(context)!.createYourAccount,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
      
                // form fields
                24.verticalSizedBox,
                CustomTextFormField(
                  controller: nameController,
                  validator: (_) => null,
                  labelText: AppLocalizations.of(context)!.enterYourName,
                  prefixIcon: Icons.person_outline,
                ),
                16.verticalSizedBox,
                CustomTextFormField(
                  controller: emailController,
                  validator: (_) => null,
                  labelText: AppLocalizations.of(context)!.enterYourEmail,
                  prefixIcon: Icons.email_outlined,
                ),
                16.verticalSizedBox,
                CustomTextFormField(
                  controller: passwordController,
                  validator: (_) => null,
                  labelText: AppLocalizations.of(context)!.enterYourPassword,
                  prefixIcon: Icons.lock_outline,
                  suffixIcon: Icons.visibility_off_outlined,
                ),
                16.verticalSizedBox,
                CustomTextFormField(
                  controller: confirmPasswordController,
                  validator: (_) => null,
                  labelText: AppLocalizations.of(context)!.confirmYourPassword,
                  prefixIcon: Icons.lock_outline,
                  suffixIcon: Icons.visibility_off_outlined,
                ),
      
                // Register button
                50.verticalSizedBox,
                CustomButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      AppRoutes.loginView,
                    );
                  },
                  label: AppLocalizations.of(context)!.signUp,
                ),
      
                // sign up text
                50.verticalSizedBox,
                CreateOrDontHaveAccount(
                  text: AppLocalizations.of(context)!.alreadyHaveAnAccount,
                  textButton: AppLocalizations.of(context)!.login,
                  onTap: () {
                    Navigator.pushReplacementNamed(
                      context,
                      AppRoutes.loginView,
                    );
                  },
                ),
      
                // or
                32.verticalSizedBox,
                OrRow(),
      
                // Register with google button
                24.verticalSizedBox,
                AuthWithgoogleButton(
                  label: AppLocalizations.of(context)!.signupwithgoogle,
                  onPressed: () {},
                ),
      
                24.verticalSizedBox,
              ],
            ),
          ),
        ),
      ),
    );
  }
}