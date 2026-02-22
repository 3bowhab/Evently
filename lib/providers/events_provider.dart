import 'package:evently/models/event.dart';
import 'package:evently/services/firebase_service.dart';
import 'package:flutter/material.dart';

class EventsProvider extends ChangeNotifier {
  int selectedEventTypeIndex = 0;
  List<Event> events = [];
  List<Event> filteredEvents = [];
  List<Event> favoriteEvents = [];
  List<Event> filteredFavoriteEvents = [];

  // Change the selected event type index and notify listeners
  void changeSelectedEventTypeIndex(int index) {
    selectedEventTypeIndex = index;
    notifyListeners();
  }

  // Fetch all events for the current user
  Future<void> getAllEvents(String userId) async {
    events = await FirebaseService.getEventsFromFirestore(userId);
    notifyListeners();
  }

  // Fetch events filtered by event type
  Future<void> getFilteredEventsByEventType(
    String userId,
    String eventType,
  ) async {
    filteredEvents = await FirebaseService.getFilteredEventsFromFirestore(
      userId,
      eventType,
    );
    notifyListeners();
  }

  // Fetch filtered favorite events by event type
  Future<void> updateFavoriteEvents(
    String userId,
    String eventId,
    bool isFavorite,
  ) async {
    await FirebaseService.updateFavoriteEventsInFirestore(
      userId,
      eventId,
      isFavorite,
    );
    notifyListeners();
    // // Update the local state after changing the favorite status
    // int eventIndex = events.indexWhere((event) => event.id == eventId);
    // if (eventIndex != -1) {
    //   events[eventIndex].isFavorite = isFavorite;
    //   notifyListeners();
    // }
  }

  // Fetch favorite events for the current user
  Future<void> getFavoriteEvents(String userId) async {
    favoriteEvents = await FirebaseService.getFavoriteEventsFromFirestore(
      userId,
    );
    notifyListeners();
  }

  // Filter favorite events by event type
  void getFilterFavoriteEventsByEventType(String eventType) {
    filteredFavoriteEvents = favoriteEvents
        .where((event) => event.eventType == eventType)
        .toList();
    notifyListeners();
  }
}
