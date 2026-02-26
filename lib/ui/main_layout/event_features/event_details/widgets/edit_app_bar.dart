import 'package:evently/core/extensions/responsive_sized_box_extension.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/ui/main_layout/event_features/add_event/widgets/app_bar_title.dart';
import 'package:evently/ui/main_layout/event_features/event_details/widgets/appbar_action_buttons.dart';
import 'package:flutter/material.dart';

class EditAppBar extends StatelessWidget implements PreferredSizeWidget {
  const EditAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBarTitle(
      title: AppLocalizations.of(context)!.eventDetails,
      actions: [
        AppbarActionButtons(
          onTap: () {},
          icon: Icon(
            Icons.edit_outlined,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        5.horizontalSizedBox,
        AppbarActionButtons(
          onTap: () {},
          icon: Icon(
            Icons.delete_outlined,
            color: Theme.of(context).colorScheme.error,
          ),
        ),
        16.horizontalSizedBox,
      ],
    );
  }
}
