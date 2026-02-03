import 'package:evently/core/constants/app_images.dart';
import 'package:evently/core/extensions/responsive_size_extension.dart';
import 'package:evently/core/responsive/responsive_config.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

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
      body: Column(
        children: [
          Text(AppLocalizations.of(context)!.createYourAccount,
              style: Theme.of(context).textTheme.headlineMedium),
        ],
      ),
    );
  }
}