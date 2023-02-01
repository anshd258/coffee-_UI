import 'dart:convert';

import 'package:flutter/material.dart';
import '../models/order_details_model.dart';
import 'package:http/http.dart' as http;

class MyData with ChangeNotifier {
  String? orderState;
  String? estTime;

  final token =
      "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIrOTE3OTgyNDkxMjYyIiwiaXNVc2VyIjp0cnVlLCJleHAiOjE2NzUzMDE2NDksInVzZXJJZCI6IjRlMjUzNjBlLTk2N2QtNDViZS05MWNiLTVlYThmNDlmZDIyMiIsImlhdCI6MTY3NTI4MzY0OX0.9XDdZLxCqDwmUQ8xGNpx4Rp07b098srHUZ1nsV0aZnY76HlMT5QZgmUZeRC8dDKBw5s2ue_3YlEYobeB6WzX4g";
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
