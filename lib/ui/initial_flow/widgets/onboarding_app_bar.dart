import 'package:evently/core/constants/app_images.dart';
import 'package:evently/core/extensions/responsive_padding_extension.dart';
import 'package:evently/core/extensions/responsive_size_extension.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/models/onboarding.dart';
import 'package:evently/providers/language_provider.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnboardingAppBar extends StatelessWidget {
  const OnboardingAppBar({
    super.key,
    required this.currentIndex,
    required this.controller,
  });

  final int currentIndex;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final languageProvider = Provider.of<LanguageProvider>(context);
    final onboarding = Onboarding.getOnboardingPages(context);

    return SizedBox(
      height: 50.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            themeProvider.currentMode == ThemeMode.dark
                ? Assets.imagesEventlyIconDark
                : Assets.imagesEventlyIcon,
            height: 28,
          ),
    
          currentIndex > 0
              ? Positioned(
                  left: languageProvider.currentLanguage == 'en' ? 0 : null,
                  right: languageProvider.currentLanguage == 'en' ? null : 0,
                  child: Container(
                    height: 32.square,
                    width: 32.square,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      border: Border.all(
                        color: Theme.of(context).colorScheme.onSurface,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Padding(
                      padding: languageProvider.currentLanguage == 'en'
                          ? const EdgeInsets.only(left: 10)
                          : const EdgeInsets.only(right: 10),
                      child: InkWell(
                        onTap: () {
                          controller.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Theme.of(context).iconTheme.color,
                        ),
                      ),
                    ),
                  ),
                )
              : Container(),
    
          currentIndex < onboarding.length - 1
              ? Positioned(
                  right: languageProvider.currentLanguage == 'en' ? 0 : null,
                  left: languageProvider.currentLanguage == 'en' ? null : 0,
                  child: Container(
                    padding: 6.allPadding,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      border: Border.all(
                        color: Theme.of(context).colorScheme.onSurface,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: InkWell(
                      onTap: () {
                        controller.animateToPage(
                          onboarding.length - 1,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: Text(
                        AppLocalizations.of(context)!.skip,
                        style: Theme.of(context).textTheme.titleMedium!
                            .copyWith(
                              color: Theme.of(context).colorScheme.tertiary,
                            ),
                      ),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
