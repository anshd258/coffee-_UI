import 'dart:convert';
import 'package:inter_coffee/provider/authconst.dart';
import 'package:inter_coffee/provider/loginAuthProvider.dart';
import 'package:inter_coffee/models/products_list_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:inter_coffee/provider/loginhandler/loginsharedpref.dart';

class OrdersTable with ChangeNotifier {
  Future<String> getOrdersPlaced() async {
    final accessTokken = await getToken();
    print(" new access tokken $accessTokken");
    const url =
        "https://swift-cafe-dev.swifttrackmile.codes/getOrders/ORDER_PLACED";
    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $accessTokken',
    });
    final responseData = json.decode(response.body);
    print(responseData);
    notifyListeners();
    return responseData;
  }
}
