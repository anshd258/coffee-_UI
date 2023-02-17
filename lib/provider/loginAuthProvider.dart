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
        body: json
            .encode({"phoneNo": pnumber, "deviceToken": "65685", "otp": OTP}));
    final loadedData = json.decode(response.body);
    print(loadedData);
    if (response.statusCode == 200) {
      // await setRole("merchant");
      // isAdmin = true;
      if (loadedData['role'] == 'MERCHANT') {
        await setRole('merchant');
      } else if (loadedData['role'] == 'ADMIN') {
        await setRole('admin');
      } else if (loadedData['role'] == 'USER') {
        await setRole('user');
      }
      await setToken(loadedData['token']);
      // await setToken(
      //     "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiI1NjIwNjc4MTE0IiwiaXNBZG1pbiI6dHJ1ZSwiZXhwIjoxNjgyNDM4NzI0LCJ1c2VySWQiOiI1NGI4YTg0OS02N2UyLTRmNjYtOTFkNi0zYTYxZjE0MTcxMGIiLCJpYXQiOjE2NzYzOTA3MjR9.i9D0FNaBQUUPA5pgbY2pjiIH0WM2Q9vlClETLdPUgVlJ1-jUOfL5uNuujHCeFcPLLcYd4z4ceo626Y-dbU_TDw");

      accessToken = await getToken();
      role = await getRole();
      notifyListeners();
      if (role == "merchant") {
        print(role);
        print(accessToken);
        isAdmin = true;
        notifyListeners();
        Navigator.pushNamedAndRemoveUntil(
          context,
          "/switcher",
          (route) => false,
        );
      } else {
        print(role);
        print(accessToken);
        isAdmin = false;
        notifyListeners();
        Navigator.pushNamedAndRemoveUntil(
          context,
          "/switcher",
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
