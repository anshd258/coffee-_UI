import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:inter_coffee/client/merchant_api_handler.dart';

import 'package:inter_coffee/constants/auth_const.dart';
import 'package:inter_coffee/provider/loginhandler/login_functions.dart';
import 'package:inter_coffee/widgets/error_snackbar.dart';

class PriorityOrderCount with ChangeNotifier {
  int? count;

  Future<void> getCount( BuildContext context ) async {
    final data = loginhandler().getData();
    final accessTokken = data!.token;
    const url = "$baseurl/getPriorityOrdersCount";
    final response = await MerchantApiHandler().getApiCall(url, accessTokken);
    if (response.statusCode == 200) {
      final loadedResponse = json.decode(response.body);

      if (loadedResponse['message'] == 'SUCCESS') {
        count = loadedResponse['data'];
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
