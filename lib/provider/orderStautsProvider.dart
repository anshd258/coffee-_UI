import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:inter_coffee/provider/authconst.dart';
import 'package:inter_coffee/provider/loginhandler/loginmodel.dart';



class MyData with ChangeNotifier {
  String? orderState;
  String? estTime;

  void fetchData(String orderid) async {
       final box = Hive.box<loginStorage>("session");
    final data = box.get("session");
    final accessTokken = data!.token;
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
      const Duration(seconds: 1),
      () {
        orderState = null;
        estTime = null;
      },
    );
    print("this is orderstatus after dispose$orderState");
    notifyListeners();
  }
}
