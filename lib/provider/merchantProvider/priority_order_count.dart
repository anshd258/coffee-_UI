import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:inter_coffee/constants/authconst.dart';
import 'package:http/http.dart' as http;
import 'package:inter_coffee/provider/loginhandler/login_functions.dart';

class PriorityOrderCount with ChangeNotifier {
  int? count;

  Future<void> getCount() async {
    final data = loginhandler().getData();
    final accessTokken = data!.token;
    const url = "$baseurl/getPriorityOrdersCount";
    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $accessTokken',
    });
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
