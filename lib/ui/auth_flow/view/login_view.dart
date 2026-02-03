import 'package:evently/core/constants/app_images.dart';
import 'package:evently/core/constants/app_padding.dart';
import 'package:evently/core/extensions/responsive_size_extension.dart';
import 'package:evently/core/extensions/responsive_sized_box_extension.dart';
import 'package:evently/core/responsive/responsive_config.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

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
        child: Column(
          children: [
            20.verticalSizedBox,
            Text(
              AppLocalizations.of(context)!.loginToYourAccount,
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
      ),
    );
  }
}