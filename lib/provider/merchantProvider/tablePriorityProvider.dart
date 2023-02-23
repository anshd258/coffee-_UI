import 'dart:convert';

import '../../models/order_details_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../authconst.dart';
import '../loginhandler/loginsharedpref.dart';

class TablePriorityProvider with ChangeNotifier {
  List<dynamic>? orderJsonTableData;

  Future<void> getOrders(String route) async {
    final accessTokken = await getToken();
    final url = "$baseurl/getPriorityOrders/$route";
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

  Future<void> updateOrderStatus(String timeGiven, String id) async {
    DateTime time = DateTime.now();
    time.add(Duration(minutes: int.parse(timeGiven)));

    final accessTokken = await getToken();
    const url = "$baseurl/updateOrderStatus";
    final response = await http.put(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $accessTokken',
        },
        body: json.encode({
          "orderId": id,
          "orderState": "ORDER_CONFIRMED",
          "estTime": time.toIso8601String()
        }));
    print(response.statusCode);
    if (response.statusCode == 200) {
      getOrders("ORDER_PLACED");
    }
  }

  Future<void> updateOrderStatusWithoutTime(
      String nextstate, String id, String previusState) async {
    final accessTokken = await getToken();
    const url = "$baseurl/updateOrderStatus";
    final response = await http.put(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $accessTokken',
        },
        body: json.encode({
          "orderId": id,
          "orderState": nextstate,
        }));
    print(response.statusCode);
    if (response.statusCode == 200) {
      getOrders(previusState);
    }
  }
}