import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:inter_coffee/widgets/error_snackbar.dart';

import '../loginhandler/login_functions.dart';
import 'package:http/http.dart' as http;
import 'package:inter_coffee/constants/auth_const.dart';

String placedOrders = '';
Future<String> getOrdersPlaced( BuildContext context ) async {
  final data = loginhandler().getData();
  final accessTokken = data!.token;

  const url = "$baseurl/getOrders/ORDER_PLACED";
  final response = await http.get(Uri.parse(url), headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $accessTokken',
  });

  if( response.statusCode == 200 ) {
    final responseData = jsonDecode(response.body);
    List<Map<String, dynamic>> listans = responseData['data'].cast<Map<String, dynamic>>();
    String ans = listans.toString().replaceAll("null", "ORDER01");
    
    return ans;
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

  return "An error has occurred";
}
