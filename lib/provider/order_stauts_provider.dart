import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:inter_coffee/client/user_api_handler.dart';
import 'package:inter_coffee/constants/auth_const.dart';
import 'package:inter_coffee/provider/loginhandler/login_functions.dart';
import 'package:inter_coffee/widgets/error_snackbar.dart';

class MyData with ChangeNotifier {
  String? orderState;
  String? estTime;

  void fetchData(BuildContext context, String orderid) async {
    final data = loginhandler().getData();
    final accessTokken = data!.token;
    final url = "$baseurl/orderStatus/$orderid";

    final response = await UserApiHandler().getApiCall(url, accessTokken);

    if( response.statusCode == 200 ) {
      final decodedData = json.decode(response.body) as Map<String, dynamic>;
      if (decodedData['message'] == 'SUCCESS') {
        convverter(decodedData);
        notifyListeners();
      }
    }
    else if( response.statusCode == 204 ) {
      errorSnackBar(context, "No content received from server");
    }
    else if( response.statusCode == 400 ) {
      errorSnackBar(context, "Wrong Syntax");
    }
    else if( response.statusCode >= 401 ) {
      errorSnackBar(context, "Unauthorized Access");
    }
    else if( response.statusCode >= 500 ) {
      errorSnackBar(context, "Internal server error");
    }
    else {
      errorSnackBar(context, "Please Contact Admin");
    }
    
  }

  Future<String> returnData(BuildContext context, String orderid) async {
    final data = loginhandler().getData();
    final accessTokken = data!.token;
    final url = "$baseurl/orderStatus/$orderid";

    final response = await UserApiHandler().getApiCall(url, accessTokken);

    if( response.statusCode == 200 ) {
      final decodedData = json.decode(response.body) as Map<String, dynamic>;
      if (decodedData['message'] == 'SUCCESS') {
        convverter(decodedData);
        notifyListeners();
        return orderState!;
      }
    }
    else if( response.statusCode == 204 ) {
      errorSnackBar(context, "No content received from server");
    }
    else if( response.statusCode == 400 ) {
      errorSnackBar(context, "Wrong Syntax");
    }
    else if( response.statusCode >= 401 ) {
      errorSnackBar(context, "Unauthorized Access");
    }
    else if( response.statusCode >= 500 ) {
      errorSnackBar(context, "Internal server error");
    }
    else {
      errorSnackBar(context, "Please Contact Admin");
    }

    return "null";
  
  }

  void convverter(Map<String, dynamic> decodedData) {
    orderState = decodedData['data']['orderState'];

    estTime = decodedData['data']['estTime'];
  }

  void clearPrevoiusStatus() {
    Future.delayed(
      const Duration(seconds: 1),
      () {
        orderState = null;
        estTime = null;
      },
    );
    print("this is orderstatus after dispose$orderState");
    notifyListeners();
  }
  
  void clearPrevoiusStatusWithoutFuture() {
    orderState = null;
    estTime = null;
    print("this is orderstatus after dispose$orderState");
    notifyListeners();
  }
}
