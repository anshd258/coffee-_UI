import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:inter_coffee/client/merchant_api_handler.dart';

import 'package:inter_coffee/provider/loginhandler/login_functions.dart';
import 'package:inter_coffee/widgets/error_snackbar.dart';

import '../../models/order_details_model.dart';

import '../../constants/auth_const.dart';

class PriorityOrderProvider with ChangeNotifier {
  List<OrderDetails>? priorityOrders;

  Future<void> getPriorityOrders( BuildContext context ) async {
    final data = loginhandler().getData();
    final accessTokken = data!.token;
    const url = "$baseurl/getNotCompletedPriorityOrdersList";
    final response = await MerchantApiHandler().getApiCall(url, accessTokken);
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
    else if( response.statusCode == 204 ) {
      errorSnackBar(context, "No content received from server");
    }
    else if( response.statusCode == 400 ) {
      errorSnackBar(context, "Wrong Syntax");
    }
    else if( response.statusCode == 401 ) {
      errorSnackBar(context, "Unauthorized Access");
    }
    else if( response.statusCode == 403 ) {
      errorSnackBar(context, "Permission to resource forbidden");
    }
    else if( response.statusCode == 404 ) {
      errorSnackBar(context, "Resource not found on server");
    }
    else if( response.statusCode == 500 ) {
      errorSnackBar(context, "Internal server error");
    }
    else if( response.statusCode == 502 ) {
      errorSnackBar(context, "Bad Gateway: Invalid response received");
    }
    else if( response.statusCode == 503 ) {
      errorSnackBar(context, "Server unreachable due to maintenance or overload");
    } 
    else {
      errorSnackBar(context, "Please Contact Admin");
    }

  }
}
