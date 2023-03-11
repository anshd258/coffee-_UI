import 'package:inter_coffee/provider/loginhandler/loginfunctions.dart';

import 'dart:convert';

import 'package:inter_coffee/models/order_details_model.dart';
import 'package:inter_coffee/constants/authconst.dart';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

List<dynamic> jsonToDecode = [];

class AllOrderProvider with ChangeNotifier {
  List<OrderDetails>? orders;
  Future<String> getOrders() async {
    final data = loginhandler().getData();
    final accessTokken = data!.token;

    const url = "$baseurl/getNotCompletedOrdersList";
    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $accessTokken',
    });
    if (response.statusCode != 200) {
      return "token expired";
    }
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      if (responseData['message'] == 'SUCCESS') {
        final List<OrderDetails> loadedordersdetails = [];
        final loadData = responseData['data'] as List<dynamic>;

        for (var element in loadData) {
          final data = element as Map<String, dynamic>;
          loadedordersdetails.add(OrderDetails.fromJson(data));
        }
        orders = loadedordersdetails;
        notifyListeners();
      }
    }
    return "working";
  }
}
