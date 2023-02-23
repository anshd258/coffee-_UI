import 'dart:convert';
import '../../models/order_details_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../authconst.dart';
import '../loginhandler/loginsharedpref.dart';

class PriorityOrderProvider with ChangeNotifier {
  List<OrderDetails> priorityOrders = [];

  Future<void> getPriorityOrders() async {
    final accessTokken = await getToken();
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
