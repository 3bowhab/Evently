import 'package:evently/core/constants/app_images.dart';
import 'package:evently/core/constants/app_padding.dart';
import 'package:evently/core/extensions/responsive_size_extension.dart';
import 'package:evently/core/extensions/responsive_sized_box_extension.dart';
import 'package:evently/core/responsive/responsive_config.dart';
import 'package:evently/core/theme/app_colors.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:evently/ui/auth_flow/widgets/custom_auth_button.dart';
import 'package:evently/ui/auth_flow/widgets/custom_text_form_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ResponsiveConfig.init(context);
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          themeProvider.currentMode == ThemeMode.dark
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
              // login text
              20.verticalSizedBox,
              Text(
                AppLocalizations.of(context)!.loginToYourAccount,
                style: Theme.of(context).textTheme.labelLarge,
              ),
          
              // form fields
              24.verticalSizedBox,
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
          
              // forget password
              8.verticalSizedBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    AppLocalizations.of(context)!.forgetPassword,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      decoration: TextDecoration.underline,
                      decorationThickness: 2,
                      decorationColor: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
          
              // login button
              50.verticalSizedBox,
              CustomAuthButton(
                onPressed: () {},
                label: Text(
                  AppLocalizations.of(context)!.login,
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge!.copyWith(color: AppColors.white),
                ),
              ),
          
              // sign up text
              50.verticalSizedBox,
              Align(
                alignment: Alignment.center,
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: AppLocalizations.of(context)!.dontHaveAnAccount,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      TextSpan(
                        text: AppLocalizations.of(context)!.signUp,
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          decoration: TextDecoration.underline,
                          decorationThickness: 2,
                          decorationColor: Theme.of(context).colorScheme.primary,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Handle sign up tap
                          },
                      ),
                    ],
                  ),
                ),
              ),
          
              // or
              32.verticalSizedBox,
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Theme.of(context).colorScheme.onSurface,
                      thickness: 2,
                    ),
                  ),
                  10.horizontalSizedBox,
                  Text(
                    AppLocalizations.of(context)!.or,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  10.horizontalSizedBox,
                  Expanded(
                    child: Divider(
                      color: Theme.of(context).colorScheme.onSurface,
                      thickness: 2,
                    ),
                  ),
                ],
              ),
          
              // login with google button
              24.verticalSizedBox,
              CustomAuthButton(
                onPressed: () {},
                label: Text(
                  AppLocalizations.of(context)!.loginWithGoogle,
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.primary),
                ),
                icon: Image.asset(
                  Assets.imagesGoogle,
                ),
                backgroundColor: Theme.of(context).colorScheme.surface,
                borderSideColor: Theme.of(context).colorScheme.onSurface,
              ),

              24.verticalSizedBox,
            ],
          ),
        ),
      ),
    );
  }
}
