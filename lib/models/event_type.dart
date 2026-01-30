import 'package:evently/core/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:evently/l10n/app_localizations.dart';

class EventType {
  final IconData icon;
  final String name;
  final String imagePath;

  EventType({required this.icon, required this.name, required this.imagePath});
  
  static List<EventType> getEventTypes(BuildContext context) => [
    EventType(
      icon: Icons.widgets,
      name: AppLocalizations.of(context)!.all,
      imagePath: '',
    ),
    EventType(
      icon: Icons.directions_bike,
      name: AppLocalizations.of(context)!.sport,
      imagePath: Assets.imagesSportLight
    ),
    EventType(
      icon: Icons.cake,
      name: AppLocalizations.of(context)!.birthday,
      imagePath: Assets.imagesBirthdayLight,
    ),
    EventType(
      icon: Icons.menu_book,
      name: AppLocalizations.of(context)!.bookClub,
      imagePath: Assets.imagesBookClubLight,
    ),
    EventType(
      icon: Icons.art_track,
      name: AppLocalizations.of(context)!.exhibition,
      imagePath: Assets.imagesExhibitionLight,
    ),
    EventType(
      icon: Icons.view_carousel,
      name: AppLocalizations.of(context)!.meetings,
      imagePath: Assets.imagesMeetingLight,
    ),
  ];
}