import 'package:evently/core/constants/app_images.dart';
import 'package:evently/core/extensions/responsive_padding_extension.dart';
import 'package:evently/core/extensions/responsive_size_extension.dart';
import 'package:evently/core/extensions/responsive_sized_box_extension.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:evently/ui/main_layout/tabs/profile/language_box.dart';
import 'package:evently/ui/main_layout/tabs/profile/setting_widget.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: true);
    return Column(
      crossAxisAlignment: .stretch,
      children: [
        Container(
          height: 116.square,
          width: 116.square,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(Assets.imagesRoute),
              fit: BoxFit.contain,
            ),
          ),
        ),
        16.verticalSizedBox,
        Text(
          "John Safwat",
          style: Theme.of(context).textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),
        4.verticalSizedBox,
        Text(
          "johnsafwat.route@gmail.com",
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        32.verticalSizedBox,
        SettingWidget(
          title: AppLocalizations.of(context)!.darkMode,
          trailing: Transform.scale(
            scale: .7,
            child: Switch(
              value: themeProvider.currentMode == ThemeMode.dark,
              onChanged: (value) {
                themeProvider.toggleTheme(
                  value ? ThemeMode.dark : ThemeMode.light,
                );
              },
            ),
          ),
        ),
        16.verticalSizedBox,
        SettingWidget(
          title: AppLocalizations.of(context)!.language,
          trailing: Padding(
            padding: 10.horizontalPadding,
            child: LanguageBox(),
          ),
        ),
        16.verticalSizedBox,
        SettingWidget(
          title: AppLocalizations.of(context)!.logout,
          trailing: Padding(
            padding: 5.horizontalPadding,
            child: ImageIcon(
              AssetImage(Assets.iconsLogout),
              color: Theme.of(context).colorScheme.error,
              size: 32.width,
            ),
          ),
        ),
      ],
    );
  }
}
