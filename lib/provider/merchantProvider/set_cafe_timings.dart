import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:inter_coffee/client/merchant_api_handler.dart';
import 'package:inter_coffee/client/user_api_handler.dart';
import 'package:inter_coffee/constants/auth_const.dart';
import 'package:inter_coffee/models/cafe_timings.dart';
import 'package:inter_coffee/provider/loginhandler/login_functions.dart';
import 'package:inter_coffee/widgets/snackbar.dart';

class SetCafeTimings with ChangeNotifier {
  List<CafeTimings>? cafeTimings;
  String? message;
  bool? isShopClosed;

  void changeShopStatus( bool value ) {
    isShopClosed = value;
  }

  Future<void> getCafeTimings() async {

    final data = loginhandler().getData();
    final accessTokken = data!.token;
    const url = "$baseurl/cafeTimings/";
    final response = await MerchantApiHandler().getApiCall(url, accessTokken);

    if (response.statusCode == 200) {
      final loadedResponse = json.decode(response.body);

      if (loadedResponse['message'] == 'SUCCESS') {
        if (loadedResponse['data']['cafeTimings'] != null) {
          cafeTimings = <CafeTimings>[];
          loadedResponse['data']['cafeTimings'].forEach((v) {
            cafeTimings!.add(CafeTimings.fromJson(v));
          });
        }
        message = loadedResponse['data']['message'];
        notifyListeners();
      }
    } else {
      throw( "${response.statusCode}");
    }
  }

  Future<void> setCafeTimings( BuildContext context, Map<String, dynamic> postingData ) async {
    final data = loginhandler().getData();
    final accessTokken = data!.token;
    const url = "$baseurl/cafeTimings/";
    
    final timings = json.encode(postingData);
    print(timings);
    final response = await UserApiHandler().postApiCall(url, accessTokken, timings);
    print(response.statusCode);
    if (response.statusCode == 200) {
      snakbarmethod(context, "Timings Set :)");
      notifyListeners();
    }
  }
}
