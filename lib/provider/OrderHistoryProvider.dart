import 'dart:convert';
import 'package:inter_coffee/models/order_history_model.dart';

import './loginhandler/loginsharedpref.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class OrderHistory with ChangeNotifier {
  final List<OrderHistoryModel> _orderList = [];

  List<OrderHistoryModel> get History {
    return _orderList;
  }

  Future<void> fetchOrders() async {
    final accessTokken = await getToken();
    const url = 'https://swift-cafe-dev.swifttrackmile.codes/orderHistory';
    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $accessTokken',
    });
    print("here too");
    final responseData = json.decode(response.body) as Map<String, dynamic>;
    if (responseData['message'] == 'SUCCESS') {
      print("OrderHistoryProvider -> sucess");
      final loadedData = responseData['data'];
      if (loadedData.first != null &&
          loadedData.first['id'] == "41652fa1-c712-4711-a191-23fb9ddcb997") {
        _orderList.add(OrderHistoryModel.fromJson(loadedData.first));
      }
      // int len = _orderList.length;
      // for( int i = 0; i < len; i++ ) {
      //   Items it = _orderList[i].items;
      //   if( _orderList[i].items == null || _orderList.first.items)
      // }
      for (var element in _orderList) {
        print(element.toJson());
      }
      // _orderList = loadedOrders;
      notifyListeners();
    }
  }
}
