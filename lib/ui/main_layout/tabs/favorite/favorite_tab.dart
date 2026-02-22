import 'package:evently/core/extensions/responsive_size_extension.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/models/event_type.dart';
import 'package:evently/providers/events_provider.dart';
import 'package:evently/providers/user_provider.dart';
import 'package:evently/ui/auth_flow/widgets/custom_text_form_field.dart';
import 'package:evently/ui/main_layout/tabs/home/widgets/custom_tab.dart';
import 'package:evently/ui/main_layout/tabs/home/widgets/event_list_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteTab extends StatefulWidget {
  const FavoriteTab({super.key});

  @override
  State<FavoriteTab> createState() => _FavoriteTabState();
}

class _FavoriteTabState extends State<FavoriteTab> {
  late final EventsProvider eventsProvider;

  @override
  void initState() {
    eventsProvider = context.read<EventsProvider>();
    getEvents();
    super.initState();
  }

  void getEvents() async {
    await eventsProvider.getFavoriteEvents(
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
            controller: TextEditingController(),
            validator: (_) => null,
            labelText: AppLocalizations.of(context)!.searchForEvent,
            suffixIcon: Icons.search,
          ),
          titleSpacing: 0,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(56.height),
            child: tabBar(eventTab, context),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: EventListView(
                events: eventsProvider.selectedEventTypeIndex == 0
                    ? eventsProvider.favoriteEvents
                    : eventsProvider.filteredFavoriteEvents,
              ),
            ),
          ],
        ),
      ),
    );
  }

  TabBar tabBar(List<EventType> eventTab, BuildContext context) {
    return TabBar(
      tabAlignment: TabAlignment.start,
      isScrollable: true,
      dividerHeight: 0,
      onTap: (index) {
        context.read<EventsProvider>().changeSelectedEventTypeIndex(index);
        if (index == 0) {
          setState(() {
            context.read<EventsProvider>().getFavoriteEvents(
              context.read<UserProvider>().currentUser?.uid ?? '',
            );
          });
        } else {
          setState(() {
            context.read<EventsProvider>().getFilterFavoriteEventsByEventType(
              eventTab[index].name,
            );
          });
        }
      },
      tabs: eventTab.map((e) => CustomTab(e: e)).toList(),
    );
  }
}
