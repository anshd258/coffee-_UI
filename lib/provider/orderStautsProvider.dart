import 'dart:convert';

import './authconst.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyData with ChangeNotifier {
  String? orderState;
  String? estTime;

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
