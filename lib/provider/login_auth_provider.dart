import 'dart:async';
import 'dart:convert';

import 'dart:io';
import 'package:inter_coffee/client/auth_api_handler.dart';
import 'package:inter_coffee/constants/route_constants.dart';
import 'package:inter_coffee/provider/loginhandler/login_model.dart';

import 'loginhandler/login_functions.dart';
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

  bool verifyPhoneNumber(String phoneNumber, BuildContext context) {
    bool ans = false;

    if (phoneNumber.length > 10) {
      snakbarmethod(context, "Enter a Phone Number not greater than 10 digits");
    } else if (phoneNumber.length < 10) {
      snakbarmethod(context, "Enter a Phone Number not smaller than 10 digits");
    } else if (phoneNumber.length == 10) {
      ans = true;
    }

    return ans;
  }

  Future<void> getOtp(String pnumber, BuildContext context) async {
    isloading = true;
    notifyListeners();

    try {
      final body = json.encode({"phoneNo": pnumber});
      await AuthApiHandler().otpApiCall(body).then((value) {
        isloading = false;
        notifyListeners();

        if (value.statusCode == 200) {
          Navigator.pushNamedAndRemoveUntil(
              context, otpInputScreen, (route) => false,
              arguments: pnumber);
        } else if (value.statusCode != 200) {
          if (value.statusCode == 400 &&
              value.body.contains("phone number not registered.")) {
            snakbarmethod(context, "User not registered.");
          } else {
            snakbarmethod(context, "Contact the Admin.");
          }
        }
      }).timeout(const Duration(seconds: 5));
    } on TimeoutException {
      snakbarmethod(context, "Check your internet connection");
      isloading = false;
      notifyListeners();
    } on SocketException {
      snakbarmethod(context, "Check your internet connection");
      isloading = false;
      notifyListeners();
    }
  }

  Future<void> login(String pnumber, String OTP, BuildContext context) async {
    try {
      final fcmToken = await FirebaseMessaging.instance.getToken();

      isloading = true;
      notifyListeners();
      final response = await AuthApiHandler()
          .loginApiCall(pnumber, fcmToken, OTP)
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
      // print(loadedData);
      if (response.statusCode == 200) {
        final session = loginStorage();

        if (loadedData['role'] == 'MERCHANT') {
          isAdmin = false;
          session.role = "merchant";
          notifyListeners();
        } else if (loadedData['role'] == 'ADMIN') {
          isAdmin = false;
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

        userId = session.userId;
        accessToken = session.token;
        role = session.role;
        loginhandler().storeData(session); // stroing data to local storage
        notifyListeners();
        if (role == "merchant") {
          notifyListeners();
          Navigator.pushNamedAndRemoveUntil(
            context,
            switcher,
            (route) => false,
          );
        } else {
          notifyListeners();
          Navigator.pushNamedAndRemoveUntil(
            context,
            switcher,
            (route) => false,
          );
        }
      } else if (response.statusCode != 200) {
        if (response.statusCode == 400 &&
            response.body.contains("phone number not registered.")) {
          snakbarmethod(context, "User not registered.");
        } else {
          snakbarmethod(context, "Contact the Admin");
        }
      }
    } on TimeoutException {
      snakbarmethod(context, "Check your internet connection");
      isloading = false;
      notifyListeners();
    } on SocketException {
      snakbarmethod(context, "Check your internet connection");
      isloading = false;
      notifyListeners();
    }
  }

  void autologin() async {
    final data = loginhandler().getData();
    if (data != null) {
      role = data.role;
      if (role == 'merchant' || role == 'admin') {
        isAdmin = false;
      }
      print(role);
      accessToken = data.token;
      //  print(accessToken);
      phoneNumber = data.phonenumber;
      // print(phoneNumber);
      userId = data.userId;
      //  print(userId);
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
