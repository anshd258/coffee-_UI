import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../main.dart';
import 'loginhandler/loginsharedpref.dart';

class LoginAuthProvider with ChangeNotifier {
  String? phoneNumber;
  String? accessToken;
  String? role;

  get userRole {
    return role;
  }

  Future<void> login(
      String pnumber, String roleAssiged, BuildContext context) async {
    setRole(roleAssiged);
    role = await getRole();
    notifyListeners();

    if (role == "admin") {
      print(role);
      isAdmin = true;
      notifyListeners();
      Navigator.pushNamedAndRemoveUntil(
        context,
        "/page2",
        (route) => false,
      );
    } else {
      print(role);
      isAdmin = false;
      notifyListeners();
      Navigator.pushNamedAndRemoveUntil(
        context,
        "/page2",
        (route) => false,
      );
    }
  }

  void logout() {
    setRole("");
    isAdmin = false;
    phoneNumber = null;
    accessToken = null;
    role = null;
    notifyListeners();
  }
}
