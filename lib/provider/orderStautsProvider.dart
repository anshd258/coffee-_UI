import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyData with ChangeNotifier {
  String? orderState;
  String? estTime;

  final accessToken =
      "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIrOTE3MDI4MTgwMTU4IiwiaXNVc2VyIjp0cnVlLCJleHAiOjE2NzU0NDc2OTMsInVzZXJJZCI6IjJhMWI2NGY0LWI1NmQtNGUxMC04MGM3LTUwM2ZjNTc1ZjQ4YSIsImlhdCI6MTY3NTQyOTY5M30.YVwm7rQOcHj2dQRiSOwrcrJ-TjLCymFxcKfKaN93Gi0LdbTVdg3PjLy7AY5Aonpixb622_jB-aUs8pSpwBLRYQ";
  void fetchData(String orderid) async {
    final url =
        "https://swift-cafe-dev.swifttrackmile.codes/orderStatus/$orderid";
    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $accessToken',
    });
    final decodedData = json.decode(response.body) as Map<String, dynamic>;
    if (decodedData['message'] == 'SUCCESS') {
      orderState = decodedData['data']['orderState'];
      estTime = decodedData['data']['estTime'];
      notifyListeners();
    }
  }
}
