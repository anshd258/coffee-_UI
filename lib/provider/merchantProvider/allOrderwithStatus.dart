import 'dart:convert';
import 'package:inter_coffee/provider/Admin/orders_table_provider.dart';

import '../../models/order_details_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../authconst.dart';
import '../loginhandler/loginsharedpref.dart';

List<dynamic> jsonToDecode = [];

class AllOrderProvider with ChangeNotifier {
  List<OrderDetails>? orders;
  List<dynamic>? orderJsonTableData;

  Future<void> getOrders() async {
    final accessTokken = await getToken();
    final url = "$baseurl/getOrders/ORDER_PLACED";
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
        orderJsonTableData = loadData;
        loadData.forEach((element) {
          final data = element as Map<String, dynamic>;
          loadedordersdetails.add(OrderDetails.fromJson(data));
        });
        orders = loadedordersdetails;
        notifyListeners();
      }
    }
  }
}
