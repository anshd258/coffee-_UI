import 'package:inter_coffee/client/merchant_api_handler.dart';
import 'package:inter_coffee/provider/loginhandler/login_functions.dart';

import 'dart:convert';

import 'package:inter_coffee/models/order_details_model.dart';
import 'package:inter_coffee/constants/auth_const.dart';


import 'package:flutter/material.dart';

List<dynamic> jsonToDecode = [];

class AllOrderProvider with ChangeNotifier {
  List<OrderDetails>? orders;
  Future<String> getOrders() async {
    final data = loginhandler().getData();
    final accessTokken = data!.token;

    const url = "$baseurl/getNotCompletedOrdersList";
    final response = await MerchantApiHandler().getApiCall(url, accessTokken);
    print(response.body);
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
