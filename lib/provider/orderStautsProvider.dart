import 'dart:convert';
import './loginAuthProvider.dart';
import 'package:flutter/material.dart';
import '../models/order_details_model.dart';
import 'package:http/http.dart' as http;

class MyData with ChangeNotifier {
  String? orderState;
  String? estTime;

   final accessToken =
      "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIrOTE3OTgyNDkxMjYyIiwiaXNVc2VyIjp0cnVlLCJleHAiOjE2NzUzNjg4NzQsInVzZXJJZCI6IjRlMjUzNjBlLTk2N2QtNDViZS05MWNiLTVlYThmNDlmZDIyMiIsImlhdCI6MTY3NTM1MDg3NH0.3Xfc4LFvaXPQ1teSX9fZmR69MAFAVW4mFFSEzVvsReKOs_HxEkVxmamDaUV_CGpHGLHnS9GscZaB1wPQ14WrSg";
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
