import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:inter_coffee/provider/authconst.dart';
import 'package:inter_coffee/provider/loginhandler/loginmodel.dart';

import '../models/notificationmodal.dart';
import 'package:http/http.dart' as http;

class NotificationProvider with ChangeNotifier {
  List<NotificatonModal>? notificatins;
  bool isloading = false;
  Future<void> fetchNotifications() async {
    notificatins = [];
    notificatins!.clear();
       final box = Hive.box<loginStorage>("session");
    final data = box.get("session");
    final accessTokken = data!.token;

    const url = "$baseurl/getNotifications";
    isloading = true;
    notifyListeners();
    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $accessTokken',
    });
    isloading = false;
    notifyListeners();

    if (response.statusCode == 200) {
      final loadedData = json.decode(response.body);
      if (loadedData['message'] == 'SUCCESS') {
        final loadNotification = loadedData['data'] as List<dynamic>;
        for (var element in loadNotification) {
          final data = element as Map<String, dynamic>;
          notificatins!.add(NotificatonModal.fromJson(data));
        }
      }
      print(notificatins.toString());
      print(notificatins!.length);
      notifyListeners();
    }
  }

  Future<void> markNotificationsRead() async {
      final box = Hive.box<loginStorage>("session");
    final data = box.get("session");
    final accessTokken = data!.token;

    const url = "$baseurl/markNotificationAsRead";

    final response = await http.put(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $accessTokken',
    });
  }

  void clearNotifications() {
    notificatins!.clear();
    notificatins = null;
    notifyListeners();
  }
}
