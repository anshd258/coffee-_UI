import 'dart:convert';
import 'package:hive/hive.dart';

import '../../models/order_details_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../authconst.dart';
import '../loginhandler/loginmodel.dart';


class PriorityOrderProvider with ChangeNotifier {
  List<OrderDetails>? priorityOrders;

  Future<void> getPriorityOrders() async {
      final box = Hive.box<loginStorage>("session");
    final data = box.get("session");
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
