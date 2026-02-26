import 'package:evently/models/event_type.dart';
import 'package:evently/ui/main_layout/tabs/home/widgets/custom_tab.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    super.key,
    required this.eventTab,
    required this.context,
    required this.onTap,
  });

  final List<EventType> eventTab;
  final BuildContext context;
  final void Function(int index) onTap;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabAlignment: TabAlignment.start,
      isScrollable: true,
      dividerHeight: 0,
      labelPadding: EdgeInsets.zero,
      onTap: (index) => onTap(index),
      tabs: eventTab.map((e) => CustomTab(e: e)).toList(),
    );
  }
}
