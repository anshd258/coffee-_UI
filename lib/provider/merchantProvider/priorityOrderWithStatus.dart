import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:inter_coffee/client/merchantApiHandler.dart';

import 'package:inter_coffee/provider/loginhandler/loginfunctions.dart';

import '../../models/order_details_model.dart';

import 'package:http/http.dart' as http;
import '../../constants/authconst.dart';

class PriorityOrderProvider with ChangeNotifier {
  List<OrderDetails>? priorityOrders;

  Future<void> getPriorityOrders() async {
    final data = loginhandler().getData();
    final accessTokken = data!.token;
    const url = "$baseurl/getNotCompletedPriorityOrdersList";
    final response = await  MerchantApiHandler(). getApiCall(url, accessTokken);
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
