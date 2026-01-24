import 'package:evently/core/constants/app_images.dart';
import 'package:evently/core/constants/app_utils.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SetupView extends StatelessWidget {
  const SetupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.screenWidth * (16 / AppUtils.uiScreenWidth),
          ),
          child: Column(
            crossAxisAlignment: .stretch,
            children: [
              Image.asset(Assets.imagesEventlyIcon),
              sizedBox(context, 24),
              SvgPicture.asset(
                Assets.svgBeingCreative2,
                colorFilter: ColorFilter.mode(
                  Theme.of(context).iconTheme.color!,
                  BlendMode.srcIn,
                ),
              ),
              sizedBox(context, 24),
              Text(
                AppLocalizations.of(context)!.personalizeYourExperience,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              sizedBox(context, 8),
              Text(
                AppLocalizations.of(context)!.chooseYourPreferred,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              sizedBox(context, 16),
              Row(
                children: [
                  Text(
                    AppLocalizations.of(context)!.language,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox sizedBox(BuildContext context, int height) => SizedBox(
    height: context.screenHeight * (height / AppUtils.uiScreenHeight),
  );
}
