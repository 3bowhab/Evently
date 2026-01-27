import 'package:evently/core/constants/app_images.dart';
import 'package:evently/core/constants/app_padding.dart';
import 'package:evently/core/extensions/responsive_sized_box_extension.dart';
import 'package:evently/core/responsive/responsive_config.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SetupView extends StatelessWidget {
  const SetupView({super.key});

  @override
  Widget build(BuildContext context) {
    ResponsiveConfig.init(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppPadding.view,
          child: Column(
            crossAxisAlignment: .stretch,
            children: [
              Image.asset(Assets.imagesEventlyIcon),
              24.verticalSizedBox,
              SvgPicture.asset(
                Assets.svgBeingCreative2,
                colorFilter: ColorFilter.mode(
                  Theme.of(context).iconTheme.color!,
                  BlendMode.srcIn,
                ),
              ),
              24.verticalSizedBox,
              Text(
                AppLocalizations.of(context)!.personalizeYourExperience,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              8.verticalSizedBox,
              Text(
                AppLocalizations.of(context)!.chooseYourPreferred,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              16.verticalSizedBox,
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
}
