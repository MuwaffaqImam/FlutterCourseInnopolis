import 'package:flutter/material.dart';
import '../data/UserApi.dart';

class UserProvider extends ChangeNotifier {
  List<User> userList = [];

  getUsers() async {
    userList = await UserApis().getUsers();
    notifyListeners();
  }

  removeUser(user) {
    userList.remove(user);
    notifyListeners();
  }
}
