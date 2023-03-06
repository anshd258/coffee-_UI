import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:inter_coffee/provider/authconst.dart';



import '../loginhandler/loginmodel.dart';

String placedOrders = '';
Future<String> getOrdersPlaced() async {
     final box = Hive.box<loginStorage>("session");
    final data = box.get("session");
    final accessTokken = data!.token;
  print(" new access tokken $accessTokken");
  const url = "$baseurl/getOrders/ORDER_PLACED";
  final response = await http.get(Uri.parse(url), headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $accessTokken',
  });
  final responseData = jsonDecode(response.body);
  // print(responseData['data']);
  // placedOrders = responseData['data'].toString();
  List<Map<String, dynamic>> listans =
      responseData['data'].cast<Map<String, dynamic>>();
  String ans = listans.toString().replaceAll("null", "ORDER01");
  // placedOrders = ans;
  // print(ans);
  return ans;
}
