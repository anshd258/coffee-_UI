import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:inter_coffee/client/userApiHandler.dart';
import 'package:inter_coffee/models/user_details_model.dart';
import 'package:inter_coffee/constants/auth_const.dart';
import 'package:inter_coffee/provider/loginhandler/login_functions.dart';

class userDetailsProvider with ChangeNotifier {
  UserDetails? currentUserDetails;

  Future<void> getUserDetails() async {
    final data = loginhandler().getData();
    final accessTokken = data!.token;
    const url = "$baseurl/profile";
    final apiHandler = UserApiHandler();
    final response = await UserApiHandler().getApiCall(url, accessTokken);
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
