import 'dart:convert';
import '../loginhandler/loginfunctions.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../../constants/authconst.dart';

class TotalOrderCount with ChangeNotifier {
  int? count;

  Future<void> getCount() async {
    final accessTokken = loginhandler().gettokken();
    const url = "$baseurl/getOrdersCount";
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
