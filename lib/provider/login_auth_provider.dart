import 'dart:async';
import 'dart:convert';

import 'dart:io';
import 'package:inter_coffee/constants/route_constants.dart';
import 'package:inter_coffee/provider/loginhandler/login_model.dart';

import 'loginhandler/login_functions.dart';
import '../constants/authconst.dart';
import '../widgets/snackbar.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginAuthProvider with ChangeNotifier {
  String? phoneNumber;
  String? accessToken;
  String? userId;

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
    print(pnumber);
    try {
      final response = await http
          .post(Uri.parse("$baseurl/generateOTP"),
              headers: {"Content-Type": "application/json"},
              body: json.encode({"phoneNo": pnumber}))
          .then((value) {
        isloading = false;
        notifyListeners();
        print(value.body);
        print(value.statusCode);
        if (value.statusCode == 200) {
          Navigator.pushNamedAndRemoveUntil(
              context, otpInputScreen, (route) => false,
              arguments: pnumber);
        } else if (value.statusCode != 200) {
          snakbarmethod(context, "value inputed  is not correct");
        }
      }).onError((error, stackTrace) {
        snakbarmethod(context, "error connecting the backend");
        isloading = false;
        notifyListeners();
      }).timeout(const Duration(seconds: 10));
    } on TimeoutException {
      snakbarmethod(context, "timeout connecting the backend");
      isloading = false;
      notifyListeners();
    } on SocketException {
      snakbarmethod(context, "error connecting the backend");
      isloading = false;
      notifyListeners();
    }
  }

  Future<void> login(String pnumber, String OTP, BuildContext context) async {
    try {
      final fcmToken = await FirebaseMessaging.instance.getToken();
      print("fcm tokken ->${fcmToken!}");
      isloading = true;
      notifyListeners();
      final response = await http
          .post(Uri.parse("$baseurl/login"),
              headers: {"Content-Type": "application/json"},
              body: json.encode(
                  {"phoneNo": pnumber, "deviceToken": fcmToken, "otp": OTP}))
          .onError((error, stackTrace) {
        snakbarmethod(context, "error connecting the backend");
        isloading = false;
        notifyListeners();
        return http.Response(error.toString(), 403);
      }).timeout(
        const Duration(seconds: 10),
      );
      isloading = false;
      notifyListeners();
      final loadedData = json.decode(response.body);
      print(loadedData);
      if (response.statusCode == 200) {
        final session = loginStorage();
        // await setRole("merchant");
        // isAdmin = true;
        if (loadedData['role'] == 'MERCHANT') {
          isAdmin = true;
          session.role = "merchant";
          notifyListeners();
        } else if (loadedData['role'] == 'ADMIN') {
          isAdmin = true;

          session.role = "admin";
          notifyListeners();
        } else if (loadedData['role'] == 'USER') {
          isAdmin = false;

          session.role = "user";
          notifyListeners();
        }
        session.phonenumber = pnumber;
        session.token = loadedData['token'];
        session.userId = loadedData['userId'];
        // await setToken(
        //     "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiI1NjIwNjc4MTE0IiwiaXNBZG1pbiI6dHJ1ZSwiZXhwIjoxNjgyNDM4NzI0LCJ1c2VySWQiOiI1NGI4YTg0OS02N2UyLTRmNjYtOTFkNi0zYTYxZjE0MTcxMGIiLCJpYXQiOjE2NzYzOTA3MjR9.i9D0FNaBQUUPA5pgbY2pjiIH0WM2Q9vlClETLdPUgVlJ1-jUOfL5uNuujHCeFcPLLcYd4z4ceo626Y-dbU_TDw");
        userId = session.userId;
        accessToken = session.token;
        role = session.role;
        loginhandler().storeData(session); // stroing data to local storage
        print(userId);
        notifyListeners();
        if (role == "merchant") {
          print(role);
          print(accessToken);
          notifyListeners();
          Navigator.pushNamedAndRemoveUntil(
            context,
            switcher,
            (route) => false,
          );
        } else {
          print(role);
          print(accessToken);
          notifyListeners();
          Navigator.pushNamedAndRemoveUntil(
            context,
            switcher,
            (route) => false,
          );
        }
      } else if (response.statusCode != 200) {
        snakbarmethod(context, "value inputed  is not correct");
      }
    } on TimeoutException {
      snakbarmethod(context, "timeout connecting the backend");
      isloading = false;
      notifyListeners();
    } on SocketException {
      snakbarmethod(context, "error connecting the backend");
      isloading = false;
      notifyListeners();
    }
  }

  void autologin() async {
    final data = loginhandler().getData();
    if (data != null) {
      role = data.role;
      print(role);
      accessToken = data.token;
      print(accessToken);
      phoneNumber = data.phonenumber;
      print(phoneNumber);
      userId = data.userId;
      print(userId);
      notifyListeners();
    } else {
      role = null;
      accessToken = null;
      userId = null;
      phoneNumber = null;
    }
  }

  void logout() async {
    loginhandler().deleteData();

    isAdmin = false;
    phoneNumber = null;
    accessToken = null;
    role = null;
    notifyListeners();
  }
}
