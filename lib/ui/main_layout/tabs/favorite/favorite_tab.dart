import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/models/event_type.dart';
import 'package:evently/providers/events_provider.dart';
import 'package:evently/providers/user_provider.dart';
import 'package:evently/ui/auth_flow/widgets/custom_text_form_field.dart';
import 'package:evently/ui/main_layout/tabs/favorite/event_list_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteTab extends StatefulWidget {
  const FavoriteTab({super.key});

  @override
  State<FavoriteTab> createState() => _FavoriteTabState();
}

class _FavoriteTabState extends State<FavoriteTab> {
  late final EventsProvider readEventsProvider;
  late TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    readEventsProvider = context.read<EventsProvider>();
    readEventsProvider.selectedEventTypeIndex = 0;
    getEvents();
  }

  void getEvents() async {
    await readEventsProvider.getFavoriteEvents(
      context.read<UserProvider>().currentUser?.uid ?? '',
    );
  }

  @override
  Widget build(BuildContext context) {
    final eventsProvider = context.watch<EventsProvider>();
    final eventTab = EventType.getEventTypes(context);

    return DefaultTabController(
      length: eventTab.length,
      child: Scaffold(
        appBar: AppBar(
          title: CustomTextFormField(
            controller: searchController,
            validator: (_) => null,
            labelText: AppLocalizations.of(context)!.searchForEvent,
            suffixIcon: Icons.search,
            onChanged: (value) {
              context.read<EventsProvider>().searchInFavoriteEvents(value);
            },
          ),
          titleSpacing: 0,
        ),
        body: Column(
          children: [
            Expanded(
              child: FavoriteEventListView(
                events: eventsProvider.filteredFavoriteEvents,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
