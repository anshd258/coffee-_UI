import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:inter_coffee/provider/loginhandler/login_functions.dart';

import '../../models/order_details_model.dart';

import 'package:http/http.dart' as http;
import '../../constants/auth_const.dart';

class PriorityOrderProvider with ChangeNotifier {
  List<OrderDetails>? priorityOrders;

  Future<void> getPriorityOrders() async {
    final data = loginhandler().getData();
    final accessTokken = data!.token;
    const url = "$baseurl/getNotCompletedPriorityOrdersList";
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
        for (var element in loadData) {
          final data = element as Map<String, dynamic>;
          loadedordersdetails.add(OrderDetails.fromJson(data));
        }
        priorityOrders = loadedordersdetails;
        notifyListeners();
      }
    }
  }
}
