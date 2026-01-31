import 'package:evently/core/extensions/responsive_padding_extension.dart';
import 'package:evently/core/extensions/responsive_sized_box_extension.dart';
import 'package:evently/models/event.dart';
import 'package:evently/models/event_type.dart';
import 'package:evently/ui/main_layout/tabs/home/widgets/appbar_title.dart';
import 'package:evently/ui/main_layout/tabs/home/widgets/event_list_view.dart';
import 'package:evently/ui/main_layout/tabs/home/widgets/mode_changer.dart';
import 'package:evently/ui/main_layout/tabs/home/widgets/language_changer.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    final eventTab = EventType.getEventTypes(context);

    return DefaultTabController(
      length: eventTab.length,
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          title: AppbarTitle(),
          actions: [ModeChanger(), LanguageChanger()],
          bottom: tabBar(eventTab, context),
        ),
        body: EventListView(events: Event.getEvents(),),
      ),
    );
  }

  TabBar tabBar(List<EventType> eventTab, BuildContext context) {
    return TabBar(
      tabAlignment: TabAlignment.start,
      isScrollable: true,
      dividerHeight: 0,
      tabs: eventTab
          .map(
            (e) => Tab(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                padding: 5.horizontalPadding,
                child: Row(
                  children: [
                    Icon(e.icon, size: 22),
                    8.horizontalSizedBox,
                    Text(
                      e.name,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
