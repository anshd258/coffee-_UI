import 'dart:convert';
import './authconst.dart';
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

  Future<void> login(String pnumber, String OTP, BuildContext context) async {
    final response = await http.post(Uri.parse("$baseurl/login"),
        headers: {"Content-Type": "application/json"},
        body:
            json.encode({"phoneNo": pnumber, "deviceToken": "14", "otp": OTP}));
    final loadedData = json.decode(response.body);
    print(loadedData);

    if (response.statusCode == 200) {
      if (loadedData['role'] == 'USER') {
        setRole('user');
      } else {
        setRole('admin');
      }
      setToken(loadedData['token']);
      accessTokken = await getToken();
      accessToken = await getToken();
      role = await getRole();
      notifyListeners();
      if (role == "admin") {
        print(role);
        print(accessToken);
        isAdmin = true;
        notifyListeners();
        Navigator.pushNamedAndRemoveUntil(
          context,
          "/page2",
          (route) => false,
        );
      } else {
        print(role);
        print(accessToken);
        isAdmin = false;
        notifyListeners();
        Navigator.pushNamedAndRemoveUntil(
          context,
          "/page2",
          (route) => false,
        );
      }
    }
  }

  void logout() async {
    await setRole("");
    await setToken('');
    accessToken = await getToken();
    role = await getRole();
    print(role);
    print(accessToken);
    isAdmin = false;
    phoneNumber = null;
    accessToken = null;
    role = null;
    notifyListeners();
  }
}
