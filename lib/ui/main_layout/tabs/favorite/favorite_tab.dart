import 'package:evently/core/extensions/responsive_sized_box_extension.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/models/event.dart';
import 'package:evently/ui/auth_flow/widgets/custom_text_form_field.dart';
import 'package:evently/ui/main_layout/tabs/home/widgets/event_list_view.dart';
import 'package:flutter/material.dart';

class FavoriteTab extends StatelessWidget {
  const FavoriteTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          controller: TextEditingController(),
          validator: (_) => null,
          labelText: AppLocalizations.of(context)!.searchForEvent,
          suffixIcon: Icons.search,
        ),
        10.verticalSizedBox,
        Expanded(child: EventListView(events: Event.getEvents())),
      ],
    );
  }
}
