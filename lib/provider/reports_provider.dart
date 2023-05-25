// ignore: file_names
import 'dart:convert';

import 'package:inter_coffee/client/admin_api_handler.dart';
import 'package:inter_coffee/provider/loginhandler/login_functions.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:inter_coffee/widgets/error_snackbar.dart';

class ReportsProvider with ChangeNotifier {
  List<dynamic> reportsData = [];

  Future<void> fetchReports(BuildContext context, String startDate, String endDate) async {
    final data = loginhandler().getData();
    final accessTokken = data!.token;

    http.StreamedResponse response = await AdminApiHandler()
        .repoortsApiHandler(accessTokken, startDate, endDate);

    if (response.statusCode == 200) {
      await converter(response);
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

    //   final url = Uri.https("swift-cafe-dev.swifttrackmile.codes", "/report",
    //       {"startDate": startDate, "endDate": endDate});
    //   final response = await http.get(url, headers: {
    //     'Content-Type': 'application/json',
    //     'Accept': 'application/json',
    //     'Authorization': 'Bearer $accessTokken',
    //   });
    //   final respo = await  await http.put(
    //   url,
    //   headers: <String, String>{
    //     'Content-Type': 'application/json; charset=UTF-8',
    //   },
    //   body: jsonEncode(<String, String>{
    //     'startDate': '2023-01-01T02:47:08.133+00:00',
    //     'endDate': '2023-02-28T02:47:08.133+00:00',
    //   }),
    // );
    //   print(response.body);
    //   if (response.statusCode == 200) {
    //     final loadedData = json.decode(response.body);
    //     if (loadedData['message'] == 'SUCCESS') {
    //       reportsData = loadedData['data'] as Map<String, dynamic>;
    //       print(reportsData);
    //       notifyListeners();
    //     }
    //   }
  }

  Future<void> converter(http.StreamedResponse response) async {
    final data = await response.stream.bytesToString();
    final decodedData = json.decode(data);

    reportsData = decodedData['data'] as List<dynamic>;
    notifyListeners();
  }
}
