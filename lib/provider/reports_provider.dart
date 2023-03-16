// ignore: file_names
import 'dart:convert';

import 'package:inter_coffee/client/adminApiHandler.dart';
import 'package:inter_coffee/provider/loginhandler/login_functions.dart';

import '../constants/authconst.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ReportsProvider with ChangeNotifier {
  List<dynamic> reportsData = [];

  Future<void> fetchReports(String startDate, String endDate) async {
    print(startDate);
    print(endDate);
    final data = loginhandler().getData();
    final accessTokken = data!.token;

    http.StreamedResponse response =
        await AdminApiHandler().repoortsApiHandler(accessTokken, startDate, endDate);

    if (response.statusCode == 200) {
      await converter(response);
    } else {
      print(response.reasonPhrase);
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
    print(decodedData['data']);
    reportsData = decodedData['data'] as List<dynamic>;
    notifyListeners();
  }
}
