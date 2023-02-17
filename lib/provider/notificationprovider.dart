import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:inter_coffee/provider/authconst.dart';
import 'package:inter_coffee/provider/loginhandler/loginsharedpref.dart';
import '../models/notificationmodal.dart';
import 'package:http/http.dart' as http;

class NotificationProvider with ChangeNotifier {
  List<NotificatonModal> notificatins = [];

  Future<void> fetchNotifications() async {
    notificatins.clear();
    final accessTokken = await getToken();

    const url = "$baseurl/getNotifications";

    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $accessTokken',
    });
    if (response.statusCode == 200) {
      final loadedData = json.decode(response.body);
      if (loadedData['message'] == 'SUCCESS') {
        final loadNotification = loadedData['data'] as List<dynamic>;
        loadNotification.forEach((element) {
          final data = element as Map<String, dynamic>;
          notificatins.add(NotificatonModal.fromJson(data));
        });
      }
      print(notificatins.toString());
      print(notificatins.length);
      notifyListeners();
    }
  }

  void clearNotifications() {
    notificatins.clear();
    notifyListeners();
  }
}
