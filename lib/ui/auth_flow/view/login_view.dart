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
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.forgetPasswordView);
                      },
                      child: Text(
                        AppLocalizations.of(context)!.forgetPassword,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          decoration: TextDecoration.underline,
                          decorationThickness: 2,
                          decorationColor: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ],
                ),
      
                // login button
                50.verticalSizedBox,
                CustomButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      AppRoutes.mainLayoutView,
                    );
                  },
                  label: AppLocalizations.of(context)!.login,
                ),
      
                // sign up text
                50.verticalSizedBox,
                CreateOrDontHaveAccount(
                  text: AppLocalizations.of(context)!.dontHaveAnAccount,
                  textButton: AppLocalizations.of(context)!.signUp,
                  onTap: () {
                    Navigator.pushReplacementNamed(context, AppRoutes.registerView);
                  },
                ),
      
                // or
                32.verticalSizedBox,
                OrRow(),
      
                // login with google button
                24.verticalSizedBox,
                AuthWithgoogleButton(
                  label: AppLocalizations.of(context)!.loginWithGoogle,
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