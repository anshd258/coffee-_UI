import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:inter_coffee/client/user_api_handler.dart';
import 'package:inter_coffee/constants/auth_const.dart';
import 'package:inter_coffee/provider/loginhandler/login_functions.dart';

class MyData with ChangeNotifier {
  String? orderState;
  String? estTime;

  void fetchData(String orderid) async {
    final data = loginhandler().getData();
    final accessTokken = data!.token;
    final url = "$baseurl/orderStatus/$orderid";

    final response = await UserApiHandler().getApiCall(url, accessTokken);
    final decodedData = json.decode(response.body) as Map<String, dynamic>;
    if (decodedData['message'] == 'SUCCESS') {
      convverter(decodedData);
      notifyListeners();
    }
  }

  void convverter(Map<String, dynamic> decodedData) {
    orderState = decodedData['data']['orderState'];
    print("this is state -> $orderState");
    estTime = decodedData['data']['estTime'];
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
