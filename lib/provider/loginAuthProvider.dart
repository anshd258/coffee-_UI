import 'package:flutter/material.dart';

class LoginAuthProvider with ChangeNotifier {
  String? phoneNumber;
  String? accessToken;
  String? role;

  get userRole {
    return role;
  }

  void Login(String pnumber, String token, String roleAssiged) {
    phoneNumber = pnumber;
    accessToken = token;
    role = roleAssiged;
    notifyListeners();
  }

  void logout() {
    phoneNumber = null;
    accessToken = null;
    role = null;
    notifyListeners();
  }
}
