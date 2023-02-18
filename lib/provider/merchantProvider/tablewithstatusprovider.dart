import 'dart:convert';

import '../../models/order_details_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../authconst.dart';
import '../loginhandler/loginsharedpref.dart';

class TableWithStatusProvider with ChangeNotifier {
  List<dynamic>? orderJsonTableData;

  Future<void> getOrders(String route) async {
    final accessTokken = await getToken();
    final url = "$baseurl/getOrders/$route";
    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $accessTokken',
    });
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      if (responseData['message'] == 'SUCCESS') {
        final List<OrderDetails> loadedordersdetails = [];
        final loadData = responseData['data'] as List<dynamic>;
        if (loadData.isEmpty) {
          orderJsonTableData = [];
        } else if (loadData.isNotEmpty) {
          orderJsonTableData = loadData;
        }
      }

      notifyListeners();
    }
  }
}
