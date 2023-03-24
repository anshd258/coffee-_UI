import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:inter_coffee/client/merchant_api_handler.dart';

import 'package:inter_coffee/constants/auth_const.dart';
import 'package:inter_coffee/provider/loginhandler/login_functions.dart';

class PriorityOrderCount with ChangeNotifier {
  int? count;

  Future<void> getCount() async {
    final data = loginhandler().getData();
    final accessTokken = data!.token;
    const url = "$baseurl/getPriorityOrdersCount";
    final response = await MerchantApiHandler().getApiCall(url, accessTokken);
    if (response.statusCode == 200) {
      final loadedResponse = json.decode(response.body);
      print(loadedResponse);
      if (loadedResponse['message'] == 'SUCCESS') {
        count = loadedResponse['data'];
        notifyListeners();
      }
    }
  }
}
