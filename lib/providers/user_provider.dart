import 'package:evently/models/user.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  UserModel? currentUser;
  void updateUser(UserModel newUser) {
    currentUser = newUser;
    notifyListeners();
  }
}