import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:inter_coffee/constants/auth_const.dart';



class AuthApiHandler{

   Future<http.Response> otpApiCall(String body) {
    return http
        .post(Uri.parse("$baseurl/generateOTP"),
            headers: {"Content-Type": "application/json"},
            body:body );
  }

   Future<http.Response> loginApiCall(String pnumber, String? fcmToken, String OTP) {
    return http
        .post(Uri.parse("$baseurl/login"),
            headers: {"Content-Type": "application/json"},
            body: json.encode(
                {"phoneNo": pnumber, "deviceToken": fcmToken, "otp": OTP}));
  }
  
}