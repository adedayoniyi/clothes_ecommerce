import 'package:clothes_ecommerce/models/user.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
    name: '',
    email: '',
    password: '',
    id: '',
    token: '',
    type: '',
    address: '',
  );

  //create getter for user
  User get user => _user;

  void setUser(String user) {
    //data coming from models.user.dart
    _user = User.fromJson(user);
    notifyListeners();
  }
}
