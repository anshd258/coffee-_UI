import 'dart:convert';

import 'package:flutter/material.dart';
import '../models/order_details_model.dart';
import 'package:http/http.dart' as http;

class MyData with ChangeNotifier {
  String? orderState;
  String? estTime;

  final token =
      "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIrOTE3OTgyNDkxMjYyIiwiaXNVc2VyIjp0cnVlLCJleHAiOjE2NzUzNzAxNTUsInVzZXJJZCI6IjRlMjUzNjBlLTk2N2QtNDViZS05MWNiLTVlYThmNDlmZDIyMiIsImlhdCI6MTY3NTM1MjE1NX0._awpbx5vWlgsEB068ElcXjAts1jNM6dPx-dPOlzS-kBKtcIiN9di9d4fhnGQNx6DjLfoctrYwqROZxrL-xo1SA";
  void fetchData(String orderid) async {
    final url =
        "https://swift-cafe-dev.swifttrackmile.codes/orderStatus/$orderid";
    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    final decodedData = json.decode(response.body) as Map<String, dynamic>;
    if (decodedData['message'] == 'SUCCESS') {
      orderState = decodedData['data']['orderState'];
      estTime = decodedData['data']['estTime'];
      notifyListeners();
    }
  }
}
