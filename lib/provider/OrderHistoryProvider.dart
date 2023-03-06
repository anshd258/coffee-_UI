import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:inter_coffee/models/order_history_model.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'authconst.dart';
import 'loginhandler/loginmodel.dart';

class OrderHistory with ChangeNotifier {
  List<OrderHistoryModel>? _orderList;
  bool isloading = false;
  bool dataLoading = false;
  List<OrderHistoryModel>? get History {
    return _orderList;
  }

  Future<void> fetchOrders() async {
    _orderList = [];
    _orderList!.clear();
      final box = Hive.box<loginStorage>("session");
    final data = box.get("session");
    final accessTokken = data!.token;
    const url = '$baseurl/orderHistory';
    isloading = true;
    notifyListeners();
    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $accessTokken',
    });
    isloading = false;
    notifyListeners();
    final responseData = json.decode(response.body) as Map<String, dynamic>;
    if (responseData['message'] == 'SUCCESS') {
      print("OrderHistoryProvider -> sucess");
      final loadedData = responseData['data'] as List<dynamic>;
      // print(loadedData.toString());
      print("LoadedData length -> ${loadedData.length}");
      _orderList = [];
      for (var element in loadedData) {
        if (element['items'] != null) {
          _orderList!.add(OrderHistoryModel.fromJson(element));
        }
      }
      for (var element in _orderList!) {
        print(element.toJson());
      }
      print("OrderList length -> ${_orderList!.length}");
      notifyListeners();
    }
  }

  Future<OrderHistoryModel> getOrderhistory(String id) async {
       final box = Hive.box<loginStorage>("session");
    final data = box.get("session");
    final accessTokken = data!.token;
    String url = '$baseurl/getOrderDetails/$id';
    dataLoading = true;
    notifyListeners();
    final responsep = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $accessTokken',
    });
    dataLoading = false;
    notifyListeners();
    //print(responsep.body);
    if (responsep.statusCode == 200) {
      final responseData =
          await json.decode(responsep.body) as Map<String, dynamic>;
      final loadedData = responseData['data'];

      // print(loadedData);
      return OrderHistoryModel.fromJson(responseData['data']);
    } else {
      throw ("error connecting the network");
    }
  }
}
