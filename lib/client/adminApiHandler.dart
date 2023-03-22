import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:inter_coffee/constants/auth_const.dart';

class AdminApiHandler {
  Future<http.StreamedResponse> repoortsApiHandler(
      String accessTokken, String startDate, String endDate) async {
    var headers = {
      'Authorization': 'Bearer $accessTokken',
      'Content-Type': 'application/json'
    };
    var request = http.Request('GET', Uri.parse('$baseurl/report'));
    request.body = json.encode({"startDate": startDate, "endDate": endDate});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    return response;
  }
}
