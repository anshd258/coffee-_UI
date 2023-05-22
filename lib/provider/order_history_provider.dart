import 'dart:convert';

import 'package:inter_coffee/client/user_api_handler.dart';
import 'package:inter_coffee/models/order_history_model.dart';

import 'package:flutter/material.dart';
import 'package:inter_coffee/provider/loginhandler/login_functions.dart';

import '../constants/auth_const.dart';

class OrderHistory with ChangeNotifier {

  List<OrderHistoryModel>? _orderList;
  bool isloading = true;
  bool dataLoading = false;

  List<OrderHistoryModel>? get History {
    return _orderList;
  }

  void init() {
    isloading = true;
  }

  Future<void> fetchOrders() async {
    _orderList = [];
    _orderList!.clear();
    final data = loginhandler().getData();
    final accessTokken = data!.token;
    const url = '$baseurl/orderHistory';
    try {
      final response = await UserApiHandler().getApiCall(url, accessTokken);
      final responseData = json.decode(response.body) as Map<String, dynamic>;
      if (responseData['message'] == 'SUCCESS') {
        converter(responseData);
      }
    } finally {
      isloading = false;
      notifyListeners();
    }
  }

  void converter(Map<String, dynamic> responseData) {
    final loadedData = responseData['data'] as List<dynamic>;
    _orderList = [];
    for (var element in loadedData) {
      if (element['items'] != null) {
        _orderList!.add(OrderHistoryModel.fromJson(element));
      }
    }
    for (var element in _orderList!) {}
  }

  Future<OrderHistoryModel> getOrderhistory(String id) async {
    final data = loginhandler().getData();
    final accessTokken = data!.token;
    print(accessTokken);
    String url = '$baseurl/getOrderDetails/$id';
    dataLoading = true;
    notifyListeners();
    final responsep = await UserApiHandler().getApiCall(url, accessTokken);
    dataLoading = false;
    notifyListeners();

    if (responsep.statusCode == 200) {
      final responseData =
          await json.decode(responsep.body) as Map<String, dynamic>;
      final loadedData = responseData['data'];

      return OrderHistoryModel.fromJson(responseData['data']);
    } else {
      throw ("error connecting the network");
    }
  }
}
