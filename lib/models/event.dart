import 'package:evently/core/constants/app_images.dart';

class Event {
  final String eventType;
  final DateTime dateTime;
  final String title;
  final String imagePath;
  bool isFavorite;

  Event({required this.eventType, required this.dateTime, required this.title, required this.imagePath, required this.isFavorite});

  static List<Event> getEvents() {
    return [
      Event(
        eventType: 'Sport',
        dateTime: DateTime.now().add(Duration(days: 1, hours: 18)),
        title: 'Live Concert by The Rockers',
        imagePath: Assets.imagesSportLight,
        isFavorite: false,
      ),
      Event(
        eventType: 'Birthday',
        dateTime: DateTime.now().add(Duration(days: 3, hours: 15)),
        title: 'Modern Art Exhibition',
        imagePath: Assets.imagesBirthdayLight,
        isFavorite: false,
      ),
      Event(
        eventType: 'Book Club',
        dateTime: DateTime.now().add(Duration(days: 5, hours: 10)),
        title: 'Tech Innovations Conference',
        imagePath: Assets.imagesBookClubLight,
        isFavorite: true,
      ),
    ];
  }
}