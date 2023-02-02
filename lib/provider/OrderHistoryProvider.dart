import 'dart:convert';

import 'package:flutter/material.dart';
import '../models/order_details_model.dart';
import 'package:http/http.dart' as http;

class OrderHistory with ChangeNotifier {
  List<Data> _orderList = [];

  List<Data> get History {
    return _orderList;
  }

  final token =
      "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIrOTE3OTgyNDkxMjYyIiwiaXNVc2VyIjp0cnVlLCJleHAiOjE2NzUzNzAxNTUsInVzZXJJZCI6IjRlMjUzNjBlLTk2N2QtNDViZS05MWNiLTVlYThmNDlmZDIyMiIsImlhdCI6MTY3NTM1MjE1NX0._awpbx5vWlgsEB068ElcXjAts1jNM6dPx-dPOlzS-kBKtcIiN9di9d4fhnGQNx6DjLfoctrYwqROZxrL-xo1SA";
  Future<void> fetchOrders() async {
    final url = 'https://swift-cafe-dev.swifttrackmile.codes/orderHistory';
    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    final responseData = json.decode(response.body) as Map<String, dynamic>;
    if (responseData['message'] == 'SUCCESS') {
      print("sucess");
      _orderList.add(Data(
          orderId: "13214",
          priority: false,
          orderNo: "1212",
          createdDate: "2023-01-25T12:37:25.010+00:00",
          currentState: "progress"));
      notifyListeners();
      // final List<Data> loadedOrders = [];
      // responseData['data'].forEach((orderData) {
      //   loadedOrders.add(Data(
      //     orderId: orderData['orderId'],
      //     orderNo: orderData['orderNo'],
      //     userId: UserId(
      //       id: orderData['userId']['id'],
      //       phoneNo: orderData['userId']['phoneNo'],
      //       name: orderData['userId']['name'],
      //     ),
      //     createdDate: orderData['createdDate'],
      //     currentState: orderData['currentState'],
      //     nextStateEstTime: orderData['next_state_est_time'],
      //     priority: orderData['priority'],
      //   ));
      // });
      // _orderList = loadedOrders;
      notifyListeners();
    }
  }
}
