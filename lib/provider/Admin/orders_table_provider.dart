import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:inter_coffee/provider/loginhandler/loginsharedpref.dart';

String placedOrders = '';
Future<String> getOrdersPlaced() async {
  final accessTokken = await getToken();
  print(" new access tokken $accessTokken");
  const url =
      "https://swift-cafe-dev.swifttrackmile.codes/getOrders/ORDER_PLACED";
  final response = await http.get(Uri.parse(url), headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $accessTokken',
  });
  final responseData = json.decode(response.body);
  print(responseData['data']);
  placedOrders = responseData['data'].toString();
  return responseData['data'].toString();
}
