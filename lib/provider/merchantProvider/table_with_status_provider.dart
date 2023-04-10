import 'dart:async';
import 'dart:convert';

import 'package:inter_coffee/client/merchant_api_handler.dart';
import 'package:inter_coffee/provider/loginhandler/login_functions.dart';
import 'package:inter_coffee/widgets/snackbar.dart';

import '../../models/order_details_model.dart';
import 'package:flutter/material.dart';

import '../../constants/auth_const.dart';

class TableWithStatusProvider with ChangeNotifier {
  List<dynamic>? orderJsonTableData;
  Timer? timer;

  Future<void> getOrders(String route) async {
    final data = loginhandler().getData();
    final accessTokken = data!.token;
    final url = "$baseurl/getOrders/$route";
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

  void getOrderWithStatus(String route) {
    if (timer != null) {
      timer!.cancel();
    }

    timer = Timer.periodic(
      const Duration(seconds: 2),
      (timer) {
        getOrders(route);
      },
    );
  }

  Future<void> updateOrderStatus(String timeGiven, String id) async {
    DateTime time = DateTime.now().add(Duration(minutes: int.parse(timeGiven)));

    final data = loginhandler().getData();
    final accessTokken = data!.token;
    const url = "$baseurl/updateOrderStatus";
    final body = json.encode({
      "orderId": id,
      "orderState": "ORDER_CONFIRMED",
      "estTime": time.toIso8601String()
    });
    final response =
        await MerchantApiHandler().putApiCall(url, accessTokken, body);

    if (response.statusCode == 200) {
      getOrders("ORDER_PLACED");
    }
  }

  Future<void> updateOrderStatusWithoutTime(
      String nextstate, String id, String previusState) async {
    final data = loginhandler().getData();
    final accessTokken = data!.token;
    const url = "$baseurl/updateOrderStatus";
    final body = json.encode({
      "orderId": id,
      "orderState": nextstate,
    });
    final response =
        await MerchantApiHandler().putApiCall(url, accessTokken, body);

    if (response.statusCode == 200) {
      getOrders(previusState);
    }
  }
}
