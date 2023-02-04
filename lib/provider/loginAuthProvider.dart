import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../main.dart';

class LoginAuthProvider with ChangeNotifier {
  String? phoneNumber;
  String? accessToken;
  String? role;

  get userRole {
    return role;
  }

  Future<void> login(
      String pnumber, String roleAssiged, BuildContext context) async {
    final url = "https://swift-cafe-dev.swifttrackmile.codes/login";

    await http
        .post(Uri.parse(url), body: json.encode({"phoneNo": "+91$phoneNumber"}))
        .then((value) {
      final response = json.decode(value.body);
      accessToken = response['token'];
      role = roleAssiged;
      notifyListeners();
      if (role == "admin") {
        isAdmin = true;
        notifyListeners();
        Navigator.pushNamedAndRemoveUntil(
          context,
          "/page2",
          (route) => false,
        );
      } else {
        isAdmin = false;
        notifyListeners();
        Navigator.pushNamedAndRemoveUntil(
          context,
          "/page2",
          (route) => false,
        );
      }
    });
  }

  void logout() {
    phoneNumber = null;
    accessToken = null;
    role = null;
    notifyListeners();
  }
}
