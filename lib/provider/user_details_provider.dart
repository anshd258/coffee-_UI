import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:inter_coffee/models/user_details_model.dart';
import 'package:inter_coffee/constants/auth_const.dart';
import 'package:http/http.dart' as http;
import 'package:inter_coffee/provider/loginhandler/login_functions.dart';

class userDetailsProvider with ChangeNotifier {
  UserDetails? currentUserDetails;

  Future<void> getUserDetails() async {
    final data = loginhandler().getData();
    final accessTokken = data!.token;
    const url = "$baseurl/profile";
    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $accessTokken',
    });
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      if (responseData['message'] == 'SUCCESS') {
        final loadData = responseData['data'] as Map<String, dynamic>;
        currentUserDetails = UserDetails.fromJson(loadData);
      }
    }
    notifyListeners();
  }
}
