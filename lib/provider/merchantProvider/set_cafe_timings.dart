import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:inter_coffee/client/merchant_api_handler.dart';
import 'package:inter_coffee/client/user_api_handler.dart';
import 'package:inter_coffee/constants/auth_const.dart';
import 'package:inter_coffee/models/cafe_timings.dart';
import 'package:inter_coffee/provider/loginhandler/login_functions.dart';
import 'package:inter_coffee/widgets/error_snackbar.dart';
import 'package:inter_coffee/widgets/snackbar.dart';

class SetCafeTimings with ChangeNotifier {
  List<CafeTimings>? cafeTimings;
  Map< String, Map<String, String> >? cafeTimingsKeyWise;
  String message = "";
  bool? isShopClosed;

  void changeShopStatus( bool value ) {
    isShopClosed = value;
  }

  Future<void> getCafeStatus( BuildContext context ) async {

    final data = loginhandler().getData();
    final accessTokken = data!.token;
    const url = "$baseurl/cafeTimings/isCafeOpen";
    final response = await MerchantApiHandler().getApiCall(url, accessTokken);

    if (response.statusCode == 200) {
      final loadedResponse = json.decode(response.body);

      if (loadedResponse['message'] == 'SUCCESS') {
        if (loadedResponse['data'] != null) {

          if( loadedResponse['data']['open'] ) {
            changeShopStatus(false);
          } else {
            changeShopStatus(true);
            message = loadedResponse['data']['message'].toString();
          }
        }
        
        // message = loadedResponse['data']['message'];
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

  Future<void> getCafeTimings( BuildContext context ) async {

    final data = loginhandler().getData();
    final accessTokken = data!.token;
    const url = "$baseurl/cafeTimings/";
    final response = await MerchantApiHandler().getApiCall(url, accessTokken);

    if (response.statusCode == 200) {
      final loadedResponse = json.decode(response.body);

      if (loadedResponse['message'] == 'SUCCESS') {
        if (loadedResponse['data']['cafeTimings'] != null) {
          cafeTimings = <CafeTimings>[];
          cafeTimingsKeyWise = {};
          loadedResponse['data']['cafeTimings'].forEach((v) {
            cafeTimings!.add(CafeTimings.fromJson(v));
            cafeTimingsKeyWise![v['day']] = {
              "openTime": v['openTime'],
              "closeTime": v['closeTime']
            };
          });
          print(cafeTimingsKeyWise);
        }
        message = loadedResponse['data']['message'];
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

  Future<void> setCafeTimings(BuildContext context, Map<String, dynamic> postingData ) async {
    final data = loginhandler().getData();
    final accessTokken = data!.token;
    const url = "$baseurl/cafeTimings/";
    
    final timings = json.encode(postingData);
    final response = await UserApiHandler().postApiCall(url, accessTokken, timings);

    if (response.statusCode == 200) {
      notifyListeners();
    }else if( response.statusCode == 204 ) {
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
