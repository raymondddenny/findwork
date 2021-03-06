import 'package:flutter/material.dart';
import 'package:work/models/user_model.dart';

class UserProvider with ChangeNotifier {
  UserModel? _user;

  UserModel get user => _user!;

  set user(UserModel newUser) {
    _user = newUser;
    notifyListeners(); //-> untuk mengudpate state
  }
}
