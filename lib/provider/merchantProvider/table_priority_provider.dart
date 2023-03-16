import 'dart:convert';

import 'package:inter_coffee/client/merchantApiHandler.dart';
import 'package:inter_coffee/provider/loginhandler/login_functions.dart';

import '../../models/order_details_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../constants/authconst.dart';

class TablePriorityProvider with ChangeNotifier {
  List<dynamic>? orderJsonTableData;

  Future<void> getOrders(String route) async {
    final data = loginhandler().getData();
    final accessTokken = data!.token;
    final url = "$baseurl/getPriorityOrders/$route";
    final response = await MerchantApiHandler().getApiCall(url, accessTokken);
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

    final data = loginhandler().getData();
    final accessTokken = data!.token;
    const url = "$baseurl/updateOrderStatus";
    final body = json.encode({
          "orderId": id,
          "orderState": "ORDER_CONFIRMED",
          "estTime": time.toIso8601String()
        });
    final response = await MerchantApiHandler().putApiCall(url, accessTokken, body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      getOrders("ORDER_PLACED");
    }
  }

  Future<void> updateOrderStatusWithoutTime(
      String nextstate, String id, String previusState) async {
    final data = loginhandler().getData();
    final accessTokken = data!.token;
    const url = "$baseurl/updateOrderStatus";
    final body =  json.encode({
          "orderId": id,
          "orderState": nextstate,
        });
    final response = await MerchantApiHandler().putApiCall(url, accessTokken, body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      getOrders(previusState);
    }
  }

  
}
