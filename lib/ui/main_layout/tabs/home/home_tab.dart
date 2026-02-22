import 'package:evently/models/event_type.dart';
import 'package:evently/providers/events_provider.dart';
import 'package:evently/providers/user_provider.dart';
import 'package:evently/ui/main_layout/tabs/home/widgets/appbar_title.dart';
import 'package:evently/ui/main_layout/tabs/home/widgets/custom_tab.dart';
import 'package:evently/ui/main_layout/tabs/home/widgets/event_list_view.dart';
import 'package:evently/ui/main_layout/tabs/home/widgets/mode_changer.dart';
import 'package:evently/ui/main_layout/tabs/home/widgets/language_changer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  late final EventsProvider eventsProvider;

  @override
  void initState() {
    eventsProvider = context.read<EventsProvider>();
    getEvents();
    super.initState();
  }

  void getEvents() async {
    await eventsProvider.getAllEvents(
      context.read<UserProvider>().currentUser?.uid ?? '',
    );
  }

  @override
  Widget build(BuildContext context) {
    final eventTab = EventType.getEventTypes(context);
    final eventsProvider = context.watch<EventsProvider>();

    return DefaultTabController(
      length: eventTab.length,
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          title: AppbarTitle(),
          actions: [ModeChanger(), LanguageChanger()],
          bottom: tabBar(eventTab, context),
        ),
        body: EventListView(
          events: eventsProvider.selectedEventTypeIndex == 0
              ? eventsProvider.events
              : eventsProvider.filteredEvents,
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
            context.read<EventsProvider>().getAllEvents(
              context.read<UserProvider>().currentUser?.uid ?? '',
            );
          });
        } else {
          setState(() {
            context.read<EventsProvider>().getFilteredEventsByEventType(
              context.read<UserProvider>().currentUser?.uid ?? '',
              eventTab[index].name,
            );
          });
        }
      },
      tabs: eventTab
          .map(
            (e) => CustomTab(e: e),
          )
          .toList(),
    );
  }
}