import 'dart:convert';
import './authconst.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'loginhandler/loginsharedpref.dart';

class LoginAuthProvider with ChangeNotifier {
  String? phoneNumber;
  String? accessToken;
  bool isloading = false;
  String? role;
  bool? isAdmin;

  get userRole {
    return role;
  }

  get getColor {
    return isAdmin;
  }

  Future<void> getOtp(String pnumber, BuildContext context) async {
    isloading = true;
    notifyListeners();
    final response = await http
        .post(Uri.parse("$baseurl/generateOTP"),
            headers: {"Content-Type": "application/json"},
            body: json.encode({"phoneNo": pnumber}))
        .then((value) {
      isloading = false;
      notifyListeners();
      if (value.statusCode == 200) {
        Navigator.pushNamedAndRemoveUntil(
            context, "/otpinput", (route) => false,
            arguments: pnumber);
      }
    });
  }

  Future<void> login(String pnumber, String OTP, BuildContext context) async {
    final fcmToken = await FirebaseMessaging.instance.getToken();
    print("fcm tokken ->${fcmToken!}");
    isloading = true;
    notifyListeners();
    final response = await http.post(Uri.parse("$baseurl/login"),
        headers: {"Content-Type": "application/json"},
        body: json
            .encode({"phoneNo": pnumber, "deviceToken": fcmToken, "otp": OTP}));
    isloading = false;
    notifyListeners();
    final loadedData = json.decode(response.body);
    print(loadedData);
    if (response.statusCode == 200) {
      // await setRole("merchant");
      // isAdmin = true;
      if (loadedData['role'] == 'MERCHANT') {
        isAdmin = true;
        await setRole('merchant');
        notifyListeners();
      } else if (loadedData['role'] == 'ADMIN') {
        isAdmin = true;
        await setRole('admin');
        notifyListeners();
      } else if (loadedData['role'] == 'USER') {
        isAdmin = false;
        await setRole('user');
        notifyListeners();
      }
      await setPhoneNumber(pnumber);
      await setToken(loadedData['token']);
      // await setToken(
      //     "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiI1NjIwNjc4MTE0IiwiaXNBZG1pbiI6dHJ1ZSwiZXhwIjoxNjgyNDM4NzI0LCJ1c2VySWQiOiI1NGI4YTg0OS02N2UyLTRmNjYtOTFkNi0zYTYxZjE0MTcxMGIiLCJpYXQiOjE2NzYzOTA3MjR9.i9D0FNaBQUUPA5pgbY2pjiIH0WM2Q9vlClETLdPUgVlJ1-jUOfL5uNuujHCeFcPLLcYd4z4ceo626Y-dbU_TDw");

      accessToken = await getToken();
      role = await getRole();
      notifyListeners();
      if (role == "merchant") {
        print(role);
        print(accessToken);
        notifyListeners();
        Navigator.pushNamedAndRemoveUntil(
          context,
          "/switcher",
          (route) => false,
        );
      } else {
        print(role);
        print(accessToken);
        notifyListeners();
        Navigator.pushNamedAndRemoveUntil(
          context,
          "/switcher",
          (route) => false,
        );
      }
    }
  }

  void autologin() async {
    role = await getRole();
    accessToken = await getToken();
    phoneNumber = await getPhoneNumber();
    notifyListeners();
  }

  void logout() async {
    await setRole("null");
    await setToken('null');
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
