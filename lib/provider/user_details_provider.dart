import 'dart:convert';

import 'package:inter_coffee/models/user_details_model.dart';
import 'package:inter_coffee/provider/authconst.dart';
import 'package:inter_coffee/provider/loginhandler/loginsharedpref.dart';
import 'package:http/http.dart' as http;

UserDetails? currentUserDetails;

Future<UserDetails> getUserDetails() async {
  final accessTokken = await getToken();
  final url = "$baseurl/profile";
  final response = await http.get(Uri.parse(url), headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $accessTokken',
  });
  if (response.statusCode == 200) {
    final responseData = json.decode(response.body);
    if (responseData['message'] == 'SUCCESS') {
      final loadData = responseData['data'] as Map<String,dynamic>;
      currentUserDetails = UserDetails.fromJson(loadData);
    }
  }
  return currentUserDetails!;
}