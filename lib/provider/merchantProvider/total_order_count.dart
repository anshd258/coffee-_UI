import 'dart:convert';
import 'package:inter_coffee/client/merchantApiHandler.dart';

import '../loginhandler/login_functions.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../../constants/authconst.dart';

class TotalOrderCount with ChangeNotifier {
  int? count;

  Future<void> getCount() async {
    final accessTokken = loginhandler().gettokken();
    const url = "$baseurl/getOrdersCount";
    final response = await MerchantApiHandler(). getApiCall(url, accessTokken);
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
