// ignore: file_names
import 'dart:convert';
import 'package:hive/hive.dart';

import 'authconst.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'loginhandler/loginmodel.dart';


class ReportsProvider with ChangeNotifier {
  List<dynamic> reportsData = [];

  Future<void> fetchReports(String startDate, String endDate) async {
    print(startDate);
    print(endDate);
      final box = Hive.box<loginStorage>("session");
    final data = box.get("session");
    final accessTokken = data!.token;
    var headers = {
      'Authorization': 'Bearer $accessTokken',
      'Content-Type': 'application/json'
    };
    var request = http.Request('GET', Uri.parse('$baseurl/report'));
    request.body = json.encode({"startDate": startDate, "endDate": endDate});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final data = await response.stream.bytesToString();
      final decodedData = json.decode(data);
      print(decodedData['data']);
      reportsData = decodedData['data'] as List<dynamic>;
      notifyListeners();
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
}
