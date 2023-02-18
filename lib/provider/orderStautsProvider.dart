import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:inter_coffee/provider/authconst.dart';

import 'loginhandler/loginsharedpref.dart';

class MyData with ChangeNotifier {
  String? orderState;
  String? estTime;

  void fetchData(String orderid) async {
    final accessTokken = await getToken();
    final url = "$baseurl/orderStatus/$orderid";
    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $accessTokken',
    });
    final decodedData = json.decode(response.body) as Map<String, dynamic>;
    if (decodedData['message'] == 'SUCCESS') {
      orderState = decodedData['data']['orderState'];
      print("this is state -> $orderState");
      estTime = decodedData['data']['estTime'];
      notifyListeners();
    }
  }

  void clearPrevoiusStatus() {
    Future.delayed(
      Duration(seconds: 1),
      () {
        orderState = "";
        estTime = "";
      },
    );
    print("this is orderstatus after dispose" + orderState.toString());
    notifyListeners();
  }
}
